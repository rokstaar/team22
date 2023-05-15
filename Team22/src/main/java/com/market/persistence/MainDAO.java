package com.market.persistence;

import java.util.List;

import com.market.domain.ProductVO;

public interface MainDAO {
	public List<ProductVO> selectProd() throws Exception;
	
	public List<ProductVO> selectAu() throws Exception;
	
	public List<ProductVO> selectRan() throws Exception;
	
	

}
