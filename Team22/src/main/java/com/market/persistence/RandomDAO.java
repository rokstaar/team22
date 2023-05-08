package com.market.persistence;

import java.util.List;

import com.market.domain.ACriteria;
import com.market.domain.RandomVO;

public interface RandomDAO {
	public void rRegist(RandomVO vo) throws Exception;
	
	public List<RandomVO> rList(ACriteria cri) throws Exception;
	
	public RandomVO rDetail(int ran_num) throws Exception;
	
	public Integer countP(int ran_num) throws Exception;
	
	public Integer getMPay(String id) throws Exception;
	
	public void rBid(RandomVO vo) throws Exception;
	
	public void minusPay(String id, int mPay) throws Exception;
	
	public List<String> selectBuyer(int ran_num) throws Exception;
	
	public RandomVO nowBest() throws Exception;
	
	public String selectTrade(int ran_num) throws Exception;
	
	public void updateRan(int ran_num) throws Exception;
	
	public RandomVO selectWinner(int ran_num) throws Exception;
	
	public void insertTrade(RandomVO vo) throws Exception;
	
	public void plusPay(RandomVO vo) throws Exception;
	
	public List<RandomVO> myRan(String id) throws Exception;
	
	public Integer countRan() throws Exception;
	
	public Integer countSearch(String type, String search) throws Exception;
	
	public List<RandomVO> searchList(ACriteria cri, String type, String search) throws Exception;
	
	
	

}
