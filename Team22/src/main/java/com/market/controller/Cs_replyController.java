package com.market.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.domain.Cs_replyVO;
import com.market.domain.CustomerserviceVO;
import com.market.service.Cs_replyService;
import com.market.service.CustomerserviceService;


@Controller
@RequestMapping(value = "/reply/*")
public class Cs_replyController {
	

	@Inject
	private Cs_replyService service;
	
	private static final Logger logger = LoggerFactory.getLogger(Cs_replyController.class);
	
	// 댓글 조회
	
	// 댓글 작성
	@RequestMapping(value = "/rewrite",method = RequestMethod.POST)
	public String rewrite(Cs_replyVO vo, CustomerserviceVO cvo)throws Exception{

		service.rewrite(vo);
		service.proupdate(cvo);
		
		logger.info(vo.toString());
		logger.info(cvo.toString());
		
		return "redirect:/cs/csread?cs_num="+cvo.getCs_num();
	}
	
	// 댓글 단일 조회(수정 페이지)
	@RequestMapping(value = "/remodify",method = RequestMethod.GET)
	public void getMofidy(@RequestParam("cs_num") int cs_num, @RequestParam("re_rno") int re_rno, Model model) throws Exception{
		
		Cs_replyVO vo = new Cs_replyVO();
		vo.setRe_rno(re_rno);
		vo.setCs_num(cs_num);
		
		Cs_replyVO rvo = service.replySelect(vo);
		
		model.addAttribute("rvo",rvo);

	}
	
	// 댓글 수정
	@RequestMapping(value = "/remodify", method = RequestMethod.POST)
	public String postModify(Cs_replyVO vo,CustomerserviceVO cvo) throws Exception {

		service.reupdate(vo);
		
		logger.info(vo.toString());
			 
		return "redirect:/cs/csread?cs_num="+cvo.getCs_num();
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/redelete", method = RequestMethod.GET)
	public String postDelete(Cs_replyVO vo,CustomerserviceVO cvo) throws Exception{
		// 서비스 - 글정보 삭제 처리
		
		service.redelete(vo);
					
		return "redirect:/cs/csread?cs_num="+cvo.getCs_num();
	}
	
	


}
