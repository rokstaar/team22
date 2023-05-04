package com.market.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.domain.ACriteria;
import com.market.domain.CustomerserviceVO;
import com.market.persistence.CustomerserviceDAO;

@Service
public class CustomerserviceServiceImpl implements CustomerserviceService {
	
	@Autowired
	private CustomerserviceDAO cdao;

	private static final Logger logger = LoggerFactory.getLogger(CustomerserviceServiceImpl.class);

	@Override
	public void writeBoard(CustomerserviceVO vo) throws Exception {
		 cdao.createBoard(vo);
	}

	@Override
	public void updateReadCnt(Integer cs_num) throws Exception {
		   cdao.addCscnt(cs_num);
	}

	@Override
	public CustomerserviceVO getBoard(Integer cs_num) throws Exception {
		
		return cdao.getBoard(cs_num);
	}

	@Override
	public Integer updateBoard(CustomerserviceVO vo) throws Exception {

		return cdao.updateBoard(vo);
	}

	@Override
	public Integer deleteBoard(Integer cs_num) throws Exception {

		return cdao.deleteBoard(cs_num);
	}

	@Override
	public void re_board(CustomerserviceVO vo) throws Exception {
	                 cdao.re_board(vo);
	}

	
	@Override
	public List<CustomerserviceVO> boardList(int displayPost, int postNum,String searchType, String keyword) throws Exception {
		
		return cdao.getBoardList(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searcountCs(String searchType, String keyword) throws Exception {

		return cdao.searcountCs(searchType, keyword);
	}

	

	

	
	

}
