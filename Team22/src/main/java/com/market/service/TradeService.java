	package com.market.service;


import java.util.List;
import java.util.Map;

import com.market.domain.ProductVO;
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
	
}
