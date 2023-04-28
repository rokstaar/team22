package com.market.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.domain.AuctionVO;
import com.market.domain.ProductVO;
import com.market.domain.ReviewVO;
import com.market.service.TradeService;

@Controller
@RequestMapping(value = "/trade")
public class TradeController {
	
	

	@Inject
	private TradeService service;

	private static final Logger logger = LoggerFactory.getLogger(TradeController.class);
	
	//http://localhost:8080/main
	
	
	// 구매후기
	@RequestMapping(value = "/buyReview", method = RequestMethod.GET)
	public String buyReview(Model model,HttpSession session) throws Exception {
		
		String id = (String)session.getAttribute("id");
		List<Map<String,Object>> buyReview = service.getBuyReview(id);
		
		model.addAttribute("buyReview",buyReview);
		
		
		return "/trade/buyReview";
	}
	
	// 판매후기
	@RequestMapping(value = "/sellReview", method = RequestMethod.GET)
	public String tSellReview(Model model,HttpSession session) throws Exception {
		String id = (String)session.getAttribute("id");
		List<Map<String,Object>> tSellReview = service.tSellReview(id);
		model.addAttribute("tSellReview",tSellReview);	
		
		
		return "/trade/sellReview";
	}
	
	// 구매 내역
	@RequestMapping(value = "/buyList", method = RequestMethod.GET)
	public void buyList(Model model,HttpSession session) throws Exception {
		
		String id = (String)session.getAttribute("id");
		List<Map<String,Object>> buyList = service.buyList(id);
		
		logger.info("@@@@@@@@@@@@@@@"+id);
		
		logger.info("b@@@@@@@@@@@@@@"+buyList);
		
		model.addAttribute("buyList",buyList);
		
	}
	
	// 판매 내역
	@RequestMapping(value = "/prodList", method = RequestMethod.GET)
	public void prodList(Model model) throws Exception {
		
		List<Map<String,Object>> prodList = service.prodList();
		logger.info("b@@@@@@@@@@@@@@"+prodList);
		
		model.addAttribute("prodList",prodList);
		
		
	}
	
	// 구매후기작성
	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
	public String reviewWritePOST(Model model, ReviewVO rvo,RedirectAttributes rttr ) throws Exception{
//		List<Map<String,Object>> List = service.buyList();
		
		service.writeReview(rvo);
//		model.addAttribute("List",List);
		rttr.addFlashAttribute("result","buy");
		rttr.addFlashAttribute("result","prod");
		
		return "redirect:/trade/buyReview";
	}
	
	// 나의 판매상품
	@RequestMapping(value = "/mySaleProduct", method = RequestMethod.GET)
	public String getProdList(Model model,HttpSession session) throws Exception{
		
		String id = (String)session.getAttribute("id");
		
		List<ProductVO> myProdList = service.myProdList(id);
		
		model.addAttribute("myProdList",myProdList);
		
		return "/trade/mySaleProduct";
	} 
	
	// 내가 찜한 상품
	@RequestMapping(value = "/favorite", method = RequestMethod.GET)
	public String getFavorite(Model model,HttpSession session) throws Exception{
		
		String id = (String)session.getAttribute("id");
		List<ProductVO> myProdList = service.myProdList(id);
		model.addAttribute("myProdList",myProdList);
		
		return "/trade/favorite";
	} 
	
	// 나의 경매정보
	@RequestMapping(value = "/myAuctionList", method = RequestMethod.GET)
	public String myAuctionList(Model model,HttpSession session) throws Exception {
		String id = (String)session.getAttribute("id");
		logger.info("@@@@@@@@@@@@@@@"+id);
		
		List<AuctionVO> buyAuctionList = service.buyAuctionList(id);
		
		model.addAttribute("buyAuctionList", buyAuctionList);
		
		
		return "/trade/myAuctionList";
	}
	
}
