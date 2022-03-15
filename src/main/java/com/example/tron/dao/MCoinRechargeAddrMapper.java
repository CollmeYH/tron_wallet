package com.example.tron.dao;

import com.example.tron.entity.MCoinRechargeAddr;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author wyh
 * @create: 2022-03-02 12:03
 * @Description : 类说明
 */
@Repository
public interface MCoinRechargeAddrMapper {
    void insertCoinRechargeAddr(MCoinRechargeAddr mCoinRechargeAddr);

    List<String> findAllUsedAddress();

    MCoinRechargeAddr getCoinRechargeByAddress(String address);

}
