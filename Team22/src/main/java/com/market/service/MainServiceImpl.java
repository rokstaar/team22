package com.market.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.market.domain.ProductVO;
import com.market.persistence.MainDAO;

@Service
public class MainServiceImpl implements MainService {

	@Inject
	private MainDAO mdao;

	@Override
	public List<ProductVO> selectProd() throws Exception {
		return mdao.selectProd();
	}

	@Override
	public List<ProductVO> selectAu() throws Exception {
		return mdao.selectAu();
	}

	@Override
	public List<ProductVO> selectRan() throws Exception {
		return mdao.selectRan();
	}
	
	
	
}
