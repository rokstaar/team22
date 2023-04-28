package com.market.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.market.domain.MemberVO;
import com.market.domain.ProductVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static final Logger logger 
			= LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.memberMapper";
	@Override
	public MemberVO loginMember(MemberVO vo) {
		
		return sqlSession.selectOne(NAMESPACE+".login",vo);
	}
	@Override
	public void insertMember(MemberVO vo) {

		int result= sqlSession.insert(NAMESPACE+".insertMember", vo);
		
		if(result>0) {
			logger.info("DAO : ȸ������ ����!");
		}
	}
	@Override
	public int getCountById(String member_id) {
		
		return sqlSession.selectOne(NAMESPACE+".getCountById", member_id);
	}
	@Override
	public int getCountByNick(String member_nickname) {
		return sqlSession.selectOne(NAMESPACE+".getCountByNick", member_nickname);
	}
	@Override
	public List<ProductVO> getProdList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".memProdList", id);
	}
	@Override
	public List<Map<String, Object>> memProdReview(String id) throws Exception {

		return sqlSession.selectList(NAMESPACE+".memProdReview", id);
	}

	

}
