package com.market.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.domain.AuctionVO;
import com.market.domain.ProductVO;
import com.market.domain.ReviewVO;
import com.market.domain.TradeVO;
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
	public void writeReview(ReviewVO rvo) throws Exception {
		tdao.insertReview(rvo);
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
	public List<AuctionVO> getAuctionList() throws Exception {
		return tdao.getAList();
	}

	@Override
	public List<AuctionVO> mySaleAuction(String id) throws Exception {
		// TODO Auto-generated method stub
		return tdao.getAuctList(id);
	}
	
	
	
	
	
}
