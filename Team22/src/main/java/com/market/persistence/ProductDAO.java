package com.market.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.market.domain.ProductVO;

@Mapper
public interface ProductDAO {

	// 상품 리스트
	public List<ProductVO> getProdList(Map<String, Object> map);
	
	// 찜하기
	public void likeProd(int pnum);
	
	// 찜취소
	public void likeProdCancel(int pnum);
	
	// 상품 세부정보
	public Map<String, Object> getProdInfo(int product_num);
	
	// 같은 종류의 상품 추천
	public List<ProductVO> getRecProdList(String product_cate);
	
	// 판매자 매너점수(온도)
	public double getScore(String reviewee);
	
	// 상품 등록
	public void regProduct(ProductVO vo);
}
