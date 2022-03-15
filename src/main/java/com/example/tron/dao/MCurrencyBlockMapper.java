package com.example.tron.dao;

import com.example.tron.entity.MCurrencyBlock;
import org.springframework.stereotype.Repository;

/**
 * @author wyh
 * @create: 2022-03-02 16:20
 * @Description : 类说明
 */
@Repository
public interface MCurrencyBlockMapper {

    MCurrencyBlock findByCurrency();

    void updateById(MCurrencyBlock mCurrencyBlock);
}
