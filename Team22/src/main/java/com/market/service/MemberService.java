package com.market.service;

import com.market.domain.MemberVO;

public interface MemberService {
	public MemberVO loginMember(MemberVO vo);

	public void memberJoin(MemberVO vo);
	
	public int idChk(MemberVO vo)throws Exception;



}
