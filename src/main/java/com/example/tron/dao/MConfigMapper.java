package com.example.tron.dao;

import com.example.tron.entity.MConfig;
import org.springframework.stereotype.Repository;

/**
 * @author wyh
 * @create: 2022-03-03 11:24
 * @Description : 类说明
 */
@Repository
public interface MConfigMapper {

    MConfig getConfig();
}
