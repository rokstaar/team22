package com.market.domain;

import lombok.Data;

@Data
public class MemberVO {
	private String member_id;
	private String member_pass;
	private String member_phone;
	private String member_name;
	private String member_nickname;
	private String member_email;
	private String member_address;
	private int member_pay;
	private int member_num;
	private String member_pic;
	private String member_address2;
	private String member_address3;
	private String bank;
	private String account_number;

}
