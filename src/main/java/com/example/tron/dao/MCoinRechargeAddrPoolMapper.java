package com.example.tron.dao;

import com.example.tron.entity.MCoinRechargeAddrPool;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author wyh
 * @create: 2022-03-02 12:01
 * @Description : 类说明
 */

@Repository
public interface MCoinRechargeAddrPoolMapper {

    MCoinRechargeAddrPool getAddress();

    int countTrxAddress();

    void insertAddressBatch(@Param(value = "addressList") List<MCoinRechargeAddrPool> addressList);

    void deleteById(long id);
}
