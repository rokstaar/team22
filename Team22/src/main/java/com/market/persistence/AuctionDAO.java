package com.market.persistence;

import java.util.List;

import com.market.domain.AuctionVO;

public interface AuctionDAO {
	public List<AuctionVO> getAList() throws Exception;
	
	public AuctionVO nowBest() throws Exception;
	
	public Integer registerAuction(AuctionVO vo) throws Exception;
	
	public AuctionVO getADetail(AuctionVO vo) throws Exception;
	
	public Integer getMPay(String id) throws Exception;
	
	public void updateStatus(Integer au_num) throws Exception;

}
