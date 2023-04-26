package com.market.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.market.domain.ProductVO;

public interface ProductService {

	// 상품 리스트 가져오기
	public List<ProductVO> getProdList(String status, String category, String title, String sortvalue);
	
	// 해당 상품 찜하기
	public void likeProd(int pnum);
	
	// 상품 찜 취소
	public void likeProdCancel(int pnum);
	
	// 해당 상품 정보 가져오기
	public Map<String, Object> getProdInfo(int pnum);
	
	// 같은 카테고리의 상품 상위 8개 무작위 추출
	public List<ProductVO> getRecProdList(String category);
	
	// 판매자 매너점수 가져오기
	public double getScore(String name);
	
	// 상품정보 등록하기
	public void regProduct(ProductVO vo, MultipartFile[] files, HttpServletRequest request) throws Exception;
}
