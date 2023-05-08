package com.market.schedule;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SchedulerDAOImpl implements SchedulerDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.market.mapper.randomMapper";
	private static final String aNAMESPACE = "com.market.mapper.auctionMapper";
	
	@Override
	public Integer schedule() throws Exception {
		return sqlSession.update(NAMESPACE+".schedule");
	}

	@Override
	public List<Integer> endNum() throws Exception {
		return sqlSession.selectList(NAMESPACE+".endNum");
	}

	@Override
	public void endPlusPay(int num) throws Exception {
		sqlSession.update(NAMESPACE+".endPlusPay", num);
	}

	@Override
	public void confirmRan() throws Exception {
		sqlSession.update(NAMESPACE+".confirmRan");
	}

	@Override
	public void endATime() throws Exception {
		sqlSession.update(aNAMESPACE+".endATime");
	}
	
	
	
	
	
	
}
