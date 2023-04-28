package com.market.controller;

import java.util.List;

import javax.inject.Inject;
import javax.swing.text.DefaultEditorKit.CutAction;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.domain.CustomerserviceVO;
import com.market.domain.NoticeVO;
import com.market.service.CustomerserviceServiceImpl;

@Controller
@RequestMapping(value = "/cs/*")
public class CustomerserviceController {
	
	@Inject
	private CustomerserviceServiceImpl service;
	
   private static final Logger logger  = LoggerFactory.getLogger(CustomerserviceController.class);
   
   
    // http://localhost:8080/cs/cswrite
   //게시판 글 등록 
   @RequestMapping(value = "/cswrite",method = RequestMethod.GET)
   public void cswriteGET() throws Exception{
	   logger.info("cswriteGET() 호출$$$");
   }
   
   // 게시판 글 등록 - 정보처리
   @RequestMapping(value ="/cswrite",method = RequestMethod.POST )
	public String cswritePOST(CustomerserviceVO vo, RedirectAttributes rttr/* , MultipartHttpServletRequest request */) throws Exception{
	    logger.info("cswritePOST() 호출$$$");
	   
	    service.writeBoard(vo);
	    logger.info(vo.toString());
	    
	    rttr.addFlashAttribute("result","ok");
	    
	    return "redirect:/cs/cslist";
   }
   
   
   // http://localhost:8080/cs/boardlist
   // 게시판 목록(리스트) 조회
   @RequestMapping(value = "/cslist",method = RequestMethod.GET)
   public void cslistGET(Model model) throws Exception {
	   	   
	   List<CustomerserviceVO> boardList = service.boardList();
	   logger.info("boardList :"+boardList.size());
	   
	   // view 페이지 이동
	   model.addAttribute("boardList",boardList);
	   
   }
   
   // 게시판 특정 글 읽기
   @RequestMapping(value = "csread", method = RequestMethod.GET)
   public void csreadGET(@RequestParam("cs_num") int cs_num,Model model) throws Exception{
	   
	   // 조회수 증가
	   service.updateReadCnt(cs_num);
	   
	   CustomerserviceVO csVO = service.getBoard(cs_num);
	   logger.info(csVO.toString());
	   
	   model.addAttribute("csVO",csVO);
	   
   }
   
   // 게시판 글 수정 - 기존 글 가져오기
   @RequestMapping(value = "/csupdate", method = RequestMethod.GET)
   public void csupdateGET(@RequestParam("cs_num") int cs_num, Model model) throws Exception {
	   logger.info("csupdateGET 호출!!!");
	   
	   CustomerserviceVO cvo = service.getBoard(cs_num);
	   
	   model.addAttribute("cvo",cvo);
   }
   
   // 게시판 글 수정 - 처리
   @RequestMapping(value = "/csupdate", method = RequestMethod.POST)
   public String csupdatePOST(CustomerserviceVO vo,RedirectAttributes rttr) throws Exception {
	   logger.info(vo.toString());
	   
	   int result = service.updateBoard(vo);
	   
	   if(result == 1) {
		   rttr.addFlashAttribute("result","modOK");
	   }
	   
	   return "redirect:/cs/cslist";
   }
   
   // 게시판 글 삭제하기
   @RequestMapping(value = "/deletecs",method = RequestMethod.GET)
   public String deletecsGET(@RequestParam("cs_num") int cs_num,RedirectAttributes rttr) throws Exception {
	  int result = service.deleteBoard(cs_num);
	  
	  if(result == 1) {
		  rttr.addFlashAttribute("result","delOK");
	  }
	   
	   return "redirect:/cs/cslist";
   }


}
