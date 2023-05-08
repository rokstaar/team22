package com.market.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.market.domain.ACriteria;
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
	public List<RandomVO> rList(ACriteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE+".rList", cri);
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

	@Override
	public void rBid(RandomVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".rBid", vo);
	}

	@Override
	public void minusPay(String id, int mPay) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("mPay", mPay);
		sqlSession.update(NAMESPACE+".minusPay", map);
	}

	@Override
	public List<String> selectBuyer(int ran_num) throws Exception {
		return sqlSession.selectList(NAMESPACE+".selectBuyer", ran_num);
	}

	@Override
	public RandomVO nowBest() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".nowBest");
	}

	@Override
	public String selectTrade(int ran_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".selectTrade", ran_num);
	}

	@Override
	public void updateRan(int ran_num) throws Exception {
		sqlSession.update(NAMESPACE+".updateRan", ran_num);
	}

	@Override
	public RandomVO selectWinner(int ran_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".selectWinner", ran_num);
	}

	@Override
	public void insertTrade(RandomVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".insertTrade", vo);
	}

	@Override
	public void plusPay(RandomVO vo) throws Exception {
		sqlSession.update(NAMESPACE+".plusPay", vo);
	}

	@Override
	public List<RandomVO> myRan(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".myRan", id);
	}

	@Override
	public Integer countRan() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countRan");
	}

	@Override
	public List<RandomVO> searchList(ACriteria cri, String type, String search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageStart", cri.getPageStart());
		map.put("pageSize", cri.getPageSize());
		map.put("type", type);
		map.put("search", search);
		return sqlSession.selectList(NAMESPACE+".searchList", map);
	}

	@Override
	public Integer countSearch(String type, String search) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("search", search);
		return sqlSession.selectOne(NAMESPACE+".countSearch", map);
	}

	
	
	
	
	
	
	
	
	
	
	
	

}
