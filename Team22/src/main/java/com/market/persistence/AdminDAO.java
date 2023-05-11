package com.market.persistence;

import java.util.List;
import java.util.Map;

import com.market.domain.AuctionVO;
import com.market.domain.CustomerserviceVO;
import com.market.domain.MemberVO;
import com.market.domain.NoticeVO;
import com.market.domain.ProductVO;
import com.market.domain.RandomVO;
import com.market.domain.TradeVO;

public interface AdminDAO {
	
	// 모든회원 정보 + 페이징 + 검색
	public List<MemberVO> getMemebrList(int displayPost, int postNum,
                                        String searchType, String keyword) throws Exception;
	
	// 모든 회원 수 + 검색
	public int searMemlist(String searchType, String keyword) throws Exception;
	
	// 회원 개인 조회
	public MemberVO getmem(Integer member_num) throws Exception;
	
	// 회원 수(명) 
	public int countMember() throws Exception;
	
	
	
	// 모든 판매제품 정보
	public List<ProductVO> getProductList() throws Exception;
	
	// 모든 경매제품 정보
	public List<AuctionVO> getAuctionList() throws Exception;
	
	// 모든 랜덤제품 정보
	public List<RandomVO> getRandomList() throws Exception;
	
	
	
	// 모든 제품 개수
	public int countProduct() throws Exception;
	
	// 모든 구매내역 조회
	public List<Map<String,Object>> getbuyprodList() throws Exception;
	
	// 모든 판매내역 조회
	public List<Map<String, Object>> getsellprodList() throws Exception;
	
	// 총 거래내역 수
	public int countTrade() throws Exception;
	
	
	
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
	public void createNotice(NoticeVO vo) throws Exception;
	
	// 공지사항 리스트 목록 + 페이징 + 검색
	public List<NoticeVO> getNoticeList(int displayPost, int postNum,
                                        String searchType, String keyword) throws Exception;
	
	// 공지사항 글 개수 + 검색적용
	public int searcountNotice(String searchType, String keyword) throws Exception;
	
	// 공지사항 글 수
	public int countNotice() throws Exception;
	
	// 공지사항 조회수1증가
	public void addReadcnt(Integer noti_num) throws Exception;
	
	// 공지사항 특정글 가져오기
	public NoticeVO getNotice(Integer noti_num) throws Exception;
	
	// 공지사항 업데이트
	public Integer updateBoard(NoticeVO uvo) throws Exception;
	
	// 공지사항 삭제하기
	public Integer deleteNotice(Integer noti_num)throws Exception;
	

}
