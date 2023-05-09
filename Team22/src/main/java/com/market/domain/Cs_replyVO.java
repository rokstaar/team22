package com.market.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Cs_replyVO {
	
	private  int re_rno;
	private  int cs_num;
	private  String re_content;
	private  Date re_date;

}
