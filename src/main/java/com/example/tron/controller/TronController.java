package com.example.tron.controller;

import cn.hutool.http.HttpUtil;
import com.example.tron.dao.MConfigMapper;
import com.example.tron.dao.MTransferMapper;
import com.example.tron.entity.MConfig;
import com.example.tron.entity.MTransfer;
import com.example.tron.service.MCoinRechargeAddrPoolService;
import com.example.tron.utils.AjaxResult;
import com.example.tron.utils.TronTransaction;
import com.example.tron.utils.TronUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author wyh
 * @create: 2022-03-02 15:01
 * @Description : 类说明
 */
@Slf4j
@RequestMapping(value = "tron")
@RestController
public class TronController {
    @Autowired
    private TronUtils tronUtils;

    @Autowired
    private MTransferMapper mTransferMapper;

    @Autowired
    private MCoinRechargeAddrPoolService mCoinRechargeAddrPoolService;

    @Autowired
    private MConfigMapper mConfigMapper;

    @Resource(name = "threadPoolExecutor")
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    /**
     * 获取地址
     *
     * @return
     */
    @RequestMapping(value = "getAddress")
    public AjaxResult getAddress() {
        return mCoinRechargeAddrPoolService.getAddress();
    }

    /**
     * 提现
     *
     * @param to  提现地址
     * @param num 提现金额
     * @param id  标识符
     * @return
     */
    @RequestMapping(value = "transfer")
    public AjaxResult transfer(@RequestParam(value = "to") String to,
                               @RequestParam(value = "num") BigDecimal num,
                               @RequestParam(value = "id") String id) {
        String txid = tronUtils.sendTransaction(to, num);
        if (txid == null) {
            AjaxResult.error("交易失败");
        }
        MTransfer mTransfer = new MTransfer();
        mTransfer.setRId(id);
        mTransfer.setAddress(to);
        mTransfer.setNum(num);
        mTransfer.setCreateTime(new Date());
        mTransfer.setFlag(0);
        mTransfer.setTxId(txid);
        mTransfer.setStatus(0);

        mTransferMapper.save(mTransfer);

        //异步去查询
        threadPoolTaskExecutor.execute(new Runnable() {
            @Override
            public void run() {
                TronTransaction transaction = tronUtils.getTransaction(txid);
                MConfig config = mConfigMapper.getConfig();
                String url = config.getRzUrl();
                Map<String, Object> map = new HashMap<>(3);
                map.put("id", id);
                map.put("txid", txid);
                if (transaction.getCode()) {
                    //成功
                    map.put("flag", true);
                    mTransferMapper.updateStatusById(mTransfer.getId(), 1, null);
                    log.error("提现成功===》address:{},txid:{}", to, txid);
                } else {
                    mTransferMapper.updateStatusById(mTransfer.getId(), 2, null);
                    map.put("flag", false);
                    log.error("提现失败===》address:{},txid:{}", to, txid);
                }
                String data = HttpUtil.post(url, map, 5000);
                if ("SUCCESS".equals(data)){
                    mTransferMapper.updateStatusById(mTransfer.getId(), null, 1);
                    log.error("提现已确认===》address:{}", to);
                }
            }
        });
        return AjaxResult.successData(txid);
    }

}
