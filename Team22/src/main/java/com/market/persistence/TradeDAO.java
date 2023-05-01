package com.market.persistence;

import java.util.List;
import java.util.Map;

import com.market.domain.AuctionVO;
import com.market.domain.ProductVO;
import com.market.domain.ReviewVO;
import com.market.domain.TradeVO;

public interface TradeDAO {
	// 구매리뷰
	public List<Map<String,Object>> buyReviewList(String id) throws Exception;
	// 판매리뷰
	public List<Map<String,Object>> tSellReview(String id) throws Exception;
	// 구매내역
	public List<Map<String,Object>> buyList(String id) throws Exception;
	// 판매내역
	public List<Map<String,Object>> prodList() throws Exception;
	// 리뷰 작성
	public void insertReview(ReviewVO rvo) throws Exception;
	// 평점
	public void avgScore(double score)throws Exception;
	// 내가 판매중인 상품
	public List<ProductVO> getProdList(String id) throws Exception;
	// 내가 신청한 경매 리스트
	public List<AuctionVO> auBuyList(String id) throws Exception;
	// 내가 신청한 경매 상품들의 현재 정보
	public List<AuctionVO> getAList()throws Exception;
	// 내가 판매중인 경매상품
	public List<AuctionVO> getAuctList(String id) throws Exception;
	// 내 관심상품 리스트
	public List<Map<String,Object>> getFavorite(String id) throws Exception;
	// 찜한 상품 삭제
	public void delFavorite(Map<String, Object> map);
	
	
	
}

