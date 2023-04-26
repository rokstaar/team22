package com.market.domain;


import lombok.Data;

@Data
public class AuctionVO {
	private int au_num;
	private int au_startPrice;
	private String au_endTime;
	private String au_sellerId;
	private String au_buyerId;
	private int au_bidPrice;
	private int au_endPrice;
	private String au_pic;
	private int au_status;
	private String au_title;
	private String au_content;
	private String au_category;
}
