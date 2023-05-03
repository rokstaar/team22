package com.market.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
		// best 異붽�?
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
	public int rBidGET(RandomVO vo, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("id");
		vo.setRan_buyerId(id);
		
//		service.rBid(vo);
		
		return service.countP(vo.getRan_num());
	}

}
























