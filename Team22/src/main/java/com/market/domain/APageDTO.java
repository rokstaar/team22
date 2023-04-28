package com.market.domain;

public class APageDTO {
	private int totalCount; // 총 글의 개수
	private int startPage; // 페이지 블럭 시작번호
	private int endPage; // 페이지 블럭 끝번호
	private boolean prev; // 이전
	private boolean next; // 다음
	private int displayPageNum = 10; // 페이지 블럭의 개수
	private ACriteria cri;

	public void setCri(ACriteria cri) {
		this.cri = cri;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

		calcData();
	}

	private void calcData() {
		// endPage
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum)) * displayPageNum;
		
		// startPage
		startPage = (endPage - displayPageNum) + 1;

		// tmpEndPage : 실제 사용되는 마지막 페이지 번호
		int tmpEndPage = (int) Math.ceil(totalCount / (double) cri.getPageSize());

		if (endPage > tmpEndPage) {
			endPage = tmpEndPage;
		}

		
		// prev
		prev = startPage != 1;

		// next
		next = endPage + cri.getPageSize() >= totalCount ? false : true;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public ACriteria getCri() {
		return cri;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void setDisplayPageNum(int displaypageNum) {
		this.displayPageNum = displaypageNum;
	}

	@Override
	public String toString() {
		return "APageDTO [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}

}
