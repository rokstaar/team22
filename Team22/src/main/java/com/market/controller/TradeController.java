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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.domain.AuctionVO;
import com.market.domain.ProductVO;
import com.market.domain.RandomVO;
import com.market.domain.ReviewVO;
import com.market.domain.TradeVO;
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
		
		logger.info("@@@@@@@@@@@@@@@@@@321"+buyReview);
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
		
		logger.info("@@@@@@@@@@@@@@"+buyList);
		
		model.addAttribute("buyList",buyList);
		
		
	}
	// 경매 구매 내역
	@RequestMapping(value = "/myBuyAuction", method = RequestMethod.GET)
	public void myBuyAuction(Model model,HttpSession session) throws Exception {
		
		String id = (String)session.getAttribute("id");
		List<Map<String,Object>> myBuyAuction = service.myBuyAuction(id);
		
		logger.info("@@@@@@@@@@@@@@@"+id);
		
		logger.info("@@@@@@@@@@@@@@"+myBuyAuction);
		
		model.addAttribute("myBuyAuction",myBuyAuction);
		
	}
	// 응모 구매 내역
	@RequestMapping(value = "/myBuyRandom", method = RequestMethod.GET)
	public void myBuyRandom(Model model,HttpSession session) throws Exception {
		
		String id = (String)session.getAttribute("id");
		List<Map<String,Object>> myBuyRandom = service.myBuyRandom(id);
		
		logger.info("@@@@@@@@@@@@@@@"+id);
		
		logger.info("@@@@@@@@@@@@@@"+myBuyRandom);
		
		model.addAttribute("myBuyRandom",myBuyRandom);
		
	}
	
	// 판매 내역
	@RequestMapping(value = "/prodList", method = RequestMethod.GET)
	public void prodList(Model model) throws Exception {
		List<Map<String,Object>> prodList = service.prodList();
		logger.info("@@@@@@@@@@@@@@"+prodList);
		
		model.addAttribute("prodList",prodList);
		
	}
	
	// 구매후기작성
	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
	public String reviewWritePOST(Model model, ReviewVO rvo,RedirectAttributes rttr ) throws Exception{
//		List<Map<String,Object>> List = service.buyList();
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+rvo);
		
		service.writeReview(rvo);
		
//		model.addAttribute("List",List);
		rttr.addFlashAttribute("result","buy");
		
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
		
		List<Map<String,Object>> favoriteList = service.favoriteList(id);
		model.addAttribute("favoriteList",favoriteList);
		return "/trade/favorite";
	} 
	
	// 나의 경매정보
	@RequestMapping(value = "/myAuctionList", method = RequestMethod.GET)
	public String myAuctionList(Model model,HttpSession session) throws Exception {
		String id = (String)session.getAttribute("id");
		logger.info("@@@@@@@@@@@@@@@"+id);
		
		List<AuctionVO> buyAuctionList = service.buyAuctionList(id);
		List<AuctionVO> getAList = service.getAuctionList(id);
		
		model.addAttribute("buyAuctionList", buyAuctionList);
		model.addAttribute("getAList", getAList);
		
		
		return "/trade/myAuctionList";
	}
	// 나의 응모정보
	@RequestMapping(value = "/myBuyRandomList", method = RequestMethod.GET)
	public String myRandomList(Model model,HttpSession session) throws Exception {
		String id = (String)session.getAttribute("id");
		logger.info("@@@@@@@@@@@@@@@"+id);
		
		List<RandomVO> myBuyRandomList = service.myBuyRandomList(id);
		
		model.addAttribute("myBuyRandomList", myBuyRandomList);
		
		
		return "/trade/myBuyRandomList";
	}
	
	// 내 경매 판매 목록
	@RequestMapping(value = "/mySaleAuction", method = RequestMethod.GET)
	public String getSaleAuction(Model model,HttpSession session) throws Exception{
		
		String id = (String)session.getAttribute("id");
		
		List<AuctionVO> mySaleAuction = service.mySaleAuction(id);
		
		model.addAttribute("mySaleAuction",mySaleAuction);
		
		return "/trade/mySaleAuction";
	} 
	// 내 랜덤 판매 목록
	@RequestMapping(value = "/mySaleRandom", method = RequestMethod.GET)
	public String getSaleRandom(Model model,HttpSession session) throws Exception{
		
		String id = (String)session.getAttribute("id");
		
		List<RandomVO> mySaleRandom = service.mySaleRandom(id);
		
		model.addAttribute("mySaleRandom",mySaleRandom);
		
		return "/trade/mySaleRandom";
	} 
	
	// 리뷰삭제
	@RequestMapping(value = "/removeDelete", method = RequestMethod.GET)
	public String removeDelete(Model model,
								@RequestParam(value = "product_num", required = false) Integer prod_num,
								@RequestParam(value = "ran_num", required = false) Integer ran_num,
								@RequestParam(value = "au_num", required = false) Integer au_num,
								RedirectAttributes rttr)throws Exception {
	
		logger.info("@@@@@@@@@@@@@@@@@@remove@"+prod_num);
		int resultP = service.removeReview(prod_num);
		int resultR = service.removeReview(ran_num);
		int resultA = service.removeReview(au_num);
		
		if (resultP == 1 || resultR == 1 || resultA == 1) {
			rttr.addFlashAttribute("result", "delOK");
			return "redirect:/trade/buyReview";
		}else {
			return "redirect:/trade/buyReview";
		}
		// 페이지이동(listALL)
	}
	
	// 내가 등록한 상품 삭제
	@RequestMapping(value = "/soldProdRemove", method = RequestMethod.GET)
	public String removeProduct(@RequestParam("product_num") Integer product_num,
			RedirectAttributes rttr)throws Exception {
		
		logger.info("@@@@@@@@@@@@@@@@@"+product_num);
		int result = service.removeProduct(product_num);
		
		if(result == 1) {
			rttr.addFlashAttribute("result", "delOK");
		}
		// 페이지이동(listALL)
		return "redirect:/trade/mySaleProduct";
	}
	// 내가 등록한 경매상품 삭제
	@RequestMapping(value = "/removeAuction", method = RequestMethod.GET)
	public String removeAuction(Model model,@RequestParam("au_num") Integer au_num,
			RedirectAttributes rttr)throws Exception {
		
		logger.info("@@@@@@@@@@@@@@@@@"+au_num);
		int result = service.removeAuction(au_num);
		if(result == 1) {
			rttr.addFlashAttribute("result", "delOK");
		}
		// 페이지이동(listALL)
		return "redirect:/trade/mySaleAuction";
	}
	
	// 내가 등록한 랜덤상품 삭제
	@RequestMapping(value = "/removeRandom", method = RequestMethod.GET)
	public String removeRandom(Model model,@RequestParam("ran_num") int ran_num,
			RedirectAttributes rttr)throws Exception {
		
		logger.info("removeRandom@@@@@@@@@@@"+ran_num);
		int result = service.removeRandom(ran_num);
		
		if(result == 1) {
			rttr.addFlashAttribute("result", "delOK");
			return "redirect:/trade/mySaleRandom";
		}
		return "/trade/mySaleRandom";
		// 페이지이동(listALL)
	}
	// 나의 판매완료된 상품 목록
	@RequestMapping(value = "/soldProduct", method = RequestMethod.GET)
	public String soldProduct(HttpSession session,Model model)throws Exception{
		String id = (String)session.getAttribute("id");
		List<Map<String,Object>> soldProdList = service.getSoldProduct(id);
		model.addAttribute("soldProdList",soldProdList);
		
		return "/trade/soldProduct";
	}
	// 나의 판매완료된 경매 목록
	@RequestMapping(value = "/soldAuction", method = RequestMethod.GET)
	public String soldAuction(HttpSession session,Model model)throws Exception{
		String id = (String)session.getAttribute("id");
		List<Map<String,Object>> soldAuction = service.getSoldAuction(id);
		model.addAttribute("soldAuction",soldAuction);
		
		return "/trade/soldAuction";
	}
	// 나의 판매완료된 응모 목록
	@RequestMapping(value = "/soldRandom", method = RequestMethod.GET)
	public String soldRandom(HttpSession session,Model model)throws Exception{
		String id = (String)session.getAttribute("id");
		List<Map<String,Object>> soldRandom = service.getSoldRandom(id);
		model.addAttribute("soldRandom",soldRandom);
		logger.info("soldRandom@@@@@@@@@@@@@@@@"+soldRandom);
		
		return "/trade/soldRandom";
	}
	// 판매 완료된 상품 삭제
	@RequestMapping(value = "/soldProdRemove", method = RequestMethod.POST)
	public String soldProductPOST(@ModelAttribute("prod_num") int prod_num,
			RedirectAttributes rttr)throws Exception{
		logger.info("@@@@@@@@soldPRODREMOVE_num"+prod_num);
		
		int result = service.soldProdRemove(prod_num);
		if(result == 1) {
			rttr.addFlashAttribute("result", "delOK");
		}
		return "redirect:/trade/soldProduct";
	}
	
	// 경매 완료된 상품 삭제
	@RequestMapping(value = "/soldAuctionRemove", method = RequestMethod.POST)
	public String soldAuctionPOST(@ModelAttribute("au_num") int au_num,
			RedirectAttributes rttr)throws Exception{
		logger.info("@@@@@@@@soldAuction"+au_num);
		
		int result = service.soldAuRemove(au_num);
		if(result == 1) {
			rttr.addFlashAttribute("result", "delOK");
		}
		return "redirect:/trade/soldAuction";
	}
	// 경매 완료된 상품 삭제
	@RequestMapping(value = "/soldRanRemove", method = RequestMethod.POST)
	public String soldRanRemovePOST(@ModelAttribute("ran_num") int ran_num,
			RedirectAttributes rttr)throws Exception{
		logger.info("@@@@@@@@soldAuction"+ran_num);
		
		int result = service.soldRanRemove(ran_num);
		if(result == 1) {
			rttr.addFlashAttribute("result", "delOK");
		}
		return "redirect:/trade/soldAuction";
	}
	
	// 판매 확정
	@RequestMapping(value = "/sellProd",method = RequestMethod.POST)
	public String sellProdPOST(HttpSession session,TradeVO vo,
							 @RequestParam("prod_num")int prod_num, Model model)throws Exception {
		
		logger.info("@@@@@@@@@@@@@@@@@@@@"+vo);
		
		service.sellProd(vo);
		service.productUpdate(prod_num);
		
		return "redirect:/trade/soldProduct";
	}
	
}
