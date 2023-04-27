package com.market.persistence;

import java.util.List;
import java.util.Map;

import com.market.domain.ReviewVO;
import com.market.domain.TradeVO;

public interface TradeDAO {

	public List<Map<String,Object>> buyReviewList() throws Exception;
	
	public List<TradeVO> tSellReview() throws Exception;
	
	public List<Map<String,Object>> buyList() throws Exception;
	
	public List<Map<String,Object>> prodList() throws Exception;

	public void insertReview(ReviewVO rvo) throws Exception;
	
	public void avgScore(double score)throws Exception;
	
}
