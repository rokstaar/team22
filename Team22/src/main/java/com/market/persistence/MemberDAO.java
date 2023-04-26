package com.market.persistence;

import com.market.domain.MemberVO;

public interface MemberDAO {
	//로그인
	public MemberVO loginMember(MemberVO vo);
	
	//회원가입
	public void insertMember(MemberVO vo);

	//아이디 중복 체크
	public int idChk(MemberVO vo) throws Exception;
}
