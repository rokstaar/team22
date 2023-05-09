package com.market.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	
	
	// 상품 리스트 페이지
	@GetMapping(value = "/prodList")
	public String getProdListPage(@RequestParam(value = "sort", defaultValue="") String sort,
								@RequestParam(value = "grade", required = false) String grade,
								@RequestParam(value = "category", required = false) String category,
								@RequestParam(value = "title", required = false) String title,
								@RequestParam(value = "pageNum", required = false) Integer pageNum,
								@RequestParam(value = "minPrice", required = false) Integer min,
								@RequestParam(value = "maxPrice", required = false) Integer max,
								Model model){
		logger.info("상품 리스트 페이지 Paginationed 호출 {}", min);
		PCriteria cri = new PCriteria();
		
		if(pageNum == null) pageNum = 1;
		cri.setPageNum(pageNum);
		List<ProductVO> list = service.getProdListPage(grade, category, title, sort,min,max, cri);
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
							, HttpServletResponse response) throws JsonProcessingException {
		logger.info("상품 정보 가져오기! {}", service.getProdInfo(pnum));
		
		service.incView(request, response, pnum);
		
		Map<String,Object> map = service.getProdInfo(pnum);
		model.addAttribute("info", map);
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
	@GetMapping(value = "/prodReg")
	public String prodReg(HttpSession session, Model model) {
		model.addAttribute("product_seller",session.getAttribute("id"));
		return "/product/prodReg";
	}
	// 상품 등록 페이지
	
	// 상품 등록 후 해당 페이지
	@PostMapping(value = "/regProduct")
	public String regProduct(@ModelAttribute ProductVO vo
							,@RequestParam("product_pics") MultipartFile[] files
							,MultipartHttpServletRequest request
							,Model model) throws Exception {
		logger.info("Controller - 상품 등록 실행!");
		logger.info(vo.toString());
		
		request.setCharacterEncoding("utf-8");
		fileProcess(request);
		int num = service.regProduct(vo, files);
		model.addAttribute("product_num", num);
		model.addAttribute("seller", vo.getProduct_seller());
		
		return "redirect:/product/prodInfo";
//		return "redirect:/product/prodList";
	}
	// 상품 등록 후 해당 페이지
	

	private List<String> fileProcess(MultipartHttpServletRequest multiRequest) throws Exception {
		List<String> fileList = new ArrayList<String>();
		
		Iterator<String> fileNames =  multiRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			
			MultipartFile mFile = multiRequest.getFile(fileName);
			String oFileName = mFile.getOriginalFilename();
			fileList.add(oFileName);
			
			File file = 
					new File("C:\\Users\\ITWILL\\git\\team22\\Team22\\src\\main\\webapp\\resources\\images\\" 
			+ fileName);
			
			if(mFile.getSize() != 0) {
				if(!file.exists()) { 
					if(file.getParentFile().mkdir()) {
						file.createNewFile();
					}
				}
				
				mFile.transferTo(
						new File(
								"C:\\Users\\ITWILL\\git\\team22\\Team22\\src\\main\\webapp\\resources\\images\\" 
						+ oFileName));
				
			}
		}
		
		return fileList;
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void fileDownloadGET(@RequestParam("fileName") String fileName
								,HttpServletResponse response) throws Exception {
		logger.info("fileDownloadGET() 실행");
		
		// 파일의 정보
		logger.info("fileName : " + fileName);
		// 다운로드할 파일의 위치
		String downFile = "C:\\Users\\ITWILL\\git\\team22\\Team22\\src\\main\\webapp\\resources\\images\\" + fileName;
		
		File file = new File(downFile);
		
		// 파일의 정보를 화면에 출력
		OutputStream out = response.getOutputStream();
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		
		FileInputStream fis = new FileInputStream(file);
		
		byte[] buffer = new byte[1024 * 8];
		
//		while(true) {
//			int data = fis.read(buffer);
//			if(data == -1) break;
//			
//			// 화면에 데이터 출력
//			out.write(buffer, 0, data);
//		}
		int data;
		while((data = fis.read(buffer)) != -1) {
			
			// 화면에 데이터 출력
			out.write(buffer, 0, data);
		}
		
		fis.close();
		out.close();
		
	}
	
	@RequestMapping(value = "/thumb", method = {RequestMethod.GET, RequestMethod.POST})
	public void thumbnail(@RequestParam("fileName") String fileName
						,HttpServletResponse response) throws Exception {
		logger.info("Controller - 썸네일 파일 생성 및 호출");
		String path = "C:\\Users\\ITWILL\\git\\team22\\Team22\\src\\main\\webapp\\resources\\images\\" + fileName;
		
		File file = new File(path);
		String oFileName = fileName.substring(0, fileName.lastIndexOf('.'));
		logger.info(oFileName);
		
		File thumb = new File("C:\\Users\\ITWILL\\git\\team22\\Team22\\src\\main\\webapp\\resources\\images\\thumb\\"
				+ oFileName + ".png");
		OutputStream out = response.getOutputStream();
		response.setContentType("image/png");
		
		if(file.exists()) {
			Thumbnails.of(file).size(200, 200).outputFormat("png").toOutputStream(out);
			out.flush();
		}else {
			return;
		}
		
		byte[] buffer = new byte[1024 * 8];
		
		out.write(buffer);
		out.close();
	}
	
	
	
	// 상품 수정 페이지
	@GetMapping(value = "/prodMod")
	public void modProd(@RequestParam("info") Object map) {
		logger.info("상품 수정 페이지 호출");
		logger.info("{}", map);
	}
	// 상품 수정 페이지
	
	// 상품 삭제
	
	public void delProd() {
		
	}
	// 상품 삭제
}
