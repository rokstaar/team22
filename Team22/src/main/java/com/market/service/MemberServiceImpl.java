package com.market.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.market.domain.MemberVO;
import com.market.domain.ProductVO;
import com.market.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO mvo;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	
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
		logger.info("@@@@@@@@@@memberSERVICE@@@@@@@@@@@@"+id);
		return mvo.memProdReview(id);
	}

	@Override
	public MemberVO memberInfo(String id) throws Exception {
		return mvo.memberInfo(id);
	}

	@Override
	public void memberInfoUpdate(MemberVO vo) throws Exception {
		mvo.memberInfoUpdate(vo);
		
	}

	@Override
	public void modifyUimage(String id, String memberPicPath) throws Exception {
		mvo.updateMemberPic(id, memberPicPath);
	}
	@Override
	public List<MemberVO> findId(String memberEmail)throws Exception{
		return mvo.findId(memberEmail);
	}
	
	@Override
	public int findIdCheck(String memberEmail)throws Exception{
		return mvo.findIdCheck(memberEmail);
	}

	@Override
	public void removeMember(MemberVO vo) throws Exception {
		mvo.memberDelete(vo);
	}
	@Override
	public List<Map<String, Object>> userInfo(String id) throws Exception {
		return mvo.userInfo(id);
	}
	
	@Override
	public Double memberScore(String id) throws Exception {
		return mvo.avgScore(id);
	}
}
