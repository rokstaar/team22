package com.market.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.market.domain.ProductVO;
import com.market.persistence.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService{
	
	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	@Autowired
	private ProductDAO pdao;
	
	@Override
	public List<ProductVO> getProdList(String grade, String category, String title, String sort) {
		logger.info("service - 상품 목록 호출");
		Map<String, Object> map = new HashMap<>();
		map.put("grade", grade);
		map.put("category", category);
		map.put("title", title);
		map.put("sortBy", sort);
		return pdao.getProdList(map);
	}

	@Override
	public void likeProd(int pnum) {
		pdao.likeProd(pnum);
	}

	@Override
	public void likeProdCancel(int pnum) {
		pdao.likeProdCancel(pnum);
	}

	@Override
	public int likeExist(String seller) {
		return pdao.likeExist(seller);
	}
	
	@Override
	public void regFavorite(int pnum, String seller) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pnum", pnum);
		map.put("id", seller);
		pdao.regFavorite(map);
	}

	@Override
	public void delFavorite(int pnum, String seller) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pnum", pnum);
		map.put("id", seller);
		pdao.delFavorite(map);
	}


	@Override
	public Map<String, Object> getProdInfo(Integer pnum) {
		logger.info("service - 상품 정보 가져오기");
		return pdao.getProdInfo(pnum);
	}

	@Override
	public List<ProductVO> getRecProdList(String category) {
		return pdao.getRecProdList(category);
	}

	@Override
	public double getScore(String name) {
		return pdao.getScore(name);
	}

	@Override
	public void regProduct(ProductVO vo
						, MultipartFile[] files
						, HttpServletRequest request) throws Exception {
		logger.info("service - 상품 등록");
		String path = "C:\\Users\\ITWILL\\git\\team22\\Team22\\src\\main\\webapp\\resources\\images";
		StringBuilder sb = new StringBuilder();
		
		for(MultipartFile file : files) {
			if(!file.isEmpty()) {
			    UUID uuid = UUID.randomUUID();
			    String origin = file.getOriginalFilename();
			    String fileName = uuid + "-" + origin;
			    File saveFile = new File(path, fileName);
			    file.transferTo(saveFile);
			    if(sb.length() > 0) {
			    	sb.append(",");
			    }
			    sb.append(fileName);
			}
		}
	    vo.setProduct_pic(sb.toString());

	    logger.info("vo : " + vo.toString());
		pdao.regProduct(vo);
	}

	@Override
	public void incView(HttpServletRequest request, HttpServletResponse response, Integer product_num) {
		String viewedCookieName = "vc" + product_num;
		Cookie[] cookies = request.getCookies();
		boolean viewCheck = true;
		
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				if (viewedCookieName.equals(cookie.getName())) {
					viewCheck = false;
					break;
				}
			}
		}
		
		if(viewCheck) {
			pdao.incView(product_num);
			
			Cookie viewedCookie = new Cookie(viewedCookieName, "true");
			viewedCookie.setMaxAge(24*60*60);
			viewedCookie.setPath("/");
			response.addCookie(viewedCookie);
		}
	}



}
