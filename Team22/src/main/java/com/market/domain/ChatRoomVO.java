package com.market.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ChatRoomVO {

	private int room_id;
	private int product_num;
	private String seller;
	private String buyer;
	private String profile;
	private Timestamp chat_date;
	
}
