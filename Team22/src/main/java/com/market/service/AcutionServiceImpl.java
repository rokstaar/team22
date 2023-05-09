package com.market.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.market.domain.ACriteria;
import com.market.domain.AuctionVO;
import com.market.persistence.AuctionDAO;



@Service
public class AcutionServiceImpl implements AuctionService {
	
	@Inject
	private AuctionDAO adao;

	@Override
	public List<AuctionVO> getAList(String order, String met, ACriteria cri) throws Exception {
		
		return adao.getAList(order, met, cri);
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

	@Override
	public List<AuctionVO> getSearchList(String type, String search, ACriteria cri) throws Exception {
		return adao.getSearchList(type, search, cri);
	}

	@Override
	public List<AuctionVO> bestAList(ACriteria cri) throws Exception {
		return adao.bestAList(cri);
	}

	@Override
	public Integer countAuction() throws Exception {
		return adao.countAuction();
	}

	@Override
	public Integer countAuction(String type, String search) throws Exception {
		return adao.countAuction(type, search);
	}

	@Override
	public void setEnd() throws Exception {
		adao.setEnd();
	}

	@Override
	public void endBid(AuctionVO vo) throws Exception {
		adao.endBid(vo);
	}

	@Override
	public List<AuctionVO> myList(String id) throws Exception {
		return adao.myList(id);
	}

	@Override
	public void Aconfirmed(AuctionVO vo) throws Exception {
		adao.Aconfirmed(vo);
	}

	@Override
	public void endConfirm(AuctionVO vo) throws Exception {
		adao.endConfirm(vo);
	}

	@Override
	public Integer countA(AuctionVO vo) throws Exception {
		return adao.countA(vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
