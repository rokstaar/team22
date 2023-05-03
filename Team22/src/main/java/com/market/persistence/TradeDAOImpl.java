package com.market.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.market.domain.AuctionVO;
import com.market.domain.ProductVO;
import com.market.domain.RandomVO;
import com.market.domain.ReviewVO;
import com.market.domain.TradeVO;

@Repository
public class TradeDAOImpl implements TradeDAO{

	@Inject
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.market.mapper.tradeMapper";

	private static final Logger logger = LoggerFactory.getLogger(TradeDAOImpl.class);

	@Override
	public List<Map<String,Object>> buyReviewList(String id) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".buyReviewList",id);
	}

	@Override
	public List<Map<String,Object>> tSellReview(String id) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".tSellReview",id);
	}

	@Override
	public List<Map<String,Object>> buyList(String id) throws Exception {
		
		
		return sqlSession.selectList(NAMESPACE+".buyList",id);
	}
	
	@Override
	public List<Map<String,Object>> prodList() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".prodList");
	}

	@Override
	public void insertReview(ReviewVO rvo) throws Exception {
		
		 sqlSession.insert(NAMESPACE+".insertReview",rvo);
	}

	@Override
	public void avgScore(double score) throws Exception {
		
	}

	@Override
	public List<ProductVO> getProdList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".myProdList", id);
	}


	@Override
	public List<AuctionVO> auBuyList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".auBuyList", id);
	}

	@Override
	public List<AuctionVO> getAList() throws Exception {

		return sqlSession.selectList(NAMESPACE+".getAList");
	}

	@Override
	public List<AuctionVO> getAuctList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".myAuctionList", id);
	}

	@Override
	public List<Map<String,Object>> getFavorite(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getFavorite",id);
	}

	@Override
	public void delFavorite(Map<String, Object> map) {
		sqlSession.update(NAMESPACE+".likeProdCancel",map);
	}

	@Override
	public List<RandomVO> myRandomList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".myRandomList",id);
	}

	

	
		
	
	
	
}
