package com.example.tron.dao;

import com.example.tron.entity.MTransfer;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author wyh
 * @create: 2022-03-03 14:57
 * @Description : 类说明
 */
@Repository
public interface MTransferMapper {

    void save(MTransfer mTransfer);

    void updateStatusById(@Param("id") long id, @Param("status") Integer status, @Param("flag") Integer flag);

    List<MTransfer> getTransferByFlag();
}
