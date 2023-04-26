package com.market.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.domain.NoticeVO;
import com.market.service.AdminServiceImpl;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
	
	@Inject
	private AdminServiceImpl service;

	private static final Logger logger 
	             = LoggerFactory.getLogger(AdminController.class);
	
	// http://localhost:8080/admin/adminPage
	// 紐⑤뱺 �쉶�썝�젙蹂� 議고쉶
	@RequestMapping(value = "/adminPage",method = RequestMethod.GET)
	public String adminPageGET(HttpServletRequest request, Model model) throws Exception{
		logger.info(" adminPageGET() �샇異� (�뿈'�뿠'�뿈)(�뿈'�뿠'�뿈)");
		
		// �꽌鍮꾩뒪 - �쉶�썝�젙蹂� 媛��졇�삤湲�
		List memberList = new ArrayList<>();
		if(((String)request.getSession().getAttribute("id")).equals("admin")) memberList = service.memberList();
				
		logger.info(memberList.toString());
		// view �럹�씠吏� �쟾�떖
		model.addAttribute("memberList",memberList);
		
		return "/admin/adminPage";
	}
	
	//紐⑤뱺 �긽�뭹�젙蹂� 議고쉶
	@RequestMapping(value = "/manageprod",method = RequestMethod.GET)
	public void manageprodGET(HttpServletRequest request, Model model) throws Exception {
		logger.info(" manageprodGET() �샇異� (�뿈'�뿠'�뿈)(�뿈'�뿠'�뿈) ");
		
		// �꽌鍮꾩뒪 - �긽�뭹�젙蹂� 媛��졇�삤湲�
		List productList = new ArrayList<>();
		if(((String)request.getSession().getAttribute("id")).equals("admin")) productList = service.productList();
		
		logger.info(productList.toString());
		//view �럹�씠吏� �쟾�떖
		model.addAttribute("productList",productList);
	}
	
	// http://localhost:8080/admin/noticewrite
	// 怨듭��궗�빆 �벐湲�
	@RequestMapping(value = "/noticewrite", method = RequestMethod.GET)
	public void noticewriteGET() throws Exception {
		logger.info(" noticewriteGET() �샇異� (�뿈'�뿠'�뿈)(�뿈'�뿠'�뿈) ");
	}
	
	// 怨듭��궗�빆 �벐湲� - �젙蹂댁��옣
	@RequestMapping(value = "/noticewrite", method = RequestMethod.POST)
	public String noticewritePOST(NoticeVO vo,RedirectAttributes rttr) throws Exception{
		logger.info(" noticewritePOST() �샇異� (�뿈'�뿠'�뿈)(�뿈'�뿠'�뿈)");
		
		// �꽌鍮꾩뒪 �젙蹂� 媛��졇�삤湲�
		service.writeNotice(vo);
		logger.info(vo.toString());
		
		// �젙蹂� ���옣
		rttr.addFlashAttribute("result","ok");
		
		return "redirect:/admin/notice";
	}

	// http://localhost:8080/admin/notice
	// 怨듭��궗�빆 紐⑸줉
	@RequestMapping(value = "/notice",method = RequestMethod.GET)
	public void noticeGET(HttpServletRequest request, Model model) throws Exception{
		logger.info(" noticeGET() �샇異� (�뿈'�뿠'�뿈)(�뿈'�뿠'�뿈) ");
		
		// �꽌鍮꾩뒪 - �긽�뭹�젙蹂� 媛��졇�삤湲�
		List<NoticeVO> noticeList = service.noticeList();
		logger.info("怨듭��궗�빆 媛쒖닔 :"+noticeList.size());
		
		//view �럹�씠吏� �쟾�떖
		model.addAttribute("noticeList",noticeList);
	}
	
	// http://localhost:8080/admin/notiread
	// 怨듭��궗�빆 �듅�젙 湲� �씫湲�
	@RequestMapping(value = "/notiread",method = RequestMethod.GET)
	public void notireadGET(@RequestParam("noti_num") int noti_num,Model model) throws Exception {
		logger.info(" notireadGET() �샇異� (�뿈'�뿠'�뿈)(�뿈'�뿠'�뿈) ");
		
		// �꽌鍮꾩뒪 - 議고쉶�닔 1利앷�
		service.updateReadCnt(noti_num);
		
		// 湲�踰덊샇�뿉 �빐�떦�븯�뒗 �젙蹂� 媛��졇�삤湲�
		NoticeVO resultVO = service.getBoard(noti_num);
		logger.info(resultVO.toString());
		
		// 湲��젙蹂� ���옣 -> view�럹�씠吏� 
		model.addAttribute("resultVO",resultVO);
	}
	
	// 怨듭��궗�빆 湲� �닔�젙�븯湲�(湲곗〈 湲� 蹂댁뿬二쇨린)
	@RequestMapping(value = "/notimodify", method = RequestMethod.GET)
	public void notimodifyGET(@RequestParam("noti_num") int noti_num,Model model) throws Exception {
		logger.info(" notimodifyGET() �샇異� (�뿈'�뿠'�뿈)(�뿈'�뿠'�뿈) ");
		
		// 湲�踰덊샇�뿉 �빐�떦�븯�뒗 �젙蹂� 媛��졇�삤湲�
		NoticeVO vo = service.getBoard(noti_num);
		logger.info(vo.toString());
		
		// view�럹�씠吏� 異쒕젰
		model.addAttribute("vo",vo);		
	}
	
	// 怨듭��궗�빆 湲� �닔�젙�븯湲�(湲� �닔�젙 �뾽�뜲�씠�듃 蹂댁뿬二쇨린)
	@RequestMapping(value = "/notimodify",method = RequestMethod.POST) 
	public String notimodifyPOST(NoticeVO vo,RedirectAttributes rttr) throws Exception {
		logger.info(" notimodifyPOST() �샇異� (�뿈'�뿠'�뿈)(�뿈'�뿠'�뿈) ");
		logger.info(vo.toString());
		
		//�꽌鍮꾩뒪 - 湲��젙蹂� �닔�젙
		int result = service.modifyBoard(vo);
				
		if(result == 1) {   // �닔�젙�맂 �젙蹂닿� 1媛쒖씪�븣
			rttr.addFlashAttribute("result","modOK");
	 }
		
		return "redirect:/admin/notice";
	}
	
	// 怨듭��궗�빆 湲� �궘�젣�븯湲�
	

}