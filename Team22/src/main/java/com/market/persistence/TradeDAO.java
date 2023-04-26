package com.market.persistence;

import java.util.List;
import java.util.Map;

import com.market.domain.TradeVO;

public interface TradeDAO {

	public List<TradeVO> getBuyReview() throws Exception;
	
	public List<TradeVO> tSellReview() throws Exception;
	
	public List<Map<String,Object>> buyList() throws Exception;
	
	public List<Map<String,Object>> prodList() throws Exception;
	
}
