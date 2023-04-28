package com.market.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class TradeVO {

	private int t_num;
	private String buy_mem_id;
	private String sell_mem_id;
	private Timestamp prod_sell_date;
	private int t_div;
	private int type_div;
	private int prod_num;
	private int au_num;
	private int ran_num;
	
}
