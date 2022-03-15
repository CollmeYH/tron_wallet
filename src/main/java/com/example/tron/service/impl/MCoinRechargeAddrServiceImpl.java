package com.example.tron.service.impl;

import com.example.tron.dao.MCoinRechargeAddrMapper;
import com.example.tron.service.MCoinRechargeAddrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author wyh
 * @create: 2022-03-02 12:04
 * @Description : 类说明
 */
@Service
public class MCoinRechargeAddrServiceImpl implements MCoinRechargeAddrService {

    @Autowired
    private MCoinRechargeAddrMapper mCoinRechargeAddrMapper;

}
