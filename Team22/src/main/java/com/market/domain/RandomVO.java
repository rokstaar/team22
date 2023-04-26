package com.market.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class RandomVO {

	private int ran_num;
	private int ran_price;
	private Date ran_endTime;
	private String ran_sellerId;
	private String ran_buyerId;
	private int ran_bidPrice;
	private String ran_pic;
	private int ran_maxPp;
}
