package com.market.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.domain.AuctionVO;
import com.market.domain.ProductVO;
import com.market.domain.RandomVO;
import com.market.domain.ReviewVO;
import com.market.persistence.TradeDAO;

@Service
public class TradeServiceImpl implements TradeService{
	
	private static final Logger logger = LoggerFactory.getLogger(TradeServiceImpl.class);
	
	@Inject
	private TradeDAO tdao;
	
	@Override
	public List<Map<String,Object>> getBuyReview(String id) throws Exception {
		
		return tdao.buyReviewList(id);
	}

	@Override
	public List<Map<String,Object>> tSellReview(String id) throws Exception {
		
		return tdao.tSellReview(id);
	}

	@Override
	public List<Map<String,Object>> buyList(String id) throws Exception {
		
		
		return tdao.buyList(id);
		
	}
	
	@Override
	public List<Map<String,Object>> prodList() throws Exception {
		
		
		return tdao.prodList();
		
	}

	@Override
	public Integer writeReview(ReviewVO rvo) throws Exception {
		return tdao.insertReview(rvo);
	}

	@Override
	public void memberScore(double score) throws Exception {
		tdao.avgScore(score);
	}

	@Override
	public List<ProductVO> myProdList(String id) throws Exception {

		return tdao.getProdList(id);
	}

	@Override
	public List<AuctionVO> buyAuctionList(String id) throws Exception {
		return tdao.auBuyList(id);
	}

	@Override
	public List<AuctionVO> getAuctionList(String id) throws Exception {
		return tdao.getAList(id);
	}

	@Override
	public List<AuctionVO> mySaleAuction(String id) throws Exception {
		return tdao.getAuctList(id);
	}

	@Override
	public List<Map<String, Object>> favoriteList(String id) throws Exception {
		return tdao.getFavorite(id);
	}

	@Override
	public List<RandomVO> mySaleRandom(String id) throws Exception {
		// TODO Auto-generated method stub
		return tdao.myRandomList(id);
	}

	@Override
	public Integer removeReview(Integer prod_num) throws Exception {
		return tdao.deleteReview(prod_num);
	}

	@Override
	public Integer removeProduct(Integer product_num) throws Exception {
		return tdao.deleteProduct(product_num);
	}

	@Override
	public Integer removeAuction(Integer au_num) throws Exception {
		return tdao.deleteAuction(au_num);
	}

	@Override
	public Integer removeRandom(Integer ran_num) throws Exception {
		return tdao.deleteRandom(ran_num);
	}

	@Override
	public List<Map<String, Object>> myBuyAuction(String id) throws Exception {
		return tdao.myBuyAuction(id);
	}

	@Override
	public List<Map<String, Object>> myBuyRandom(String id) throws Exception {
		return tdao.myBuyRandom(id);
	}

	@Override
	public List<RandomVO> myBuyRandomList(String id) throws Exception {
		return tdao.myBuyRandomList(id);
	}

	@Override
	public List<Map<String, Object>> getSoldProduct(String id) throws Exception {
		return tdao.getSoldProduct(id);
	}

	@Override
	public List<Map<String, Object>> getSoldAuction(String id) throws Exception {
		return tdao.getSoldAuction(id);
	}

	@Override
	public List<Map<String, Object>> getSoldRandom(String id) throws Exception {
		return tdao.getSoldRandom(id);
	}



	
	
	
	
	
	
	
}
