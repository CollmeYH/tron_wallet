package com.example.tron.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MCurrencyBlock {

  private long id;
  private String currency;
  private long currentHeight;



}
