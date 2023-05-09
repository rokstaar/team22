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
import com.market.domain.NoticeVO;
import com.market.domain.ProductVO;
import com.market.domain.TradeVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	
	private static final Logger logger 
	      = LoggerFactory.getLogger(AdminDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE 
	     = "com.itwillbs.mapper.adminMapper";

	@Override
	public List<MemberVO> getMemebrList() throws Exception {
		List<MemberVO> memberList = sqlSession.selectList(NAMESPACE+".getMemberList");
		
		return memberList;
	}

	@Override
	public List<ProductVO> getProductList() throws Exception {
        List<ProductVO> productList = sqlSession.selectList(NAMESPACE+".getProductList");
		
        return productList;
	}

	@Override
	public void createNotice(NoticeVO vo) throws Exception {
		sqlSession.insert(NAMESPACE+".writeNotice", vo);
	}

	
	@Override
	public List<NoticeVO> getNoticeList(int displayPost, int postNum, String searchType, String keyword)throws Exception {
		
		HashMap<String, Object> date = new HashMap<String, Object>();
		
		date.put("displayPost", displayPost);
		date.put("postNum", postNum);
		
		date.put("searchType", searchType);
		date.put("keyword", keyword);
		
		return sqlSession.selectList(NAMESPACE+".getNoticeList",date);
	}

	@Override
	public int searcountNotice(String searchType, String keyword) throws Exception {
		
        HashMap<String, Object> sdate = new HashMap<String, Object>();
		
		sdate.put("keyword", keyword);
		sdate.put("searchType", searchType);		
		
		return sqlSession.selectOne(NAMESPACE+".searcountNotice",sdate);
	}
	
	@Override
	public int countNotice() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".countNotice");
	}

	@Override
	public void addReadcnt(Integer noti_num) throws Exception {
		sqlSession.update(NAMESPACE+".addReadcnt",noti_num);
	}

	@Override
	public NoticeVO getNotice(Integer noti_num) throws Exception {

		return sqlSession.selectOne(NAMESPACE+".getNotice",noti_num);
	}

	@Override
	public Integer updateBoard(NoticeVO uvo) throws Exception {

		return sqlSession.update(NAMESPACE+".updateNotice",uvo);
	}  
	
	@Override
	public Integer deleteNotice(Integer noti_num) throws Exception {
         return sqlSession.delete(NAMESPACE+".deleteNotice",noti_num);
	}

	@Override
	public int countMember() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".countMember");
	}

	@Override
	public int countProduct() throws Exception {
	
		return sqlSession.selectOne(NAMESPACE+".countProduct");
	}

	

	@Override
	public List<Map<String, Object>> getbuyprodList() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".getbuyList");
	}

	@Override
	public List<Map<String, Object>> getsellprodList() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".getsellList");
	}

	@Override
	public int countTrade() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".countTrade");
	}

	
	@Override
	public List<CustomerserviceVO> getCsList() throws Exception {
		
		List<CustomerserviceVO> CstList = sqlSession.selectList(NAMESPACE+".getCsList");
		return CstList;
	}

	@Override
	public List<NoticeVO> getNotiList() throws Exception {
		
		List<NoticeVO> NotitList = sqlSession.selectList(NAMESPACE+".getNotiList");
		return NotitList;
	}
	
	
	
	

	
	
	
	
	

}
