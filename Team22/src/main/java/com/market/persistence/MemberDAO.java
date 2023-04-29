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
	public int getCountById(String member_id);

	//닉네임 중복 체크
	public int getCountByNick(String member_nickname);

	
	// 조회한 프로필 판매 정보 
	public List<ProductVO> getProdList(String id) throws Exception;
	
	// 다른회원 판매후기
	public List<Map<String,Object>> memProdReview(String id) throws Exception;
	
	// 회원 수정 정보 불러오기
	public MemberVO memberInfo(String id)throws Exception;
	// 회원 수정 
	public void memberInfoUpdate(MemberVO vo)throws Exception;
	
}
