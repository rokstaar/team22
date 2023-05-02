package com.market.service;

import java.util.List;

import com.market.domain.RandomVO;

public interface RandomService {
	public void rRegist(RandomVO vo) throws Exception;
	
	public List<RandomVO> rlist() throws Exception;
	
	public RandomVO rDetail(int ran_num) throws Exception;
	
	public Integer countP(int ran_num) throws Exception;
	
	public Integer getMPay(String id) throws Exception;

}
