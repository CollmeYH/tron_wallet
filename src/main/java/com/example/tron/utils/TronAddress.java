package com.example.tron.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author wyh
 * @create: 2021-11-11 11:50
 * @Description : TRON交易info
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TronAddress {

	private String address;
	private String privateKey;
}
