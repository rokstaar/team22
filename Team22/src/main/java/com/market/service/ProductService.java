package com.market.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.market.domain.PCriteria;
import com.market.domain.ProductVO;

public interface ProductService {

	// 상품 리스트 가져오기
	public List<ProductVO> getProdList(String status, String category, String title, String sortvalue);
	// 상품 리스트 가져오기
	public List<ProductVO> getProdListPage(String status, String category, String title, String sortvalue
			,Integer min,Integer max, PCriteria cri);
	
	// 해당 상품 찜하기
	public void likeProd(int pnum);
	
	// 상품 찜 취소
	public void likeProdCancel(int pnum);
	
	// 회원 찜목록 있는지
	public int likeExist(int pnum, String seller);
	
	// 찜 회원 등록
	public void regFavorite(int pnum, String seller);
	
	// 찜 취소
	public void delFavorite(int pnum, String seller);
	
	// 해당 상품 정보 가져오기
	public Map<String, Object> getProdInfo(Integer pnum);
	
	// 같은 카테고리의 상품 상위 8개 무작위 추출
	public List<ProductVO> getRecProdList(String category);
	
	// 판매자 매너점수 가져오기
	public double getScore(String name);
	
	// 상품정보 등록하기
	public int regProduct(ProductVO vo, MultipartFile[] files) throws Exception;
	public void regProduct(ProductVO vo, MultipartHttpServletRequest request) throws Exception;
	
	// 조회했는지 확인하며 조회수 증가시키기
	public void incView(HttpServletRequest request, HttpServletResponse response, Integer product_num);
	
	// 상품 전체 개수 가져오기
	public int getTotalCount();
}
