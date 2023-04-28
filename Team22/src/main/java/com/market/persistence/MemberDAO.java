package com.market.persistence;

import java.util.List;
import java.util.Map;

import com.market.domain.MemberVO;
import com.market.domain.ProductVO;

public interface MemberDAO {
	//로그인
	public MemberVO loginMember(MemberVO vo);
	
	//회원가입
	public void insertMember(MemberVO vo);

	//아이디 중복 체크
	public int idChk(MemberVO vo) throws Exception;
	
	// 조회한 프로필 판매 정보 
	public List<ProductVO> getProdList(String id) throws Exception;
	
	// 다른회원 판매후기
	public List<Map<String,Object>> memProdReview(String id) throws Exception;
}
