package com.market.service;

import java.util.List;
import java.util.Map;

import com.market.domain.AuctionVO;
import com.market.domain.CustomerserviceVO;
import com.market.domain.MemberVO;
import com.market.domain.NoticeVO;
import com.market.domain.ProductVO;
import com.market.domain.RandomVO;
import com.market.domain.TradeVO;

public interface AdminService {
	
	// 모든회원 정보 + 페이징 + 검색
	public List<MemberVO> getMemebrList(int displayPost, int postNum,
	                                        String searchType, String keyword) throws Exception;
		
	// 모든 회원 수 + 검색
	public int searMemlist(String searchType, String keyword) throws Exception;
	
	// 회원 개인 조회
	public MemberVO getmem(Integer member_num) throws Exception;
	
	// 총 회원 수(명)
	public int countMember() throws Exception;
	
	
	
	// 모든 상품구매내역 조회
	public List<Map<String,Object>> buyprodList() throws Exception;
		
	// 모든 옥션구매내역 조회
	public List<Map<String,Object>> buyauList() throws Exception;
			
	// 모든 랜덤구매내역 조회
	public List<Map<String,Object>> buyranList() throws Exception;
		
		
	// 모든 판매내역 조회
	public List<Map<String, Object>> getsellprodList() throws Exception;
		
	// 총 거래내역 수
	public int countTrade() throws Exception;
	
	// 모든 제품 개수
	public int countProduct() throws Exception;
	
	
	
	// 모든 판매 제품 정보
	public List<ProductVO> productList() throws Exception;
	
	// 모든 경매제품 정보
	public List<AuctionVO> auctionList() throws Exception;
	
	// 모든 경매 상세정보
	public List<AuctionVO> audetail(Integer au_num) throws Exception;
		
	// 모든 랜덤제품 정보
	public List<RandomVO> randomList() throws Exception;
	
	//  랜덤 참가자 상세정보
	public List<RandomVO> randetail(Integer ran_num) throws Exception;
	

	
	
	
	// 모든 문의사항 정보 + 페이징 + 검색
	public List<CustomerserviceVO> getCsList(int displayPost, int postNum,
	                                             String searchType, String keyword) throws Exception;
		
	// 모든 문의사항 + 검색
	public int searCslist(String searchType, String keyword) throws Exception;
	
	// 문의사항 총 글 개수
	public int countCs() throws Exception;
		
	
		
	// 모든 공지사항 정보 + 페이징 + 검색 (관리자 페이지)
	public List<NoticeVO> getNotiList(int displayPost, int postNum,
                                      String searchType, String keyword) throws Exception;
	
	// 모든 공지사항 + 검색(관리자 페이지)
	public int searNotilist(String searchType, String keyword) throws Exception;
	
	
	
	
	// 공지사항 쓰기
	public void writeNotice(NoticeVO vo) throws Exception;
	
	// 공지사항 리스트 목록 + 페이징 + 검색
	public List<NoticeVO> noticeList(int displayPost, int postNum,
                                     String searchType, String keyword) throws Exception;
	
	// 공지사항 총 개수 + 검색적용
	public int searcountNotice(String searchType, String keyword) throws Exception;
	
	// 공지사항 글 수
	public int countNotice() throws Exception;

	// 공지사항 조회수1증가
	public void updateReadCnt(Integer noti_num) throws Exception;
		
	// 공지사항 특정글 가져오기
	public NoticeVO getBoard(Integer noti_num) throws Exception;
	
	// 공지사항 업데이트
    public Integer modifyBoard(NoticeVO uvo) throws Exception;
	
    // 공지사항 삭제하기
    public Integer deleteNotice(Integer noti_num)throws Exception;

}
