package com.market.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.domain.Cs_replyVO;
import com.market.domain.CustomerserviceVO;
import com.market.persistence.Cs_replyDAO;

@Service
public class Cs_replyServiceImpl implements Cs_replyService {
	
	@Autowired
	private Cs_replyDAO rdao;
	

	private static final Logger logger = LoggerFactory.getLogger(Cs_replyServiceImpl.class);


	@Override
	public List<Cs_replyVO> relist(int cs_num) throws Exception {

		return rdao.relist(cs_num);
	}
	
	
	
	@Override
	public void proupdate(CustomerserviceVO cvo) throws Exception {
                rdao.proupdate(cvo);
		
	}

	@Override
	public void rewrite(Cs_replyVO vo) throws Exception {
		rdao.rewrite(vo);
		
	}
	
	
	@Override
	public Cs_replyVO replySelect(Cs_replyVO vo) throws Exception {
		
		return rdao.replySelect(vo);
	}



	@Override
	public void reupdate(Cs_replyVO vo) throws Exception {
		rdao.reupdate(vo);
		
	}


	@Override
	public void redelete(Cs_replyVO vo) throws Exception {
		rdao.redelete(vo);
		
	}
	
	
	


}
