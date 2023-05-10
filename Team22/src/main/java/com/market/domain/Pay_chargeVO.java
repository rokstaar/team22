package com.market.domain;

import lombok.Data;

@Data
public class Pay_chargeVO {
	private int charge_num;
	private int charge_amount;
	private String charge_date_time;
	private String member_id;
	
}

