package com.example.tron.utils;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @author wyh
 * @create: 2021-11-11 11:50
 * @Description : TRON交易info
 */
@Data
public class TronTransaction {

	private Boolean code;
	private String txid;
	private BigDecimal amount;
	private String toAddress;
	private String ownerAddress;
	private String contractAddress;
}
