package com.market.domain;

import lombok.Data;

@Data
public class MemberVO {
	private String member_id;
	private String member_pass;
	private int member_phone;
	private String member_name;
	private String member_nickname;
	private String member_email;
	private String member_address;
	private int member_pay;
	private int member_num;
	private String member_pic;

}
