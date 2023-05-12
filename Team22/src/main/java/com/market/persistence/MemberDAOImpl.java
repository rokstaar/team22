package com.market.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.market.domain.CustomerserviceVO;
import com.market.domain.MemberVO;
import com.market.domain.Pay_chargeVO;
import com.market.domain.ProductVO;
import com.market.domain.TradeVO;

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
	@Override
	public MemberVO memberInfo(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE+".memberInfo", id);
	}
	@Override
	public void memberInfoUpdate(MemberVO vo) throws Exception {
		
		sqlSession.update(NAMESPACE+".memberInfoUpdate",vo);
	}
	@Override
	public void deleteMemPic(String id) throws Exception {
        sqlSession.delete(NAMESPACE + ".deleteMemPic", id);
		
	}
	@Override
	public void updateMemberPic(String id, String memberPicPath) throws Exception {
		 Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("member_id", id);
        paramMap.put("memberPicPath", memberPicPath);
        sqlSession.update(NAMESPACE + ".updateMemberPic", paramMap);		
	}
	
	
	@Override
	public List<MemberVO> findId(String memberEmail)throws Exception{
		return sqlSession.selectList(NAMESPACE+".findId", memberEmail);
	}
	
	@Override
	public int findIdCheck(String memberEmail)throws Exception{
		return sqlSession.selectOne(NAMESPACE+".findIdCheck", memberEmail);
	}
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sqlSession.delete(NAMESPACE+".memberDelete",vo);
	}

	@Override
	public List<Map<String, Object>> userInfo(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".userInfo",id);
	}
	
	
	@Override
	public Double avgScore(String id) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".avgScore",id);
	}
	
	@Override
	public Integer insertPayCharge(Pay_chargeVO vo) {
		return sqlSession.insert(NAMESPACE+".payCharge",vo);
	}
	@Override
	public Integer memberPayCharge(Pay_chargeVO vo) {
		return sqlSession.update(NAMESPACE+".memberPayCharge",vo);
	}
	@Override
	public Integer payWithdraw(Map<String,Object> vo) throws Exception {
		return sqlSession.update(NAMESPACE+".payWithdraw",vo);
	}
	@Override
	public int countTrade(String id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countTrade", id);
	}
	
	@Override
	public void updatePw(MemberVO vo) throws Exception {
		sqlSession.update(NAMESPACE+".updatePwById",vo);
		
	}
	@Override
	public MemberVO readMember(String id) throws Exception {
	  List<MemberVO> memberList = sqlSession.selectList(NAMESPACE + ".readMemberById", id);
      return memberList.isEmpty() ? null : memberList.get(0);
	}
	
	@Override
	public List<Map<String, Object>> allSerrch() throws Exception {
		return sqlSession.selectList(NAMESPACE+".allSerrch");
	}
	@Override
	public List<CustomerserviceVO> myCs(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE+".myCs", id);
	}

}
