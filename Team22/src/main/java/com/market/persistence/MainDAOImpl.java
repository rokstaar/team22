package com.market.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.market.domain.ProductVO;

@Repository
public class MainDAOImpl implements MainDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.market.mapper.mainMapper";

	@Override
	public List<ProductVO> selectProd() throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectProd");
	}

	@Override
	public List<ProductVO> selectAu() throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectAu");
	}

	@Override
	public List<ProductVO> selectRan() throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectRan");
	}
	
	
	

}
