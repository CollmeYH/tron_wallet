package com.example.tron.service.impl;

import com.example.tron.dao.MCoinRechargeAddrMapper;
import com.example.tron.dao.MCoinRechargeAddrPoolMapper;
import com.example.tron.entity.MCoinRechargeAddr;
import com.example.tron.entity.MCoinRechargeAddrPool;
import com.example.tron.service.MCoinRechargeAddrPoolService;
import com.example.tron.utils.AjaxResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author wyh
 * @create: 2022-03-02 12:02
 * @Description : 地址池
 */
@Slf4j
@Service
public class MCoinRechargeAddrPoolServiceImpl implements MCoinRechargeAddrPoolService {

    @Autowired
    private MCoinRechargeAddrPoolMapper mCoinRechargeAddrPoolMapper;

    @Autowired
    private MCoinRechargeAddrMapper coinRechargeAddrMapper;

    @Override
    public AjaxResult getAddress() {
        MCoinRechargeAddrPool addressPool = mCoinRechargeAddrPoolMapper.getAddress();
        if (null == addressPool){
            AjaxResult.error("地址池已空，请稍后在试！");
        }
        mCoinRechargeAddrPoolMapper.deleteById(addressPool.getId());
        MCoinRechargeAddr mCoinRechargeAddr = new MCoinRechargeAddr();
        mCoinRechargeAddr.setAddress(addressPool.getAddress());
        mCoinRechargeAddr.setPrivateKey(addressPool.getPrivateKey());
        mCoinRechargeAddr.setCurrency(addressPool.getCurrency());
        mCoinRechargeAddr.setCreateTime(new Date());
        coinRechargeAddrMapper.insertCoinRechargeAddr(mCoinRechargeAddr);
        return AjaxResult.successData(addressPool.getAddress());
    }
}
