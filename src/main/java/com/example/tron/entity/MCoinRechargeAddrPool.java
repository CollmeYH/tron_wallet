package com.example.tron.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MCoinRechargeAddrPool {

  private long id;
  private String currency;
  private String address;
  private String privateKey;


}
