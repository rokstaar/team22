package com.market.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.market.domain.Cs_replyVO;
import com.market.domain.CustomerserviceVO;

@Repository
public class Cs_replyDAOImpl implements Cs_replyDAO {

	@Inject
	private SqlSession sqlSession;
	
	
	private static final Logger logger = LoggerFactory.getLogger(Cs_replyDAOImpl.class);
	
	private static final String NAMESPACE  = "com.itwillbs.mapper.cs_replyMapper";

	
	@Override
	public List<Cs_replyVO> relist(int cs_num) throws Exception {
		List<Cs_replyVO> replyList = sqlSession.selectList(NAMESPACE+".replyList",cs_num); 
		
		return replyList;
	}
	
	
	@Override
	public void proupdate(CustomerserviceVO cvo) throws Exception {
	          sqlSession.update(NAMESPACE+".proupdate",cvo);
		
	}
	
	@Override
	public void rewrite(Cs_replyVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".replyWrite", vo);
		
	}
	
	
	@Override
	public Cs_replyVO replySelect(Cs_replyVO vo) throws Exception {

		return sqlSession.selectOne(NAMESPACE+".replySelect", vo);
	}


	@Override
	public void reupdate(Cs_replyVO vo) throws Exception {
		sqlSession.update(NAMESPACE+".replyModify", vo);
		
	}

	@Override
	public void redelete(Cs_replyVO vo) throws Exception {
		sqlSession.delete(NAMESPACE+".replyDelete", vo);
		
	}

	
}

