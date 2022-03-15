package com.example.tron.dao;

import com.example.tron.entity.MCoinRecharge;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author wyh
 * @create: 2022-03-02 19:27
 * @Description : 类说明
 */
@Repository
public interface MCoinRechargeMapper {

    void save(MCoinRecharge coinRecharge);

    List<MCoinRecharge> getListByStatus(int status);

    void updateGuiji(MCoinRecharge coinRecharge);

    void updateStatus(@Param("id") Long id,@Param("status") int status);
}
