package com.market.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.market.domain.RandomVO;
import com.market.persistence.RandomDAO;

@Service
public class RandomServiceImpl implements RandomService {
	@Inject
	private RandomDAO rdao;

	@Override
	public void rRegist(RandomVO vo) throws Exception {
		rdao.rRegist(vo);
	}

	@Override
	public List<RandomVO> rlist() throws Exception {
		return rdao.rList();
	}

	@Override
	public RandomVO rDetail(int ran_num) throws Exception {
		return rdao.rDetail(ran_num);
	}

	@Override
	public Integer countP(int ran_num) throws Exception {
		return rdao.countP(ran_num);
	}

	@Override
	public Integer getMPay(String id) throws Exception {
		return rdao.getMPay(id);
	}

	@Override
	public void rBid(RandomVO vo) throws Exception {
		rdao.rBid(vo);
	}

	@Override
	public void minusPay(String id, int mPay) throws Exception {
		rdao.minusPay(id, mPay);
	}

	@Override
	public List<String> selectBuyer(int ran_num) throws Exception {
		return rdao.selectBuyer(ran_num);
	}

	@Override
	public RandomVO nowBest() throws Exception {
		return rdao.nowBest();
	}

	@Override
	public String selectTrade(int ran_num) throws Exception {
		return rdao.selectTrade(ran_num);
	}

	@Override
	public void updateRan(int ran_num) throws Exception {
		rdao.updateRan(ran_num);
	}

	@Override
	public RandomVO selectWinner(int ran_num) throws Exception {
		return rdao.selectWinner(ran_num);
	}

	@Override
	public void insertTrade(RandomVO vo) throws Exception {
		rdao.insertTrade(vo);
	}

	@Override
	public void plusPay(RandomVO vo) throws Exception {
		rdao.plusPay(vo);
	}
	
	
	
	
	
	
	
}
