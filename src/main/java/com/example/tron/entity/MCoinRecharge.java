package com.example.tron.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MCoinRecharge {

  private Long id;
  private String currency;
  private BigDecimal amount;
  private String toAddress;
  private String fromAddress;
  private String txid;
  private Long gas;
  private String guijiTxid;
  private Integer status;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date createTime;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date guijiTime;


}
