package com.market.service;

import java.util.List;
import java.util.Map;

import com.market.domain.MemberVO;
import com.market.domain.ProductVO;

public interface MemberService {
	public MemberVO loginMember(MemberVO vo);

	public void memberJoin(MemberVO vo);
	
	public int idChk(MemberVO vo)throws Exception;
	
	public List<ProductVO> memProdList(String id) throws Exception;

	public List<Map<String,Object>> memSellReview(String id) throws Exception;
}
