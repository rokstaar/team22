package com.market.controller;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.market.domain.AuctionVO;
import com.market.service.AuctionService;

@Controller
@RequestMapping(value = "/auction/*")
public class AuctionController {
	
	@Inject
	private AuctionService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String AListGET(Model model) throws Exception {
		List<AuctionVO> aList = service.getAList();
		
		
		model.addAttribute("aList", aList);
		model.addAttribute("best", service.nowBest());
		
		return "/auction/auctionList";
	}
	
	@RequestMapping(value = "/aRegist", method = RequestMethod.GET)
	public String auctionRegistGET(HttpSession session) throws Exception{
		String id = (String)session.getAttribute("id");
		
		if(id == null) {
			return "redirect:/members/login";
		}
		
		return "/auction/aRegist";
	}
	
	@RequestMapping(value = "/aRegist", method = RequestMethod.POST)
	public String auctionRegistPOST(AuctionVO vo, HttpSession session,@RequestParam(value = "file",required = false) MultipartFile[] uploadFile) throws Exception{
		vo.setAu_sellerId((String)session.getAttribute("id"));		
		String picName = "";
	
		for(int i=0; i<uploadFile.length; i++) {
			String uploadFolder = "C:\\Users\\ITWILL\\git\\market2\\src\\main\\webapp\\resources\\images";
			String fileName = uploadFile[i].getOriginalFilename();
			File saveFile = new File(uploadFolder, fileName);
			picName = picName + "," + fileName;
			uploadFile[i].transferTo(saveFile);
		}
		vo.setAu_pic(picName);
		int result = service.registAuction(vo);
		
		if(result == 1) {
			return "redirect:/auction/list"; // 상세보기로 바꾸기
		}
		
		return "";
	}
	
	@RequestMapping(value = "/aDetail", method = RequestMethod.GET)
	public void auctionDetailGET(AuctionVO vo, Model model, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		model.addAttribute("pay", service.getMpay(id));
		model.addAttribute("vo", service.getADetail(vo));
	}
	
	@RequestMapping(value = "/endDate", method = RequestMethod.GET)
	public void endDate(@RequestParam("num") int au_num) throws Exception {
		service.updateStatus(au_num);
	}
	
	@RequestMapping(value = "/bid", method = RequestMethod.GET)
	public void bid(AuctionVO vo) {
		System.out.println(vo);
		//System.out.println(bid);
	}

}


















