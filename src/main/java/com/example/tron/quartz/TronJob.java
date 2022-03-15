package com.example.tron.quartz;

import cn.hutool.http.HttpUtil;
import com.example.tron.dao.*;
import com.example.tron.entity.*;
import com.example.tron.utils.TronAddress;
import com.example.tron.utils.TronTransaction;
import com.example.tron.utils.TronUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.*;

/**
 * @author wyh
 * @create: 2022-03-02 15:27
 * @Description : 定时任务
 */
@Slf4j
@Component
public class TronJob {

    @Autowired
    private TronUtils tronUtils;

    @Autowired
    private MCoinRechargeAddrPoolMapper coinRechargeAddrPoolMapper;

    @Autowired
    private MCurrencyBlockMapper mCurrencyBlockMapper;

    @Autowired
    private MCoinRechargeAddrMapper mCoinRechargeAddrMapper;

    @Autowired
    private MCoinRechargeMapper mCoinRechargeMapper;

    @Autowired
    private MConfigMapper mConfigMapper;

    @Autowired
    private MTransferMapper mTransferMapper;


    /**
     * 生成地址
     */
    @Scheduled(cron = "0 0/5 * * * ?")
    public void createAddress() {
        int addressCount = coinRechargeAddrPoolMapper.countTrxAddress();
        // 判断地址池中的数量是否小于预留数
        if (addressCount >= 100) {
            log.info("<===== 地址池剩余:【{}】", addressCount);
            return;
        }

        int createAddrNum = 100 - addressCount;
        List<MCoinRechargeAddrPool> addressList = new ArrayList<>(createAddrNum);
        // 批量生成
        for (int i = 0; i < createAddrNum; i++) {
            TronAddress address = tronUtils.getAddress();
            if (address == null) {
                continue;
            }
            MCoinRechargeAddrPool mCoinRechargeAddrPool = new MCoinRechargeAddrPool();
            mCoinRechargeAddrPool.setAddress(address.getAddress());
            mCoinRechargeAddrPool.setPrivateKey(address.getPrivateKey());
            mCoinRechargeAddrPool.setCurrency("TRX");
            addressList.add(mCoinRechargeAddrPool);
        }

        if (CollectionUtils.isEmpty(addressList)) {
            log.error("<===== 批量生成地址失败");
            return;
        }

        coinRechargeAddrPoolMapper.insertAddressBatch(addressList);
        log.info("<===== 生成地址结束size：【{}】", addressList.size());
    }


    /**
     * 回写
     */
    @Scheduled(cron = "0 0/1 * * * ?")
    public void hx() {
        log.info("<===============TRX 回写开始 ===============>");
        // 获取当前链上块高
        Long block = tronUtils.getBlockByNum();
        if (block == null) {
            log.error("<===== 获取当前链上块高失败");
        }
        MCurrencyBlock currencyBlock = mCurrencyBlockMapper.findByCurrency();
        Long currentHeight = currencyBlock.getCurrentHeight();
        if (currentHeight == 0) {
            currentHeight = block - 10;
        }
        if (block <= currentHeight) {
            return;
        }
        // 查找使用过的所有地址,即地址池中取出的，绑定给用户的地址
        List<String> allUsedAddress = mCoinRechargeAddrMapper.findAllUsedAddress();
        Long start = currentHeight;
        Long end;
        for (end = currentHeight; end < block - 5; end++) {
            List<TronTransaction> transactions = tronUtils.getBlockByLimitNext(end, allUsedAddress);
            if (transactions != null && transactions.size() > 0) {
                //录入
                transactions.parallelStream().forEach(data -> {
                    MCoinRecharge coinRecharge = new MCoinRecharge();
                    coinRecharge.setAmount(data.getAmount());
                    coinRecharge.setCurrency("USDT");
                    coinRecharge.setFromAddress(data.getOwnerAddress());
                    coinRecharge.setToAddress(data.getToAddress());
                    coinRecharge.setStatus(0);
                    coinRecharge.setTxid(data.getTxid());
                    coinRecharge.setCreateTime(new Date());
                    mCoinRechargeMapper.save(coinRecharge);
                });
            }
        }
        //更新块高
        currencyBlock.setCurrentHeight(end);
        mCurrencyBlockMapper.updateById(currencyBlock);
        log.info("<=============== 回写结束,块高{}~{}", start, end);
    }


    /**
     * 归集
     */
    @Scheduled(cron = "0 0/1 * * * ?")
    public void gj() {
        log.info("<===============TRX 归集开始 ===============>");
        List<MCoinRecharge> coinRecharges = mCoinRechargeMapper.getListByStatus(0);

        List<MCoinRecharge> trxIds = new ArrayList<>(coinRecharges.size());
        coinRecharges.parallelStream().forEach(coinRecharge -> {
            //给此账户转入trx手续费
            String trxId = tronUtils.sendTransactionTrx(coinRecharge.getToAddress());
            if (trxId != null) {
                //零时改值，不作为存储
                coinRecharge.setGuijiTxid(trxId);
                trxIds.add(coinRecharge);
            }
        });

        //开始归集
        trxIds.parallelStream().forEach(coinRecharge -> {
            String trxId = coinRecharge.getGuijiTxid();
            //校验txid是否成功
            TronTransaction transactionTrx = tronUtils.getTransactionTrx(trxId);
            if (transactionTrx.getCode()) {
                MCoinRechargeAddr coinRechargeAddr = mCoinRechargeAddrMapper.getCoinRechargeByAddress(transactionTrx.getToAddress());

                //我们这边地址向归集地址转账
                String txid = tronUtils.transfer(coinRechargeAddr, coinRecharge.getAmount());

                TronTransaction transaction = tronUtils.getTransaction(txid);
                if (transaction.getCode()) {
                    //完成归集
                    coinRecharge.setGuijiTxid(txid);
                    coinRecharge.setGuijiTime(new Date());
                    coinRecharge.setStatus(1);
                    mCoinRechargeMapper.updateGuiji(coinRecharge);
                    log.info("归集完成====》address:{},price:{}", coinRecharge.getToAddress(), coinRecharge.getAmount());
                }
            }
        });
        log.info("<===============TRX 归集结束 ===============>");
    }


    /**
     * 自动入账
     */
    @Scheduled(cron = "0 0/1 * * * ?")
    public void rz() {
        List<MCoinRecharge> coinRecharges = mCoinRechargeMapper.getListByStatus(1);
        log.info("<===============TRX 入账开始 ===============>");
        coinRecharges.parallelStream().forEach(coinRecharge -> {
            //调用对方接口
            MConfig config = mConfigMapper.getConfig();
            String url = config.getRzUrl();

            Map<String, Object> map = new HashMap<>(4);
            map.put("address", coinRecharge.getToAddress());
            map.put("balance", coinRecharge.getAmount());
            map.put("currency", coinRecharge.getCurrency());
            map.put("tx", coinRecharge.getGuijiTxid());
            String data = HttpUtil.post(url, map, 5000);
            if ("SUCCESS".equals(data)) {
                mCoinRechargeMapper.updateStatus(coinRecharge.getId(), 2);
                log.info("入账完成==》address:{},price:{}", coinRecharge.getToAddress(), coinRecharge.getAmount());
            } else {
                log.error("入账失败==》address:{},price:{}", coinRecharge.getToAddress(), coinRecharge.getAmount());
            }
        });
    }


    /**
     * 提现扫描未确认的数据
     */
    @Scheduled(cron = "0 0/1 * * * ?")
    public void tx() {
        List<MTransfer> list =  mTransferMapper.getTransferByFlag();
        for (MTransfer mTransfer : list) {
            MConfig config = mConfigMapper.getConfig();
            String url = config.getRzUrl();
            Map<String, Object> map = new HashMap<>(3);
            map.put("id", mTransfer.getRId());
            map.put("txid", mTransfer.getTxId());
            if (mTransfer.getStatus() == 1){
                map.put("flag", true);
            }else {
                map.put("txid", false);
            }
            String data = HttpUtil.post(url, map, 5000);
            if ("SUCCESS".equals(data)){
                mTransferMapper.updateStatusById(mTransfer.getId(), null, 1);
                log.error("提现已确认===》address:{}", mTransfer.getAddress());
            }
        }
    }


}
