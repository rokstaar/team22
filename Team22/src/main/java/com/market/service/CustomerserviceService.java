package com.market.service;

import java.util.List;

import com.market.domain.ACriteria;
import com.market.domain.CustomerserviceVO;


public interface CustomerserviceService {
	
	// 게시판 글쓰기
	public void writeBoard(CustomerserviceVO vo)throws Exception;
	
	// 게시판 목록(리스트) 조회 + 페이징 + 검색
	public List<CustomerserviceVO> boardList(int displayPost, int postNum,
			                                 String searchType, String keyword) throws Exception;
	
	// 게시판 총 갯수 + 검색적용
	public int searcountCs(String searchType, String keyword) throws Exception; 
	
	// 게시판 조회수 증가
	public void updateReadCnt(Integer cs_num) throws Exception;
	
	// 게시판 특정 글 조회
	public CustomerserviceVO getBoard(Integer cs_num) throws Exception;
	
	// 게시판 글 수정
	public Integer updateBoard(CustomerserviceVO vo) throws Exception;
	
	// 게시판 글 삭제
	public Integer deleteBoard(Integer cs_num) throws Exception;
	
	// 게시판 답글 등록
	public void re_board(CustomerserviceVO vo) throws Exception;

}
