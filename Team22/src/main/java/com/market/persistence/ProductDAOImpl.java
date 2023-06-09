package com.market.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.util.ProductRegException;
import com.market.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);
	@Autowired
	private SqlSession session;
	private static final String NAMESPACE = "com.itwillbs.mapper.ProductMapper";

	// 상품 리스트
	@Override
	public List<ProductVO> getProdList(Map<String, Object> map) {
		logger.info("DAO - 상품 리스트 호출 {}", map);
		return session.selectList(NAMESPACE + ".getProdList", map);
	}
	
	@Override
	public List<ProductVO> getProdListPage(Map<String, Object> map) {
		return session.selectList(NAMESPACE + ".getProdListPage", map);
	}

	// 찜하기
	@Override
	public void likeProd(int product_num) {
		session.update(NAMESPACE + ".likeProd", product_num);
	}

	@Override
	public void likeProdCancel(int product_num) {
		session.update(NAMESPACE + ".likeProdCancel", product_num);
	}
	
	@Override
	public int likeExist(Map<String, Object> map) {
		return session.selectOne(NAMESPACE + ".likeExist", map);
	}

	@Override
	public void regFavorite(Map<String, Object> map) {
		session.insert(NAMESPACE + ".regFav", map);
	}

	@Override
	public void delFavorite(Map<String, Object> map) {
		session.delete(NAMESPACE + ".delFav", map);
	}

	
	

	// 상품 정보
	@Override
	public Map<String, Object> getProdInfo(Integer product_num) {
		logger.info("DAO - 상품 정보 가져오기");
		return session.selectOne(NAMESPACE + ".getProdInfo", product_num);
	}

	@Override
	public List<ProductVO> getRecProdList(String product_cate) {
		return session.selectList(NAMESPACE + ".recProd", product_cate);
	}

	@Override
	public double getScore(String reviewee) {
		return session.selectOne(NAMESPACE + ".getScore", reviewee);
	}

	@Override
	public void regProduct(ProductVO vo) {
		logger.info("DAO - 상품 등록 실행");
		try {
			session.insert(NAMESPACE + ".regProd", vo);
		} catch (Exception e) {
			throw new ProductRegException("등록 과정에서 오류가 발생했습니다", e, vo.getProduct_seller());
		}
	}

	@Override
	public int getLastProdNum(String product_seller) {
		return session.selectOne(NAMESPACE + ".lastProdNum", product_seller);
	}

	@Override
	public void incView(Integer product_num) {
		session.update(NAMESPACE + ".viewInc", product_num);
	}

	@Override
	public int getTotalCount() {
		return session.selectOne(NAMESPACE + ".getTotalCount");
	}

	@Override
	public int updateProd(ProductVO vo) {
		return session.update(NAMESPACE + ".updateProd", vo);
	}

	@Override
	public int deleteProd(Integer pnum) {
		return session.delete(NAMESPACE + ".deleteProd", pnum);
	}

	@Override
	public String getFavCate(String member_id) {
		return session.selectOne(NAMESPACE + ".getFavProdCate", member_id);
	}

	@Override
	public List<ProductVO> getFavLike() {
		return session.selectList(NAMESPACE + ".getFavProdLike");
	}

	@Override
	public List<ProductVO> getFavInterest() {
		return session.selectList(NAMESPACE + ".getFavProdInterest");
	}



	
}
