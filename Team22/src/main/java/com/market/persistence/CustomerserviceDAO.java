package com.market.persistence;

import java.util.List;

import com.market.domain.CustomerserviceVO;
import com.mysql.cj.util.Base64Decoder.IntWrapper;

public interface CustomerserviceDAO {
	
	// 게시판 글쓰기
	public void createBoard(CustomerserviceVO vo)throws Exception;
	
	// 게시판 목록(리스트) 조회
	public List<CustomerserviceVO> getBoardList() throws Exception;
	
	// 게시판 조회수 증가
	public void addCscnt(Integer cs_num) throws Exception;
	
	// 게시판 특정 글 조회 
	public CustomerserviceVO getBoard (Integer cs_num) throws Exception;
	
	// 게시판 글 수정
	public Integer updateBoard(CustomerserviceVO vo) throws Exception;
	
	// 게시판 글 삭제
	public Integer deleteBoard(Integer cs_num) throws Exception;

	
	

}
