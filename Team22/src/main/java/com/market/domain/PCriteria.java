package com.market.domain;

public class PCriteria {

	private ProductVO productvo;
	private int pageNum;			// 현재 페이지 번호
	private int pageBlock;			// 페이지 하나 당 보여줄 게시물 수
	private int totalCount;			// 게시물 총 갯수
	
	public PCriteria() {
		this.pageNum = 1;
		this.pageBlock = 12;
	}
	
	public PCriteria(ProductVO productvo, int pageNum, int pageBlock, int totalCount) {
		this.productvo = productvo;
		this.pageNum = pageNum;
		this.pageBlock = pageBlock;
		this.totalCount = totalCount;
	}
	
	public ProductVO getProductvo() {
		return productvo;
	}
	public int getPageNum() {
		return pageNum;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setProductvo(ProductVO productvo) {
		this.productvo = productvo;
	}
	public void setPageNum(int pageNum) {
		if(pageNum < 1) pageNum = 1;
		this.pageNum = pageNum;
	}
	public void setPageBlock(int pageBlock) {
		if(pageBlock < 6) pageBlock = 6;
		this.pageBlock = pageBlock;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "PCriteria [productvo=" + productvo + ", pageNum=" + pageNum + ", pageBlock=" + pageBlock
				+ ", totalCount=" + totalCount + "]";
	}
	
	
	
}
