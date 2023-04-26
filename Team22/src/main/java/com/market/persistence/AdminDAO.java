package com.market.persistence;

import java.util.List;

import com.market.domain.MemberVO;
import com.market.domain.NoticeVO;
import com.market.domain.ProductVO;

public interface AdminDAO {
	
	// 모든 회원목록정보 조회
	public List<MemberVO> getMemebrList() throws Exception;
	
	// 모든 상품목록정보 조회
	public List<ProductVO> getProductList() throws Exception;
	
	// 공지사항 등록
	public void createNotice(NoticeVO vo) throws Exception;
	
	// 모든 공지사항 조회
	public List<NoticeVO> getNoticeList() throws Exception;
	
	// 글 조회수 1증가
	public void addReadcnt(Integer noti_num) throws Exception;
	
	// 특정 공지사항 조회
	public NoticeVO getNotice(Integer noti_num) throws Exception;
	
	// 공지사항정보 수정
	public Integer updateBoard(NoticeVO uvo) throws Exception;
	
	// 

}
