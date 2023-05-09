package com.market.domain;

import java.sql.Date;


import lombok.Data;

@Data
public class CustomerserviceVO {
	private int cs_num;
	private String mem_id;
	private String cs_category;
	private String cs_process;
	private String cs_file0;
	private String cs_file1;
	private String cs_file2;
	private String cs_sub;
	private String cs_content;
	private boolean cs_secret;
	private int cs_readcount;
	private Date cs_date;

}
