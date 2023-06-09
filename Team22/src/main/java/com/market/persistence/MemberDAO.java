package com.market.persistence;

import java.util.List;
import java.util.Map;

import com.market.domain.CustomerserviceVO;
import com.market.domain.MemberVO;
import com.market.domain.Pay_chargeVO;
import com.market.domain.ProductVO;
import com.market.domain.TradeVO;

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
	// 회원 사진 삭제
	public void deleteMemPic(String id) throws Exception;
	// 회원 사진 수정
    public void updateMemberPic(String id, String memberPicPath) throws Exception;

 // �븘�씠�뵒 李얘린
 	public List<MemberVO> findId(String memberEmail)throws Exception;
 	
 	public int findIdCheck(String memberEmail)throws Exception;
	
 	// 회원 탈퇴
 	public void memberDelete(MemberVO vo)throws Exception;
 	// 판매자 프로필
 	public List<Map<String,Object>> userInfo(String id)throws Exception;
 	
 	// 평점
 	public Double avgScore(String id)throws Exception;
 	
 	// 페이충전
  	public Integer insertPayCharge(Pay_chargeVO vo)throws Exception;
  	// 페이출금
  	public Integer insertPayWithdraw(Pay_chargeVO vo)throws Exception;

  	// 회원금액과 충전금액 합산 
  	public Integer memberPayCharge(Pay_chargeVO vo)throws Exception;
  	// 회원금액과 출금금액 합산
  	public Integer payWithdraw(Map<String,Object> vo)throws Exception;
  	
  	// 총 거래 내역
  	public int countTrade(String id) throws Exception;
  	
  	public void updatePw(MemberVO vo) throws Exception;

	public MemberVO readMember(String id) throws Exception;

	// 메인페이지에서 검색
  	public List<Map<String,Object>> allSerrch()throws Exception;
  	// 내 문의사항
  	public List<CustomerserviceVO> myCs(String id)throws Exception;
  	// 충전내역
  	public List<Map<String,Object>> chargingDetails(String id)throws Exception;
  	// 출금내역
  	public List<Map<String,Object>> drawDetails(String id)throws Exception;
  	
}
