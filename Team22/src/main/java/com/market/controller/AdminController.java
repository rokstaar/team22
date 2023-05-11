package com.market.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.util.UploadFileUtils;
import com.market.domain.CPageDTO;
import com.market.domain.MemberVO;
import com.market.domain.NoticeVO;
import com.market.service.AdminService;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
	
	@Inject
	@Named("uploadPath")
	private String uploadPath;
	
	
	@Inject
	private AdminService service;

	private static final Logger logger 
	             = LoggerFactory.getLogger(AdminController.class);
	
	// http://localhost:8080/admin/adminpage?num=1
	// 모든 회원정보 조회
	@RequestMapping(value = "/adminpage",method = RequestMethod.GET)
	public void adminPageGET(HttpServletRequest request, Model model,@RequestParam("num") int num,
			     @RequestParam(value = "searchType",required = false, defaultValue = "id") String searchType,
			     @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception{
		
		CPageDTO mdto = new CPageDTO();
		mdto.setNum(num);
		mdto.setCount(service.searMemlist(searchType, keyword));
		
		// 검색
		mdto.setKeyword(keyword);
		mdto.setSearchType(searchType);
		
		
		// 서비스 - 회원정보 가져오기
		List memberList = new ArrayList();
		if(((String)request.getSession().getAttribute("id")).equals("admin")) memberList = service.getMemebrList(mdto.getDisplayPost(), mdto.getPostNum(), searchType, keyword);
		
		model.addAttribute("memberList",memberList);
		model.addAttribute("mdto",mdto);
		model.addAttribute("select",num);
		
		
		int mcount = service.countMember();
		int procount = service.countProduct();
		int noticount = service.countNotice();
		int tradecount = service.countTrade();
		int cscount = service.countCs();
				
		model.addAttribute("mcount", mcount);
		model.addAttribute("procount", procount);
		model.addAttribute("noticount", noticount);
		model.addAttribute("tradecount", tradecount);
		model.addAttribute("cscount", cscount);
		
	}
	
	// 회원정보 상세보기
	@RequestMapping(value = "/mdetail",method = RequestMethod.GET)
	public String memberdetailGET(Model model,@RequestParam("member_num") int member_num) throws Exception {
		MemberVO memvo = service.getmem(member_num);
		  
		int mcount = service.countMember();
		int procount = service.countProduct();
		int noticount = service.countNotice();
		int tradecount = service.countTrade();
		int cscount = service.countCs();
		
		model.addAttribute("memvo",memvo);
		
		model.addAttribute("mcount", mcount);
		model.addAttribute("procount", procount);
		model.addAttribute("noticount", noticount);
		model.addAttribute("tradecount", tradecount);
		model.addAttribute("cscount", cscount);
		
		
		return "/admin/mdetail";
		
	}
	
	
	//모든 상품정보 조회
	@RequestMapping(value = "/manageprod",method = RequestMethod.GET)
	public void manageprodGET(HttpServletRequest request, Model model) throws Exception {
		logger.info(" manageprodGET() 호출 (●'◡'●)(●'◡'●) ");
		
		List productList = new ArrayList();
		List aucionList = new ArrayList();
		List randomList = new ArrayList();
	
		if(((String)request.getSession().getAttribute("id")).equals("admin")) productList = service.productList();
		if(((String)request.getSession().getAttribute("id")).equals("admin")) aucionList = service.auctionList();
		if(((String)request.getSession().getAttribute("id")).equals("admin")) randomList = service.randomList();
		
		int mcount = service.countMember();
		int procount = service.countProduct();
		int noticount = service.countNotice();
		int tradecount = service.countTrade();
		int cscount = service.countCs();
		
		//logger.info(productList.toString());
		//view 페이지 전달
		model.addAttribute("productList",productList);
		model.addAttribute("aucionList",aucionList);
		model.addAttribute("randomList",randomList);
		
		model.addAttribute("mcount", mcount);
		model.addAttribute("procount", procount);
		model.addAttribute("noticount", noticount);
		model.addAttribute("tradecount", tradecount);
		model.addAttribute("cscount", cscount);
	}
	
	// 모든 구매내역 	
	@RequestMapping(value = "/managetrade",method = RequestMethod.GET)
	public void managetradeGET(Model model) throws Exception{
		List<Map<String, Object>> buyprodList = service.getbuyprodList();
		List<Map<String, Object>> sellprodList = service.getsellprodList();
				
		logger.info(buyprodList.toString());
		logger.info(sellprodList.toString());
				
	 int mcount = service.countMember();
	 int procount = service.countProduct();
	 int noticount = service.countNotice();
	 int tradecount = service.countTrade();
	 int cscount = service.countCs();
							
	model.addAttribute("buyprodList",buyprodList);
	model.addAttribute("sellprodList",sellprodList);
	
	model.addAttribute("mcount", mcount);
	model.addAttribute("procount", procount);
	model.addAttribute("noticount", noticount);
	model.addAttribute("tradecount", tradecount);
	model.addAttribute("cscount", cscount);
 }
	
	// 모든 문의사항(고객센터) 조회
		@RequestMapping(value = "/managecs",method = RequestMethod.GET)
		public void managecsGET(Model model,HttpServletRequest request,@RequestParam("num") int num,
				@RequestParam(value = "searchType",required = false, defaultValue = "writer") String searchType,
				@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword)throws Exception{
			
			CPageDTO cdto = new CPageDTO();
			cdto.setNum(num);
			cdto.setCount(service.searCslist(searchType, keyword));
			
			// 검색
			cdto.setSearchType(searchType);
			cdto.setKeyword(keyword);
			
			List csList = new ArrayList();
			if(((String)request.getSession().getAttribute("id")).equals("admin")) csList = service.getCsList(cdto.getDisplayPost(), cdto.getPostNum(), searchType, keyword);
			 
			 int mcount = service.countMember();
			 int procount = service.countProduct();
			 int noticount = service.countNotice();
			 int tradecount = service.countTrade();
			 int cscount = service.countCs();
			 
			model.addAttribute("csList",csList);
			model.addAttribute("cdto",cdto);
			model.addAttribute("select",num);
			
			model.addAttribute("mcount", mcount);
			model.addAttribute("procount", procount);
			model.addAttribute("noticount", noticount);
			model.addAttribute("tradecount", tradecount);
			model.addAttribute("cscount", cscount);
		}
	
		// 모든 공지사항 조회
		@RequestMapping(value = "/managenoti",method = RequestMethod.GET)
		public void managenotiGET(HttpServletRequest request, Model model,@RequestParam("num") int num,
				    @RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
				    @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword)throws Exception{
			
			CPageDTO nodto = new CPageDTO();
			nodto.setNum(num);
			nodto.setCount(service.searNotilist(searchType, keyword));
			
			// 검색
			nodto.setSearchType(searchType);
			nodto.setKeyword(keyword);
				
			List notiList = new ArrayList();
		    if(((String)request.getSession().getAttribute("id")).equals("admin")) notiList = service.getNotiList(nodto.getDisplayPost(), nodto.getPostNum(), searchType, keyword);
					
			model.addAttribute("notiList",notiList);
			model.addAttribute("nodto",nodto);
			model.addAttribute("select",num);
			
			int mcount = service.countMember();
			int procount = service.countProduct();
			int noticount = service.countNotice();
			int tradecount = service.countTrade();
			int cscount = service.countCs();
			
			model.addAttribute("mcount", mcount);
			model.addAttribute("procount", procount);
			model.addAttribute("noticount", noticount);
			model.addAttribute("tradecount", tradecount);
			model.addAttribute("cscount", cscount);
		}
	
	
	
	
	
	
	// http://localhost:8080/admin/noticewrite
	// 공지사항 쓰기
	@RequestMapping(value = "/noticewrite", method = RequestMethod.GET)
	public void noticewriteGET() throws Exception {
		logger.info(" noticewriteGET() 호출 (●'◡'●)(●'◡'●) ");
	}
	
	// 공지사항 쓰기 - 정보저장
	@RequestMapping(value = "/noticewrite", method = RequestMethod.POST)
	public String noticewritePOST(NoticeVO vo,MultipartFile file,MultipartFile file2,MultipartFile file3,RedirectAttributes rttr) throws Exception{
		logger.info(" noticewritePOST() 호출 (●'◡'●)(●'◡'●)");
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		String fileName2 = null;
		String fileName3 = null;
			
		if(file != null) {
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
			logger.info("@@@@@@@@@@@@@@@@@@@@"+file);
		}else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}if(file2 != null) {
			fileName2 =  UploadFileUtils.fileUpload(imgUploadPath, file2.getOriginalFilename(), file2.getBytes(), ymdPath); 
		}else {
			fileName2 = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		if(file3 != null) {
			fileName3 =  UploadFileUtils.fileUpload(imgUploadPath, file3.getOriginalFilename(), file3.getBytes(), ymdPath); 
		} 
		else {
		 fileName3 = uploadPath + File.separator + "images" + File.separator + "none.png";
		}
		logger.info("@@@@@@@@@@@@@@@@@@@file"+file);
		logger.info("@@@@@@@@@@@@file"+fileName);
		vo.setNoti_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setNoti_image1(File.separator + "imgUpload" + ymdPath + File.separator + fileName2);
		vo.setNoti_image2(File.separator + "imgUpload" + ymdPath + File.separator +fileName3);
		
		// 서비스 정보 가져오기
		service.writeNotice(vo);
		logger.info(vo.toString());
		
		// 정보 저장
		rttr.addFlashAttribute("result","ok");
		return "redirect:/admin/notice?num=1";
	}

	// http://localhost:8080/admin/notice?num=1
	// 공지사항 목록 + 페이징 + 검색
	@RequestMapping(value = "/notice",method = RequestMethod.GET)
	public void noticeGET(Model model, @RequestParam("num") int num, 
			 @RequestParam(value = "searchType",required = false, defaultValue = "all") String searchType,
			 @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception{
		logger.info(" noticeGET() 호출 (●'◡'●)(●'◡'●) ");
		
		CPageDTO ndto = new CPageDTO();
		ndto.setNum(num);
		ndto.setCount(service.searcountNotice(searchType, keyword));
		
		// 검색
		ndto.setKeyword(keyword);
		ndto.setSearchType(searchType);
		
		// 서비스 - 상품정보 가져오기
		List<NoticeVO> noticeList = service.noticeList(ndto.getDisplayPost(), ndto.getPostNum(), searchType, keyword);
		
		//view 페이지 전달
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("ndto",ndto);
		model.addAttribute("select",num);
		
		
	}
	
	// http://localhost:8080/admin/notiread
	// 공지사항 특정 글 읽기
	@RequestMapping(value = "/notiread",method = RequestMethod.GET)
	public void notireadGET(@RequestParam("noti_num") int noti_num,Model model) throws Exception {
		
		// 서비스 - 조회수 1증가
		service.updateReadCnt(noti_num);
		
		// 글번호에 해당하는 정보 가져오기
		NoticeVO resultVO = service.getBoard(noti_num);
		logger.info(resultVO.toString());
		
		// 글정보 저장 -> view페이지 
		model.addAttribute("resultVO",resultVO);
	}
	
	// 공지사항 글 수정하기(기존 글 보여주기)
	@RequestMapping(value = "/notimodify", method = RequestMethod.GET)
	public void notimodifyGET(@RequestParam("noti_num") int noti_num,Model model) throws Exception {
		logger.info(" notimodifyGET()  ");
		
		// 글번호에 해당하는 정보 가져오기
		NoticeVO vo = service.getBoard(noti_num);
		logger.info(vo.toString());
		
		// view페이지 출력
		model.addAttribute("vo",vo);		
	}
	
//	// 공지사항 글 수정하기(글 수정 업데이트 보여주기)
//	@RequestMapping(value = "/notimodify",method = RequestMethod.POST) 
//	public String notimodifyPOST(NoticeVO vo,RedirectAttributes rttr,MultipartFile file,
//			                     MultipartFile file2,MultipartFile file3,HttpServletRequest req) throws Exception {
//
//		logger.info(vo.toString());
//		
//		File convFile = new File(file.getOriginalFilename());
//		File convFile2 = new File(file2.getOriginalFilename());
//		File convFile3 = new File(file3.getOriginalFilename());
//        file.transferTo(convFile);
//        file2.transferTo(convFile2);
//        file3.transferTo(convFile3);
//        
//        if(file.getOriginalFilename() != null && file.getOriginalFilename() !="" 
//    	|| file2.getOriginalFilename() != null && file2.getOriginalFilename() !=""
//    	|| file3.getOriginalFilename() != null && file3.getOriginalFilename() !=""
//        		
//        		) {
//        	  new File(uploadPath + req.getParameter("noti_image")).delete();
//        	  new File(uploadPath + req.getParameter("noti_image1")).delete();
//        	  new File(uploadPath + req.getParameter("noti_image2")).delete();
//        	  
//        	String imgUploadPath = uploadPath + File.separator + "imgUpload";
//      		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
//      		String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
//      		String fileName2 = UploadFileUtils.fileUpload(imgUploadPath, file2.getOriginalFilename(), file.getBytes(), ymdPath);
//      		String fileName3 = UploadFileUtils.fileUpload(imgUploadPath, file3.getOriginalFilename(), file.getBytes(), ymdPath);
//      		
//      		vo.setNoti_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
//      		vo.setNoti_image1(File.separator + "imgUpload" + ymdPath + File.separator + fileName2);
//      		vo.setNoti_image2(File.separator + "imgUpload" + ymdPath + File.separator + fileName3);
//        }else {
//        	vo.setNoti_image(req.getParameter("noti_image"));
//        	vo.setNoti_image1(req.getParameter("noti_image1"));
//        	vo.setNoti_image2(req.getParameter("noti_image2"));
//        }
//				
//		//서비스 - 글정보 수정
//		int result = service.modifyBoard(vo);
//				
//		if(result == 1) {   // 수정된 정보가 1개일때
//			rttr.addFlashAttribute("result","modOK");
//	 }
//		
//		return "redirect:/admin/notice?num=1";
//	}
	
//	@RequestMapping(value = "/notimodify", method = RequestMethod.POST)
//	public String notimodifyPOST(NoticeVO vo, RedirectAttributes rttr,
//	                             @RequestParam(value = "file", required = false) MultipartFile file,
//	                             @RequestParam(value = "file2", required = false) MultipartFile file2,
//	                             @RequestParam(value = "file3", required = false) MultipartFile file3,
//	                             HttpServletRequest req) throws Exception {
//	    logger.info(vo.toString());
//
//	    // 첫 번째 이미지 업데이트
//	    if (file != null && !file.isEmpty()) {
//	        String imgUploadPath = uploadPath + File.separator + "imgUpload";
//	        String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
//	        String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
//
//	        // 기존 첫 번째 이미지 파일 삭제
//	        String existingImagePath = req.getParameter("noti_image");
//	        if (existingImagePath != null && !existingImagePath.isEmpty()) {
//	            String existingFilePath = uploadPath + File.separator + existingImagePath;
//	            new File(existingFilePath).delete();
//	        }
//	        vo.setNoti_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
//	    }else {
//	    	vo.setNoti_image(req.getParameter("noti_image"));
//	    }
//
//	    // 두 번째 이미지 업데이트
//	    if (file2 != null && !file2.isEmpty()) {
//	        String imgUploadPath = uploadPath + File.separator + "imgUpload";
//	        String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
//	        String fileName = UploadFileUtils.fileUpload(imgUploadPath, file2.getOriginalFilename(), file2.getBytes(), ymdPath);
//
//	        // 기존 두 번째 이미지 파일 삭제
//	        String existingImagePath = req.getParameter("noti_image1");
//	        if (existingImagePath != null && !existingImagePath.isEmpty()) {
//	            String existingFilePath = uploadPath + File.separator + existingImagePath;
//	            new File(existingFilePath).delete();
//	        }
//
//	        vo.setNoti_image1(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
//	    } else {
//	        // 기존 두 번째 이미지 유지
//	        vo.setNoti_image1(req.getParameter("noti_image1"));
//	    }
//
//	    // 세 번째 이미지 업데이트
//	    if (file3 != null && !file3.isEmpty()) {
//	        String imgUploadPath = uploadPath + File.separator + "imgUpload";
//	        String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
//	        String fileName = UploadFileUtils.fileUpload(imgUploadPath, file3.getOriginalFilename(), file3.getBytes(), ymdPath);
//
//	        // 기존 세 번째 이미지 파일 삭제
//	        String existingImagePath = req.getParameter("noti_image2");
//	        if (existingImagePath != null && !existingImagePath.isEmpty()) {
//	            String existingFilePath = uploadPath + File.separator + existingImagePath;
//	            new File(existingFilePath).delete();
//	        }
//
//	        vo.setNoti_image2(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
//	    } else {
//	        // 기존 세 번째 이미지 유지
//	        vo.setNoti_image2(req.getParameter("noti_image2"));
//	    }
//
//	    // 서비스 - 글 정보 수정
//	    int result = service.modifyBoard(vo);
//
//	    if (result == 1) { // 수정된 정보가 1개일 때
//	        rttr.addFlashAttribute("result", "modOK");
//	    }
//
//	    return "redirect:/admin/notice?num=1";
//	}

	@RequestMapping(value = "/notimodify", method = RequestMethod.POST)
	public String notimodifyPOST(NoticeVO vo, RedirectAttributes rttr,
	                             @RequestParam(value = "file", required = false) MultipartFile file,
	                             @RequestParam(value = "file2", required = false) MultipartFile file2,
	                             @RequestParam(value = "file3", required = false) MultipartFile file3,
	                             HttpServletRequest req) throws Exception {
	    logger.info(vo.toString());

	    // 첫 번째 이미지 업데이트
	    if (file != null && !file.isEmpty()) {
	        String imgUploadPath = uploadPath + File.separator + "imgUpload";
	        String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
	        String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

	        vo.setNoti_image(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	    } else {
	        // 기존의 값을 유지
	        vo.setNoti_image(req.getParameter("noti_image"));
	    }

	    // 두 번째 이미지 업데이트
	    if (file2 != null && !file2.isEmpty()) {
	        String imgUploadPath = uploadPath + File.separator + "imgUpload";
	        String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
	        String fileName = UploadFileUtils.fileUpload(imgUploadPath, file2.getOriginalFilename(), file2.getBytes(), ymdPath);

	        vo.setNoti_image1(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	    } else {
	        // 기존의 값을 유지
	        vo.setNoti_image1(req.getParameter("noti_image1"));
	    }

	    // 세 번째 이미지 업데이트
	    if (file3 != null && !file3.isEmpty()) {
	        String imgUploadPath = uploadPath + File.separator + "imgUpload";
	        String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
	        String fileName = UploadFileUtils.fileUpload(imgUploadPath, file3.getOriginalFilename(), file3.getBytes(), ymdPath);

	        vo.setNoti_image2(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	    } else {
	        // 기존의 값을 유지
	        vo.setNoti_image2(req.getParameter("noti_image2"));
	    }

	    // 서비스 - 글 정보 수정
	    int result = service.modifyBoard(vo);

	    if (result == 1) { // 수정된 정보가 1개일 때
	        rttr.addFlashAttribute("result", "modOK");
	    }

	    return "redirect:/admin/notice?num=1";
	}
	
	
	
	// 공지사항 글 삭제하기
		@RequestMapping(value = "/deletenoti",method = RequestMethod.GET)
		public String deletenotiGET(@RequestParam("noti_num") int noti_num,RedirectAttributes rttr)throws Exception{
			//전달정보
			logger.info("noti_num :"+noti_num);
			
			// 서비스 - 글정보 삭제 처리
			int result = service.deleteNotice(noti_num);
			
			if(result == 1) {   
				rttr.addFlashAttribute("result","deleOK");
		 }
				
			return "redirect:/admin/notice?num=1";
		}
		
	
		
		
	}