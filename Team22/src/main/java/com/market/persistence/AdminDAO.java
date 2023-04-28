package com.market.persistence;

import java.util.List;

import com.market.domain.MemberVO;
import com.market.domain.NoticeVO;
import com.market.domain.ProductVO;

public interface AdminDAO {
	
	// 모든회원 정보
	public List<MemberVO> getMemebrList() throws Exception;
	
	// 회원 수(명) 
	public int countMember() throws Exception;
	
	
	// 모든 제품 정보
	public List<ProductVO> getProductList() throws Exception;
	
	// 공지사항 쓰기
	public void createNotice(NoticeVO vo) throws Exception;
	
	// 공지사항 리스트 목록
	public List<NoticeVO> getNoticeList() throws Exception;
	
	// 공지사항 조회수1증가
	public void addReadcnt(Integer noti_num) throws Exception;
	
	// 공지사항 특정글 가져오기
	public NoticeVO getNotice(Integer noti_num) throws Exception;
	
	// 공지사항 업데이트
	public Integer updateBoard(NoticeVO uvo) throws Exception;
	
	// 공지사항 삭제하기
	public Integer deleteNotice(Integer noti_num)throws Exception;
	

}
