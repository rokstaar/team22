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
	private int product_status;
	private String product_grade;
	private int product_favorite;
	
	
	
//	public ProductVO(int product_num, String product_seller, String product_cate, String product_title,
//			String product_content, int product_price, Object product_pic, int product_readcount, Date product_date,
//			int product_status, String product_grade, int product_favorite) {
//		super();
//		this.product_num = product_num;
//		this.product_seller = product_seller;
//		this.product_cate = product_cate;
//		this.product_title = product_title;
//		this.product_content = product_content;
//		this.product_price = product_price;
//		this.product_pic = product_pic;
//		this.product_readcount = product_readcount;
//		this.product_date = product_date;
//		this.product_status = product_status;
//		this.product_grade = product_grade;
//		this.product_favorite = product_favorite;
//	}
//
//
//	public ProductVO() {
//	}
	
	
	
	
}
