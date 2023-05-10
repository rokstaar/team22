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
	
	public Integer writeReview(ReviewVO rvo) throws Exception;
	
	public Double memberScore(String id) throws Exception;
	
	public List<ProductVO> myProdList(String id) throws Exception;
	
	public List<AuctionVO> buyAuctionList(String id) throws Exception;
	
	public List<RandomVO> myBuyRandomList(String id) throws Exception;
	
	public List<AuctionVO> getAuctionList(String id) throws Exception;
	
	public List<AuctionVO> mySaleAuction(String id) throws Exception;
	
	public List<Map<String,Object>> favoriteList(String id) throws Exception;
	
	public List<RandomVO> mySaleRandom(String id) throws Exception;
	
	public Integer removeReview(Integer prod_num) throws Exception;
	
	public Integer removeProduct(Integer product_num) throws Exception;
	
	public Integer removeAuction(Integer au_num) throws Exception;
	
	public Integer removeRandom(Integer ran_num) throws Exception;
	
	public List<Map<String,Object>> myBuyAuction(String id) throws Exception;
	
	public List<Map<String,Object>> myBuyRandom(String id) throws Exception;
	
	public List<Map<String,Object>> getSoldProduct(String id) throws Exception;
	
	public List<Map<String,Object>> getSoldAuction(String id) throws Exception;
	
	public List<Map<String,Object>> getSoldRandom(String id) throws Exception;
	
	
	
	
	
	
}
