package com.market.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.market.domain.AuctionVO;
import com.market.service.AuctionService;

@Controller
@RequestMapping(value = "/auction/*")
public class AuctionController {
	
	@Inject
	private AuctionService service;
	
	private ExecutorService nonBlockingService = Executors.newCachedThreadPool();
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String AListGET(Model model,@RequestParam(value = "search", required = false) String search
									  ,@RequestParam(value = "order", required = false) String order
									  ,@RequestParam(value= "met", required = false) String met
									  ,@RequestParam(value= "cate", required = false) String cate) throws Exception {

		if(order == null) {
			order = "au_num";
		}
		if(met == null) {
			met = "desc";
		}
		
		if(order.equals("best")) {
			List<AuctionVO> aList = service.bestAList();
			model.addAttribute("aList", aList);
			model.addAttribute("best", service.nowBest());
			return "/auction/auctionList";
		}
		
		if(search == null || search == "") {
			List<AuctionVO> aList = service.getAList(order, met);
			model.addAttribute("aList", aList);
			model.addAttribute("best", service.nowBest());
		}else {
			List<AuctionVO> aList = service.getSearchList(search);
			
			model.addAttribute("aList", aList);
		}
		
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
	public String auctionRegistPOST(AuctionVO vo,HttpSession session, MultipartHttpServletRequest multiRequest, HttpServletResponse respose, Model model) throws Exception{
		vo.setAu_sellerId((String)session.getAttribute("id"));	
		
		multiRequest.setCharacterEncoding("UTF-8");
		
//		Map paramMap = new HashMap();
//		Enumeration enu = multiRequest.getParameterNames();
//		while(enu.hasMoreElements()) {
//			String name = (String) enu.nextElement();
//			String value = multiRequest.getParameter(name);
//			paramMap.put(name, value);
//		}
		List fileList = fileProcess(multiRequest);
//		model.addAttribute("paramMap", paramMap);
//		model.addAttribute("fileList", fileList);
		
		vo.setAu_pic(fileList.toString());
		service.registAuction(vo);
		
		
		return "redirect:/auction/list";
	}
	
	private List<String> fileProcess(MultipartHttpServletRequest multiRequest) throws Exception {
		List<String> fileList = new ArrayList<String>();
		
		Iterator<String> fileNames =  multiRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			
			MultipartFile mFile = multiRequest.getFile(fileName);
			String oFileName = mFile.getOriginalFilename();
			fileList.add(oFileName);
			
			File file = new File("D:\\upload\\" + fileName);
			
			if(mFile.getSize() != 0) {
				if(!file.exists()) { 
					if(file.getParentFile().mkdir()) {
						file.createNewFile();
					}
				}
				
				mFile.transferTo(new File("D:\\upload\\" + oFileName));
				
			}
		}
		
		return fileList;
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void fileDownload(@RequestParam("fileName") String fileName, HttpServletResponse response) throws Exception{
		String downFile = "D:\\upload\\"+ fileName;
		
		File file = new File(downFile);
		
		OutputStream out = response.getOutputStream();
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
		
		FileInputStream fis = new FileInputStream(file);
		
		byte[] buffer = new byte[1024 * 8];
		
		while(true) {
			int data = fis.read(buffer);
			if(data == -1) break; 
			
			out.write(buffer,0,data);
		}
		fis.close();
		out.close();
		
		
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
	
	@ResponseBody
	@RequestMapping(value = "/bid", method = RequestMethod.GET)
	public List<Integer> bid(AuctionVO vo, @RequestParam("bidPrice") String price, HttpSession session, @RequestParam("lastBuyer") String lBuyer,
			@RequestParam("lastBid") String lBid) throws Exception {
		System.out.println(vo);
		System.out.println(lBuyer);
		System.out.println(lBid);
		List<Integer> List = new ArrayList<Integer>();
		String id = (String)session.getAttribute("id");
		int aPrice = Integer.parseInt(price);
		int lastBid = Integer.parseInt(lBid);
		vo.setAu_buyerId(id);
		vo.setAu_bidPrice(aPrice);
		
		int pPay = lastBid + service.getMpay(lBuyer);
		
		service.plusPay(lBuyer, pPay);
		service.insertBid(vo);
		service.minusPay(id, service.getMpay(id)-aPrice);
		
		List.add(aPrice);
		List.add(service.getMpay(id));
		
		return List;
	}
	
	@ResponseBody
	@RequestMapping(value = "/uBid", method = RequestMethod.GET)
	public HashMap<String, Object> uBid(AuctionVO vo, Model model, HttpSession session) throws Exception {
		String id = (String)session.getAttribute("id");
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("bid", service.getADetail(vo).getAu_bidPrice());
		map.put("pay", service.getMpay(id));
		map.put("buyer", service.getADetail(vo).getAu_buyerId());
		
		return map;
	}
	
	

	
    


}


















