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
	public Integer insertReview(ReviewVO rvo) throws Exception {
		
		 return sqlSession.insert(NAMESPACE+".insertReview",rvo);
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
	public List<AuctionVO> getAList(String id) throws Exception {

		return sqlSession.selectList(NAMESPACE+".getAList",id);
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

	@Override
	public Integer deleteReview(Integer prod_num) throws Exception {
		return sqlSession.delete(NAMESPACE+".deleteReview",prod_num);
	}

	@Override
	public Integer deleteProduct(Integer product_num) throws Exception {
		// TODO Auto-generated method stub
		
		return sqlSession.delete(NAMESPACE+".deleteProduct",product_num);
	}

	@Override
	public Integer deleteAuction(Integer au_num) throws Exception {
		return sqlSession.delete(NAMESPACE+".deleteAuction",au_num);
	}

	@Override
	public Integer deleteRandom(Integer ran_num) throws Exception {
		return sqlSession.delete(NAMESPACE+".deleteRandom",ran_num);
	}

	@Override
	public List<Map<String, Object>> myBuyAuction(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".myBuyAuction",id);
	}

	@Override
	public List<Map<String, Object>> myBuyRandom(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".myBuyRandom",id);
	}

	@Override
	public List<RandomVO> myBuyRandomList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".myBuyRandomList",id);
	}

	@Override
	public List<Map<String, Object>> getSoldProduct(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getSoldProduct",id);
	}

	@Override
	public List<Map<String, Object>> getSoldAuction(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getSoldAuction",id);
	}

	@Override
	public List<Map<String, Object>> getSoldRandom(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".getSoldRandom",id);
	}

	

	
	
	
		
	
	
	
}
