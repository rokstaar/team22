package com.market.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.market.domain.AuctionVO;
import com.market.domain.CustomerserviceVO;
import com.market.domain.MemberVO;
import com.market.domain.NoticeVO;
import com.market.domain.ProductVO;
import com.market.domain.RandomVO;
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
	public List<MemberVO> getMemebrList(int displayPost, int postNum, String searchType, String keyword)throws Exception {
		   HashMap<String, Object> mldate = new HashMap<String, Object>();
		   
		   mldate.put("displayPost", displayPost);
		   mldate.put("postNum", postNum);
		   
		   mldate.put("searchType", searchType);
		   mldate.put("keyword", keyword);
		   
		return sqlSession.selectList(NAMESPACE+".getMemberList",mldate);
	}

	@Override
	public int searMemlist(String searchType, String keyword) throws Exception {
		 HashMap<String, Object> smdate = new HashMap<String, Object>();
		 
		 smdate.put("keyword", keyword);
		 smdate.put("searchType", searchType);	
		
		return sqlSession.selectOne(NAMESPACE+".searMemlist",smdate);
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
	public int countCs() throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".countCs");
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
	public List<CustomerserviceVO> getCsList(int displayPost, int postNum, String searchType, String keyword)throws Exception {
           HashMap<String, Object> cldate = new HashMap<String, Object>();
		
		   cldate.put("displayPost", displayPost);
		   cldate.put("postNum", postNum);
		
		   cldate.put("searchType", searchType);
		   cldate.put("keyword", keyword);
		
		  return sqlSession.selectList(NAMESPACE+".getCsList", cldate);
	}

	@Override
	public int searCslist(String searchType, String keyword) throws Exception {
          HashMap<String, Object> scdate = new HashMap<String, Object>();
		
		  scdate.put("keyword", keyword);
		  scdate.put("searchType", searchType);	
		
		  return sqlSession.selectOne(NAMESPACE+".searCslist",scdate);
	}

	

	@Override
	public List<NoticeVO> getNotiList(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		  HashMap<String, Object> nldate = new HashMap<String, Object>();
		
		   nldate.put("displayPost", displayPost);
		   nldate.put("postNum", postNum);
		
		   nldate.put("searchType", searchType);
		   nldate.put("keyword", keyword);
		
		   return sqlSession.selectList(NAMESPACE+".getNotiList",nldate);
	}

	@Override
	public int searNotilist(String searchType, String keyword) throws Exception {
		  HashMap<String, Object> sndate = new HashMap<String, Object>();
		
		  sndate.put("keyword", keyword);
		  sndate.put("searchType", searchType);
		
		  return sqlSession.selectOne(NAMESPACE+".searNotilist",sndate);
	}

	@Override
	public MemberVO getmem(Integer member_num) throws Exception {
	
		return sqlSession.selectOne(NAMESPACE+".getmem",member_num);
	}

	
	@Override
	public List<Map<String, Object>> buyprodList() throws Exception {

		return sqlSession.selectList(NAMESPACE+".buyprodList");
	}

	@Override
	public List<Map<String, Object>> buyauList() throws Exception {
	
		return sqlSession.selectList(NAMESPACE+".buyauList");
	}

	@Override
	public List<Map<String, Object>> buyranList() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+".buyranList");
	}

	@Override
	public List<AuctionVO> getAuctionList() throws Exception {
		List<AuctionVO> auctionList = sqlSession.selectList(NAMESPACE+".getAuctionList");
		
		return auctionList;
	}
	

	@Override
	public List<AuctionVO> audetail(Integer au_num) throws Exception {
		List<AuctionVO> audetail = sqlSession.selectList(NAMESPACE+".audetail",au_num);
		
		return audetail;
	}

	@Override
	public List<RandomVO> getRandomList() throws Exception {
		List<RandomVO> randomList = sqlSession.selectList(NAMESPACE+".getRandomList");
		
		return randomList;
	}

	@Override
	public List<RandomVO> randetail(Integer ran_num) throws Exception {
		List<RandomVO> randetail = sqlSession.selectList(NAMESPACE+".randetail",ran_num);
	
		return randetail;
	}

	

	@Override
	public List<ProductVO> getProductList() throws Exception {
        List<ProductVO> getproductList = sqlSession.selectList(NAMESPACE+".getProductList");
		
        return getproductList;
	}
	
	
	@Override
	public List<ProductVO> ProductList(int displayPost, int postNum, String searchType, String keyword)
			                            throws Exception {
		
		 HashMap<String, Object> pldate = new HashMap<String, Object>();
		 
		 pldate.put("displayPost", displayPost);
		 pldate.put("postNum", postNum);
		
		 pldate.put("searchType", searchType);
		 pldate.put("keyword", keyword);

		return sqlSession.selectList(NAMESPACE+".ProductList",pldate);
	}

	@Override
	public int searprodlist(String searchType, String keyword) throws Exception {
		  HashMap<String, Object> spdate = new HashMap<String, Object>();
		
		  spdate.put("keyword", keyword);
		  spdate.put("searchType", searchType);
		
		  return sqlSession.selectOne(NAMESPACE+".searprodlist",spdate);
	}

	
	@Override
	public List<AuctionVO> AuctionList(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		
         HashMap<String, Object> aldate = new HashMap<String, Object>();
		 
		 aldate.put("displayPost", displayPost);
		 aldate.put("postNum", postNum);
		
		 aldate.put("searchType", searchType);
		 aldate.put("keyword", keyword);
	
		return sqlSession.selectList(NAMESPACE+".AuctionList",aldate);
	}

	@Override
	public int searaulist(String searchType, String keyword) throws Exception {
		  HashMap<String, Object> sadate = new HashMap<String, Object>();
		
		  sadate.put("keyword", keyword);
		  sadate.put("searchType", searchType);
		
		  return sqlSession.selectOne(NAMESPACE+".searaulist",sadate);
	}
	
	
	

	
	
	
	
	

}
