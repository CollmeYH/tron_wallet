package com.example.tron;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;


@MapperScan("com.example.tron.dao")
@SpringBootApplication
@EnableScheduling
public class TronWalletApplication {

    public static void main(String[] args) {
        SpringApplication.run(TronWalletApplication.class, args);
    }

}
