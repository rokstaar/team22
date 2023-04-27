package com.market.persistence;

import java.util.List;

import com.market.domain.AuctionVO;

public interface AuctionDAO {
	public List<AuctionVO> getAList(String order, String met) throws Exception;
	
	public AuctionVO nowBest() throws Exception;
	
	public Integer registerAuction(AuctionVO vo) throws Exception;
	
	public AuctionVO getADetail(AuctionVO vo) throws Exception;
	
	public Integer getMPay(String id) throws Exception;
	
	public void updateStatus(Integer au_num) throws Exception;
	
	public void insertBid(AuctionVO vo) throws Exception;
	
	public void minusPay(String id, int mPay) throws Exception;
	
	public void plusPay(String lBuyer, int pPay) throws Exception;
	
	public List<AuctionVO> getSearchList(String search) throws Exception;
	
	public List<AuctionVO> bestAList() throws Exception;
	

}
