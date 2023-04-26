package com.market.service;

import java.util.List;

import com.market.domain.AuctionVO;


public interface AuctionService {
	
	public List<AuctionVO> getAList() throws Exception;
	
	public AuctionVO nowBest() throws Exception;
	
	public Integer registAuction(AuctionVO vo) throws Exception;
	
	public AuctionVO getADetail(AuctionVO vo) throws Exception;
	
	public Integer getMpay(String id) throws Exception;
	
	public void updateStatus(Integer au_num) throws Exception;
}
