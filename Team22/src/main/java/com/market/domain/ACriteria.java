package com.market.domain;

import lombok.Data;

@Data
public class ACriteria {
	private int page;
	private int pageSize;
	
	public ACriteria() {
		this.page = 1;
		this.pageSize = 10;
	}
	
	public int getPage() {
		return page;
	}
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public void setPageSize(int pageSize) {
		if(pageSize <= 0 || pageSize > 100) {
			this.pageSize = 10;
			return;
		}
		this.pageSize = pageSize;
	}
	
	public int getPageStart() {
		
		return (page - 1 ) * pageSize;
	}

}
