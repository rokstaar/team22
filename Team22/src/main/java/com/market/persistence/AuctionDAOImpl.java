package com.market.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.market.domain.ACriteria;
import com.market.domain.AuctionVO;

@Repository
public class AuctionDAOImpl implements AuctionDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.market.mapper.auctionMapper";

	@Override
	public List<AuctionVO> getAList(String order, String met, ACriteria cri) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("order", order);
		map.put("met", met);
		map.put("pageStart", cri.getPageStart());
		map.put("pageSize", cri.getPageSize());
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
	public List<AuctionVO> getSearchList(String type, String search, ACriteria cri) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("search", search);
		map.put("pageStart", cri.getPageStart());
		map.put("pageSize", cri.getPageSize());
		return sqlSession.selectList(NAMESPACE+".getSearchAList", map);
	}

	@Override
	public List<AuctionVO> bestAList(ACriteria cri) throws Exception {
		return sqlSession.selectList(NAMESPACE+".bestAList", cri);
	}

	@Override
	public Integer countAuction() throws Exception {
		return sqlSession.selectOne(NAMESPACE+".countAuction");
	}

	@Override
	public Integer countAuction(String type, String search) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("search", search);
		return sqlSession.selectOne(NAMESPACE+".searchCountAuction", map);
	}

	@Override
	public void setEnd() throws Exception {
		sqlSession.update(NAMESPACE+".setEnd");
	}

	@Override
	public void endBid(AuctionVO vo) throws Exception {
		sqlSession.update(NAMESPACE+".endBid", vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
