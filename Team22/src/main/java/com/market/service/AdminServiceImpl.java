package com.market.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.domain.MemberVO;
import com.market.domain.NoticeVO;
import com.market.domain.ProductVO;
import com.market.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adao;
	
	private static final Logger logger 
	        = LoggerFactory.getLogger(AdminServiceImpl.class);

	@Override
	public List<MemberVO> memberList() throws Exception {
		return adao.getMemebrList();
	}

	@Override
	public List<ProductVO> productList() throws Exception {
		return adao.getProductList();
	}

	@Override
	public void writeNotice(NoticeVO vo) throws Exception {
		   adao.createNotice(vo);
	}

	@Override
	public List<NoticeVO> noticeList() throws Exception {
		return adao.getNoticeList();
	}

	@Override
	public void updateReadCnt(Integer noti_num) throws Exception {
		adao.addReadcnt(noti_num);
	}

	@Override
	public NoticeVO getBoard(Integer noti_num) throws Exception {
		return adao.getNotice(noti_num);
	}

	@Override
	public Integer modifyBoard(NoticeVO uvo) throws Exception {
		return adao.updateBoard(uvo);
	}
	
	


}
