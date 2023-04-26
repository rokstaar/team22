package com.market.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatMessengerVO {
	private int room_id;
	private int product_num;
	private String buyer_id;
	private String seller_id;
	private Timestamp message_date;
	private String chat_pic;
	private String chat_profile;
	

}
