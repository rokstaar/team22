package com.market.service;

import java.util.List;

import com.market.domain.ACriteria;
import com.market.domain.AuctionVO;


public interface AuctionService {
	
	public List<AuctionVO> getAList(String order, String met, ACriteria cri) throws Exception;
	
	public AuctionVO nowBest() throws Exception;
	
	public Integer registAuction(AuctionVO vo) throws Exception;
	
	public AuctionVO getADetail(AuctionVO vo) throws Exception;
	
	public Integer getMpay(String id) throws Exception;
	
	public void updateStatus(Integer au_num) throws Exception;
	
	public void insertBid(AuctionVO vo) throws Exception;
	
	public void minusPay(String id, int mPay) throws Exception;
	
	public void plusPay(String lBuyer, int pPay) throws Exception;
	
	public List<AuctionVO> getSearchList(String type, String search, ACriteria cri) throws Exception;
	
	public List<AuctionVO> bestAList(ACriteria cri) throws Exception;
	
	public Integer countAuction() throws Exception;
	
	public Integer countAuction(String type, String search) throws Exception;
	
	public void setEnd() throws Exception;
	
	public void endBid(AuctionVO vo) throws Exception;
	
	public List<AuctionVO> myList(String id) throws Exception;
	
	public void Aconfirmed(AuctionVO vo) throws Exception;
}
