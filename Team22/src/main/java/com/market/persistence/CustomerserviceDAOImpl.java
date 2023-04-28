package com.market.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.market.domain.CustomerserviceVO;

@Repository
public class CustomerserviceDAOImpl implements CustomerserviceDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerserviceDAOImpl.class);
	
	private static final String NAMESPACE  = "com.itwillbs.mapper.customerserviceMapper";

	@Override
	public void createBoard(CustomerserviceVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".writeBoard",vo);
	}

	@Override
	public List<CustomerserviceVO> getBoardList() throws Exception {
		return sqlSession.selectList(NAMESPACE+".getBoardList");
		
	}

	@Override
	public void addCscnt(Integer cs_num) throws Exception {
		sqlSession.update(NAMESPACE+".addcsCnt", cs_num);
	}

	@Override
	public CustomerserviceVO getBoard(Integer cs_num) throws Exception {

		return sqlSession.selectOne(NAMESPACE+".getBoard",cs_num);
	}

	@Override
	public Integer updateBoard(CustomerserviceVO vo) throws Exception {

		return sqlSession.update(NAMESPACE+".updateBoard", vo);
	}

	@Override
	public Integer deleteBoard(Integer cs_num) throws Exception {

		return sqlSession.delete(NAMESPACE+".deleteBoard", cs_num);
	}

	
	

}
