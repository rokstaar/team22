package com.market.service;

import java.util.List;

import com.market.domain.MemberVO;
import com.market.domain.NoticeVO;
import com.market.domain.ProductVO;

public interface AdminService {
	
	// 회원전체목록 조회
	public List<MemberVO> memberList() throws Exception;
	
	// 상품전체목록 조회
	public List<ProductVO> productList() throws Exception;
	
	// 공지사항 글쓰기
	public void writeNotice(NoticeVO vo) throws Exception;
	
	// 공지사항 전체목록 조회
	public List<NoticeVO> noticeList() throws Exception;
	
	// 게시판 글 조회수 1증가
	public void updateReadCnt(Integer noti_num) throws Exception;
		
	// 글정보 조회(특정글)
	public NoticeVO getBoard(Integer noti_num) throws Exception;
	
	 // 글정보 수정
    public Integer modifyBoard(NoticeVO uvo) throws Exception;
	
	

}
