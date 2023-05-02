package com.market.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.market.domain.RandomVO;

@Repository
public class RandomDAOImpl implements RandomDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.market.mapper.randomMapper";

	@Override
	public void rRegist(RandomVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".rRegist", vo);
	}

	@Override
	public List<RandomVO> rList() throws Exception {
		return sqlSession.selectList(NAMESPACE+".rList");
	}

	@Override
	public RandomVO rDetail(int ran_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".rDetail", ran_num);
	}

	@Override
	public Integer countP(int ran_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countP", ran_num);
	}

	@Override
	public Integer getMPay(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getMPay", id);
	}
	
	
	
	

}
