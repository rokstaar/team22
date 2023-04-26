package com.market.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {
	
	private int noti_num;
	private String noti_title;
	private String noti_content;
	private Date noti_date;
	private int noti_readcount;
	private String noti_image;
	private String noti_image1;
	private String noti_image2;

}
