package com.market.domain;

import lombok.Data;

@Data
public class TradeVO {

	private int t_num;
	private String buy_mem_id;
	private String sell_mem_id;
	private String prod_sell_date;
	private String type_div;
	private String product_title;
	private int prod_num;
	private int au_num;
	private int ran_num;
	
}
