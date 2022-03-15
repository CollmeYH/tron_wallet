package com.example.tron.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MCoinRechargeAddr {

  private String currency;
  private String address;
  private String privateKey;

  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date createTime;


}
