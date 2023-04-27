package com.market.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.market.domain.AuctionVO;

@Repository
public class AuctionDAOImpl implements AuctionDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.market.mapper.auctionMapper";

	@Override
	public List<AuctionVO> getAList(String order, String met) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("order", order);
		map.put("met", met);
		return sqlSession.selectList(NAMESPACE + ".getAList", map);
	}

	@Override
	public AuctionVO nowBest() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".nowBest");
	}

	@Override
	public Integer registerAuction(AuctionVO vo) throws Exception {
		return sqlSession.insert(NAMESPACE+".registAuction", vo);
	}

	@Override
	public AuctionVO getADetail(AuctionVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getADetail", vo);
	}

	@Override
	public Integer getMPay(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".getMPay", id);
	}

	@Override
	public void updateStatus(Integer au_num) throws Exception {
		sqlSession.update(NAMESPACE+".updateStatus", au_num);
	}

	@Override
	public void insertBid(AuctionVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".insertBid", vo);
	}

	@Override
	public void minusPay(String id, int mPay) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("mPay", mPay);
		sqlSession.update(NAMESPACE+".minusPay", map);
		
	}

	@Override
	public void plusPay(String lBuyer, int pPay) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("lBuyer", lBuyer);
		map.put("pPay", pPay);
		sqlSession.update(NAMESPACE+".plusPay", map);
	}

	@Override
	public List<AuctionVO> getSearchList(String search) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getSearchAList", search);
	}

	@Override
	public List<AuctionVO> bestAList() throws Exception {
		return sqlSession.selectList(NAMESPACE+".bestAList");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
