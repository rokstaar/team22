package com.market.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.domain.CPageDTO;
import com.market.domain.NoticeVO;
import com.market.domain.TradeVO;
import com.market.service.AdminService;
import com.market.service.AdminServiceImpl;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
	
	@Inject
	private AdminService service;

	private static final Logger logger 
	             = LoggerFactory.getLogger(AdminController.class);
	
	// http://localhost:8080/admin/adminPage
	// 모든 회원정보 조회
	@RequestMapping(value = "/adminPage",method = RequestMethod.GET)
	public String adminPageGET(HttpServletRequest request, Model model) throws Exception{
		
		// 서비스 - 회원정보 가져오기
		List memberList = new ArrayList();
		if(((String)request.getSession().getAttribute("id")).equals("admin")) memberList = service.memberList();
		int mcount = service.countMember();
		int procount = service.countProduct();
		int noticount = service.countNotice();
		int tradecount = service.countTrade();
				
		//logger.info(memberList.toString());
		model.addAttribute("memberList",memberList);
		model.addAttribute("mcount", mcount);
		model.addAttribute("procount", procount);
		model.addAttribute("noticount", noticount);
		model.addAttribute("tradecount", tradecount);
		
		
		return "/admin/adminPage";
	}
	
	//모든 상품정보 조회
	@RequestMapping(value = "/manageprod",method = RequestMethod.GET)
	public void manageprodGET(HttpServletRequest request, Model model) throws Exception {
		logger.info(" manageprodGET() 호출 (●'◡'●)(●'◡'●) ");
		
		List productList = new ArrayList();
		if(((String)request.getSession().getAttribute("id")).equals("admin")) productList = service.productList();
		int mcount = service.countMember();
		int procount = service.countProduct();
		int noticount = service.countNotice();
		int tradecount = service.countTrade();
		
		//logger.info(productList.toString());
		//view 페이지 전달
		model.addAttribute("productList",productList);
		model.addAttribute("mcount", mcount);
		model.addAttribute("procount", procount);
		model.addAttribute("noticount", noticount);
		model.addAttribute("tradecount", tradecount);
	}
	
	// 모든 공지사항 조회
	@RequestMapping(value = "/managenoti",method = RequestMethod.GET)
	public void managenotiGET(HttpServletRequest request, Model model)throws Exception{
		logger.info(" managenotiGET() 호출 (●'◡'●)(●'◡'●) ");
		
		List notiList = new ArrayList();
	    if(((String)request.getSession().getAttribute("id")).equals("admin")) notiList = service.getNotiList();
		int mcount = service.countMember();
		int procount = service.countProduct();
		int noticount = service.countNotice();
		int tradecount = service.countTrade();
				
		model.addAttribute("notiList",notiList);
		model.addAttribute("mcount", mcount);
		model.addAttribute("procount", procount);
		model.addAttribute("noticount", noticount);
		model.addAttribute("tradecount", tradecount);
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
							
	model.addAttribute("buyprodList",buyprodList);
	model.addAttribute("sellprodList",sellprodList);
	model.addAttribute("mcount", mcount);
	model.addAttribute("procount", procount);
	model.addAttribute("noticount", noticount);
	model.addAttribute("tradecount", tradecount);
 }
	
	// 모든 문의사항(고객센터) 조회
	@RequestMapping(value = "/managecs",method = RequestMethod.GET)
	public void managecsGET(Model model,HttpServletRequest request)throws Exception{
		
		List csList = new ArrayList();
		 if(((String)request.getSession().getAttribute("id")).equals("admin")) csList = service.getCsList();
		 
		 int mcount = service.countMember();
		 int procount = service.countProduct();
		 int noticount = service.countNotice();
		 int tradecount = service.countTrade();
		 
		model.addAttribute("csList",csList);
		model.addAttribute("mcount", mcount);
		model.addAttribute("procount", procount);
		model.addAttribute("noticount", noticount);
		model.addAttribute("tradecount", tradecount);
		 
		 
		
	}
	
	
	
	
	
	
	
	
	// http://localhost:8080/admin/noticewrite
	// 공지사항 쓰기
	@RequestMapping(value = "/noticewrite", method = RequestMethod.GET)
	public void noticewriteGET() throws Exception {
		logger.info(" noticewriteGET() 호출 (●'◡'●)(●'◡'●) ");
	}
	
	// 공지사항 쓰기 - 정보저장
	@RequestMapping(value = "/noticewrite", method = RequestMethod.POST)
	public String noticewritePOST(NoticeVO vo,RedirectAttributes rttr) throws Exception{
		logger.info(" noticewritePOST() 호출 (●'◡'●)(●'◡'●)");
		
		// 서비스 정보 가져오기
		service.writeNotice(vo);
		logger.info(vo.toString());
		
		// 정보 저장
		rttr.addFlashAttribute("result","ok");
		
		return "redirect:/admin/notice?num=1";
	}

	// http://localhost:8080/admin/notice
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
	
	// 공지사항 글 수정하기(글 수정 업데이트 보여주기)
	@RequestMapping(value = "/notimodify",method = RequestMethod.POST) 
	public String notimodifyPOST(NoticeVO vo,RedirectAttributes rttr) throws Exception {
		logger.info(" notimodifyPOST()  ");
		logger.info(vo.toString());
		
		//서비스 - 글정보 수정
		int result = service.modifyBoard(vo);
				
		if(result == 1) {   // 수정된 정보가 1개일때
			rttr.addFlashAttribute("result","modOK");
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