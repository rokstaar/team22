package com.market.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductVO {

	private int product_num;
	private String product_seller;
	private String product_cate;
	private String product_title;
	private String product_content;
	private int product_price;
	private Object product_pic;
	private int product_readcount;
	private Date product_date;
	private String product_status;
	private String product_grade;
	private int product_favorite;
}
