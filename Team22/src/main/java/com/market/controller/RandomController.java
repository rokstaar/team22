package com.market.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.market.domain.RandomVO;
import com.market.service.RandomService;

@Controller
@RequestMapping("/random")
public class RandomController {
	
	@Inject
	private RandomService service;
	
	@RequestMapping(value = "/rRegist", method = RequestMethod.GET)
	public String rRegistGET(HttpSession session) {
		String id = (String)session.getAttribute("id");
		if(id == null) {
			return "redirect:/members/login";
		}
		return "/random/rRegist";
	}
	
	@RequestMapping(value = "rRegist", method = RequestMethod.POST)
	public String rRegistPOST(RandomVO vo, HttpSession session, MultipartHttpServletRequest multiRequest, HttpServletResponse response, Model model) throws Exception {
		vo.setRan_sellerId((String)session.getAttribute("id"));
		vo.setRan_bidPrice(vo.getRan_price() / vo.getRan_maxPp());
		
		multiRequest.setCharacterEncoding("UTF-8");
		
		List fileList = fileProcess(multiRequest);
		vo.setRan_pic(fileList.toString());
		if(vo.getRan_buyerId() == null) {
			vo.setRan_buyerId(vo.getRan_sellerId());
		}
		
		service.rRegist(vo);
		
		return "redirect:/random/rList";
	}
	
	private List<String> fileProcess(MultipartHttpServletRequest multiRequest) throws Exception {
		List<String> fileList = new ArrayList<String>();
		
		Iterator<String> fileNames =  multiRequest.getFileNames();
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			
			MultipartFile mFile = multiRequest.getFile(fileName);
			String oFileName = mFile.getOriginalFilename();
			fileList.add(oFileName);
			
			File file = new File("D:\\upload\\ran\\" + fileName);
			
			if(mFile.getSize() != 0) {
				if(!file.exists()) { 
					if(file.getParentFile().mkdir()) {
						file.createNewFile();
					}
				}
				
				mFile.transferTo(new File("D:\\upload\\ran\\" + oFileName));
				
			}
		}
		
		return fileList;
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void fileDownload(@RequestParam("fileName") String fileName, HttpServletResponse response) throws Exception{
		String downFile = "D:\\upload\\ran\\"+ fileName;
		
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
	
	@RequestMapping(value = "/rList", method = RequestMethod.GET)
	public void rListGET(Model model) throws Exception{
		model.addAttribute("rList", service.rlist());
		System.out.println(service.rlist());
		RandomVO best = service.nowBest();
		System.out.println(best);
		System.out.println(service.countP(best.getRan_num())); // best null이라 오류뜸 수정필요
		model.addAttribute("best", best);
		model.addAttribute("bCount", service.countP(best.getRan_num()));
		
	}
	
	@RequestMapping(value = "rDetail", method = RequestMethod.GET)
	public void rDetailGET(@RequestParam("ran_num") int ran_num, Model model, HttpSession session) throws Exception{
		String id = (String) session.getAttribute("id");
		model.addAttribute("vo", service.rDetail(ran_num));
		model.addAttribute("countP", service.countP(ran_num));
		model.addAttribute("pay", service.getMPay(id));
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/rBid", method = RequestMethod.GET)
	public Map<String, Integer> rBidGET(RandomVO vo, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		vo.setRan_buyerId(id);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<String> bList = service.selectBuyer(vo.getRan_num());
		
		for(int i=0; i<bList.size(); i++) {
			if(id.equals(bList.get(i))) {
				map.put("error", 1);
				return map;
			}
		}
		
		
		service.minusPay(id, vo.getRan_bidPrice());
		service.rBid(vo);
		
		map.put("pay", service.getMPay(id));
		map.put("ran_num",service.countP(vo.getRan_num()));
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/uBid", method = RequestMethod.GET)
	public Integer uBidGET(@RequestParam("ran_num") String num) throws Exception {
		int ran_num = Integer.parseInt(num);
		
		return service.countP(ran_num);
	}
	
	@ResponseBody
	@RequestMapping(value = "/end", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String end(@RequestParam("ran_num") int ran_num, @RequestParam("seller") String seller) throws Exception{
		String result = service.selectTrade(ran_num);
		
		if(result == null) {
			service.updateRan(ran_num);
			RandomVO vo = service.selectWinner(ran_num);
			vo.setRan_sellerId(seller);
			service.insertTrade(vo);
			service.plusPay(vo);
			
			return "응모가 종료되었습니다. 당첨자는 " + vo.getRan_buyerId() + "님 입니다.";
		}else {
			
			return "응모가 종료되었습니다. 당첨자는 " + result + "님 입니다.";
		}
		
	}

}
























