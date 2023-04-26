package com.market.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.market.domain.MemberVO;
import com.market.domain.TradeVO;
import com.market.service.TradeService;

@Controller
@RequestMapping(value = "/trade")
public class TradeController {
	
	

	@Inject
	private TradeService service;

	private static final Logger logger = LoggerFactory.getLogger(TradeController.class);
	
	//http://localhost:8080/main
	
	
	@RequestMapping(value = "/review", method = RequestMethod.GET) 
	public String tradeReview(Model model,HttpSession session) throws Exception {
		
		String id = (String)session.getAttribute("id");
		
		List<TradeVO> tBuyReview = service.getBuyReview();

		logger.info("@@@@@@@@@@"+tBuyReview);
		logger.info("@@@@@@@@@@"+id);
		model.addAttribute("tBuyReview",tBuyReview);	
		
//		if(id == vo.getBuy_mem_id()) {
			
			return "/trade/tradeReview";
//		}else {
//			return "redirect:/members/login";
//			
//		}
	}
	
	@RequestMapping(value = "/buyReview", method = RequestMethod.GET)
	public String buyReview() throws Exception {
		
		
		return "/trade/buyReview";
	}
	
	
	@RequestMapping(value = "/sellReview", method = RequestMethod.GET)
	public String tSellReview(Model model) throws Exception {
		
		List<TradeVO> tSellReview = service.tSellReview();
		model.addAttribute("tSellReview",tSellReview);	
		
		
		return "/trade/sellReview";
	}
	
	@RequestMapping(value = "/buyList", method = RequestMethod.GET)
	public void buyList(Model model) throws Exception {
		
		List<Map<String,Object>> buyList = service.buyList();
		logger.info("b@@@@@@@@@@@@@@"+buyList);
		
		
		model.addAttribute("buyList",buyList);
		
		
	}
	
	@RequestMapping(value = "/prodList", method = RequestMethod.GET)
	public void prodList(Model model) throws Exception {
		
		List<Map<String,Object>> prodList = service.prodList();
		logger.info("b@@@@@@@@@@@@@@"+prodList);
		
		model.addAttribute("prodList",prodList);
		
		
	}
	
	
	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
	public String reviewWritePOST() throws Exception{

		
			
		return "/trade/tradeReview";
	}

	
	
	
}
