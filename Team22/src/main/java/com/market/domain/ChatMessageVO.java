package com.market.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatMessageVO {
	
	private int chat_id;
	private int room_id;
	private int product_num;
	private String seller_id;
	private String buyer_id;
	private String chat_content;
	private Timestamp chat_date;
	private String chat_profile;
	
}
