package com.market.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.market.domain.MemberVO;
import com.market.domain.ProductVO;
import com.market.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO mvo;
	
	@Override
	public MemberVO loginMember(MemberVO vo) {
		
		return mvo.loginMember(vo);
	}

	@Override
	public void memberJoin(MemberVO vo) {
		
		mvo.insertMember(vo);
	}

	  @Override
	    public boolean isDuplicated(String member_id) {
	        int count = mvo.getCountById(member_id);
	        return (count > 0);
	    }

	@Override
	public boolean isCopy(String member_nickname) {
		int count =mvo.getCountByNick(member_nickname);
		return (count>0);
	}

	@Override
	public List<ProductVO> memProdList(String id) throws Exception {

		return mvo.getProdList(id);
	}

	@Override
	public List<Map<String, Object>> memSellReview(String id) throws Exception {

		return mvo.memProdReview(id);
	}
   
	
}
