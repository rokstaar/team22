package com.market.persistence;

import java.util.List;

import com.market.domain.RandomVO;

public interface RandomDAO {
	public void rRegist(RandomVO vo) throws Exception;
	
	public List<RandomVO> rList() throws Exception;
	
	public RandomVO rDetail(int ran_num) throws Exception;
	
	public Integer countP(int ran_num) throws Exception;
	
	public Integer getMPay(String id) throws Exception;
	
	public void rBid(RandomVO vo) throws Exception;
	
	public void minusPay(String id, int mPay) throws Exception;
	
	public List<String> selectBuyer(int ran_num) throws Exception;
	
	public RandomVO nowBest() throws Exception;

}
