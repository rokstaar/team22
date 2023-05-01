package com.market.controller;

import java.io.File;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.servlet.ModelAndView;

import com.market.domain.PCriteria;
import com.market.domain.ProductVO;
import com.market.service.ProductService;

import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	@Autowired
	ProductService service;
	
	// 상품 리스트
//	@GetMapping(value = "/prodList")
//	public String getProdList(@RequestParam(value = "sort", defaultValue="") String sort,
//							@RequestParam(value = "grade", required = false) String grade,
//							@RequestParam(value = "category", required = false) String category,
//							@RequestParam(value = "title", required = false) String title,
//							Model model){
//		logger.info("상품 리스트 페이지 호출 {}", sort);
//		List<ProductVO> list = service.getProdList(grade, category, title, sort);
//		model.addAttribute("prodList", list);
//		logger.info(list.toString());
//		return "/product/prodList";
//	}
	// 상품 리스트
	
	// 상품 리스트 페이지
	@GetMapping(value = "/prodList")
	public String getProdListPage(@RequestParam(value = "sort", defaultValue="") String sort,
			@RequestParam(value = "grade", required = false) String grade,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "pageNum", required = false) Integer pageNum,
			Model model){
		logger.info("상품 리스트 페이지 Paginationed 호출 {}", sort);
		PCriteria cri = new PCriteria();
		
		if(pageNum == null) pageNum = 1;
		cri.setPageNum(pageNum);
		List<ProductVO> list = service.getProdListPage(grade, category, title, sort, cri);
		logger.info(list.toString());
		model.addAttribute("prodList", list);
		model.addAttribute("totalPage", (int)Math.ceil(service.getTotalCount()/(double)cri.getPageBlock()));
		
		return "/product/prodList";
	}
	// 상품 리스트
	
	// 상품 찜하기
	@ResponseBody
	@GetMapping(value = "/likeProd")
	public void likeProd(@RequestParam(value = "product_num") int pnum
						,@RequestParam(value = "seller") String id) {
		logger.info("{}번 상품 찜하기", pnum);
		service.likeProd(pnum);
		service.regFavorite(pnum, id);
	}
	// 상품 찜하기
	
	// 상품 찜취소하기
	@ResponseBody
	@GetMapping(value = "/likeProdCancel")
	public void likeProdCancel(@RequestParam(value = "product_num") int pnum
							,@RequestParam(value = "seller") String id) {
		logger.info("{}번 상품 찜취소", pnum);
		service.likeProdCancel(pnum);
		service.delFavorite(pnum, id);
	}
	// 상품 찜취소하기
	
	// 회원이 상품 찜했는지 확인
	@GetMapping(value = "/memlikeCheck")
	@ResponseBody
	public boolean memlikeCheck(@RequestParam(value = "product_num") int pnum
							,@RequestParam(value = "seller") String id) {
		if(service.likeExist(pnum, id) == 0) {
			return false;
		}
		
		return true;
	}
	
	// 상품 정보 가져오기
	@RequestMapping(value = "/prodInfo",method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getProdInfo(@ModelAttribute(value = "product_num") int pnum
							,@ModelAttribute(value = "seller") String name
							, Model model
							, HttpServletRequest request
							, HttpServletResponse response) {
		logger.info("상품 정보 가져오기! {}", service.getProdInfo(pnum));
		
		service.incView(request, response, pnum);
		
		model.addAttribute("info", service.getProdInfo(pnum));
		model.addAttribute("score", service.getScore(name));
		
		return new ModelAndView("product/prodInfo");
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
	public void prodReg(@RequestParam(value = "id") String id, Model model) {
		model.addAttribute("id",id);
	}
	// 상품 등록 페이지
	
	// 상품 등록 후 해당 페이지
	@PostMapping(value = "/regProduct")
	public String regProduct(@ModelAttribute ProductVO productVO 
							,@RequestParam("product_pics") MultipartFile[] file
							,HttpServletRequest request) throws Exception {
		logger.info("Controller - 상품 등록 실행!");
		logger.info(productVO.toString());
		service.regProduct(productVO, file, request);
		
		return "redirect:/product/prodInfo";
	}
//	@PostMapping(value = "/regProduct")
//	public String regProduct(@ModelAttribute ProductVO productVO 
//							,MultipartHttpServletRequest request) throws Exception {
//		logger.info("Controller - 상품 등록 실행!");
//		logger.info(productVO.toString());
//		service.regProduct(productVO, request);
//		
//		return "redirect:/product/prodInfo";
//	}
	// 상품 등록 후 해당 페이지
	
	@RequestMapping(value = "/thumb", method = {RequestMethod.GET, RequestMethod.POST})
	public void thumbnail(@RequestParam("fileName") String img
						,HttpServletResponse response) throws Exception {
		String path = "C:\\Users\\ITWILL\\git\\team22\\Team22\\src\\main\\webapp\\resources\\images\\" + img;
		
		File file = new File(path);
		String oFileName = img.substring(0, img.lastIndexOf('.'));
		
		File thumb = new File("C:\\Users\\ITWILL\\git\\team22\\Team22\\src\\main\\webapp\\resources\\images\\thumb"
				+ oFileName + ".png");
		OutputStream out = response.getOutputStream();
		
		if(file.exists()) {
			Thumbnails.of(file).size(200, 200).outputFormat("png").toOutputStream(out);
		}else {
			return;
		}
		
		byte[] buffer = new byte[1024 * 8];
		
		out.write(buffer);
		out.close();
	}
}
