	package com.market.service;


import java.util.List;
import java.util.Map;

import com.market.domain.AuctionVO;
import com.market.domain.ProductVO;
import com.market.domain.RandomVO;
import com.market.domain.ReviewVO;
import com.market.domain.TradeVO;

public interface TradeService {

	public List<Map<String,Object>> getBuyReview(String id) throws Exception;

	public List<Map<String,Object>> tSellReview(String id) throws Exception;

	public List<Map<String,Object>> buyList(String id) throws Exception;
	
	public List<Map<String,Object>> prodList() throws Exception;
	
	public void writeReview(ReviewVO rvo) throws Exception;
	
	public void memberScore(double score) throws Exception;
	
	public List<ProductVO> myProdList(String id) throws Exception;
	
	public List<AuctionVO> buyAuctionList(String id) throws Exception;
	
	public List<AuctionVO> getAuctionList() throws Exception;
	
	public List<AuctionVO> mySaleAuction(String id) throws Exception;
	
	public List<Map<String,Object>> favoriteList(String id) throws Exception;
	
	public List<RandomVO> mySaleRandom(String id) throws Exception;
	
	public Integer removeReview(Integer prod_num) throws Exception;
}
