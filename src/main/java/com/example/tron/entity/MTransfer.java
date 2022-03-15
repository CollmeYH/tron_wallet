package com.example.tron.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;


import java.math.BigDecimal;
import java.util.Date;

@lombok.Data
@NoArgsConstructor
@AllArgsConstructor
public class MTransfer {

  private long id;
  private String rId;
  private String address;
  private BigDecimal num;
  private String txId;
  /**
   * 0待定 1失败 2成功
   */
  private Integer status;
  /**
   * 0未确定 1已确定
   */
  private Integer flag;

  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date createTime;


}
