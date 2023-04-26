package com.market.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.domain.ProductVO;
import com.market.service.ProductService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	@Autowired
	ProductService service;
	
	// 상품 리스트
	@GetMapping(value = "/prodList")
	public String getProdList(@RequestParam(value = "sort", defaultValue="") String sort,
							@RequestParam(value = "grade", required = false) String grade,
							@RequestParam(value = "category", required = false) String category,
							@RequestParam(value = "title", required = false) String title,
							Model model){
		logger.info("상품 페이지 호출 {}", sort);
		List<ProductVO> list = service.getProdList(grade, category, title, sort);
		model.addAttribute("prodList", list);
		
		return "/product/prodList";
	}
	// 상품 리스트
	
	// 상품 찜하기
	@GetMapping(value = "/likeProd")
	public void likeProd(@RequestParam(value = "product_num") int pnum) {
		service.likeProd(pnum);
	}
	// 상품 찜하기
	
	// 상품 찜취소하기
	@GetMapping(value = "/likeProdCancel")
	public void likeProdCancel(@RequestParam(value = "product_num") int pnum) {
		service.likeProdCancel(pnum);
	}
	// 상품 찜취소하기
	
	// 상품 정보 가져오기
	@RequestMapping(value = "/prodInfo",method = {RequestMethod.GET, RequestMethod.POST})
	public void getProdInfo(@ModelAttribute(value = "product_num") int pnum
							,@ModelAttribute(value = "seller") String name
							, Model model) {
		logger.info("상품 정보 가져오기! {}", service.getProdInfo(pnum));
		model.addAttribute("info", service.getProdInfo(pnum));
		model.addAttribute("score", service.getScore(name));
	}
	// 상품 정보 가져오기
	
	// 같은 종류의 추천 상품 가져오기
	@PostMapping(value = "/recProd")
	@ResponseBody
	public List<ProductVO> recProd(@RequestParam(value = "category") String category
			, Model model) {
		logger.info("추천 상품 가져오기 : {}", service.getRecProdList(category));
		return service.getRecProdList(category);
	}
	// 같은 종류의 추천 상품 가져오기
	
	// 상품 등록 페이지
	@PostMapping(value = "/prodReg")
	public void prodReg(@RequestParam(value = "id") String id,
			@RequestParam(value = "product_num") int pnum, Model model) {
		model.addAttribute("id",id);
		model.addAttribute("product_num",pnum);
	}
	// 상품 등록 페이지
	
	// 상품 등록 후 해당 페이지
	@PostMapping(value = "/regProduct")
	public String regProduct(ProductVO productVO 
							,@RequestParam("product_pics") MultipartFile[] file
							,HttpServletRequest request
							,RedirectAttributes rttr) throws Exception {
		logger.info("Controller - 상품 등록 실행!");
		logger.info(productVO.toString());
		service.regProduct(productVO, file, request);
		
		rttr.addFlashAttribute("product_num", productVO.getProduct_num());
		rttr.addFlashAttribute("seller", productVO.getProduct_seller());
		return "redirect:/product/prodInfo";
	}
	// 상품 등록 후 해당 페이지
}
