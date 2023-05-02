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
	
	
	
	
	
	
}
