package com.market.service;

import java.util.List;
import java.util.Map;

import com.market.domain.MemberVO;
import com.market.domain.ProductVO;

public interface MemberService {
	public MemberVO loginMember(MemberVO vo);

	public void memberJoin(MemberVO vo);
	
	//아이디 중복체크
	public boolean isDuplicated(String member_id);
		
	//닉네임 중복체크
	public boolean isCopy(String member_nickname);
	
	public List<ProductVO> memProdList(String id) throws Exception;

	public List<Map<String,Object>> memSellReview(String id) throws Exception;
}
