package com.market.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.market.domain.AuctionVO;
import com.market.persistence.AuctionDAO;



@Service
public class AcutionServiceImpl implements AuctionService {
	
	@Inject
	private AuctionDAO adao;

	@Override
	public List<AuctionVO> getAList() throws Exception {
		
		return adao.getAList();
	}

	@Override
	public AuctionVO nowBest() throws Exception {
		return adao.nowBest();
	}

	@Override
	public Integer registAuction(AuctionVO vo) throws Exception {
		return adao.registerAuction(vo);
	}

	@Override
	public AuctionVO getADetail(AuctionVO vo) throws Exception {
		return adao.getADetail(vo);
	}

	@Override
	public Integer getMpay(String id) throws Exception {
		return adao.getMPay(id);
	}

	@Override
	public void updateStatus(Integer au_num) throws Exception {
		adao.updateStatus(au_num);
	}

	@Override
	public void insertBid(AuctionVO vo) throws Exception {
		adao.insertBid(vo);
	}

	@Override
	public void minusPay(String id, int mPay) throws Exception {
		adao.minusPay(id, mPay);
	}

	@Override
	public void plusPay(String lBuyer, int pPay) throws Exception {
		adao.plusPay(lBuyer, pPay);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
