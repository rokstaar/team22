package com.market.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.market.domain.ProductVO;

@Mapper
public interface ProductDAO {

	// 상품 리스트
	public List<ProductVO> getProdList(Map<String, Object> map);
	
	// 상품 리스트 페이지
	public List<ProductVO> getProdListPage(Map<String, Object> map);
	
	// 찜하기
	public void likeProd(int pnum);
	
	// 찜취소
	public void likeProdCancel(int pnum);
	
	// 찜목록에 당 회원 있는지
	public int likeExist(Map<String, Object> map);
	
	// 찜 회원 등록
	public void regFavorite(Map<String, Object> map);
	
	// 찜 회원 삭제
	public void delFavorite(Map<String, Object> map);
	
	// 상품 세부정보
	public Map<String, Object> getProdInfo(Integer product_num);
	
	// 같은 종류의 상품 추천
	public List<ProductVO> getRecProdList(String product_cate);
	
	// 판매자 매너점수(온도)
	public double getScore(String reviewee);
	
	// 상품 등록
	public void regProduct(ProductVO vo);
	
	// 상품 마지막 등록 번호
	public int getLastProdNum(String product_seller);
	
	// 조회수 증가
	public void incView(Integer product_num);
	
	// 상품 숫자 세기
	public int getTotalCount();
	
	// 상품 정보 수정
	public int updateProd(ProductVO vo);
	
	// 상품 정보 삭제
	public int deleteProd(Integer pnum);
}
