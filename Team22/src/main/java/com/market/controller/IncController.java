package com.market.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.market.service.MemberService;

@Controller
@RequestMapping(value = "/include")
public class IncController {

	@Inject
	private MemberService service;
	
	// 留덉씠�럹�씠吏�
		@RequestMapping(value = "/myPage", method = RequestMethod.GET)
		public String incMyPage(Model model, HttpSession session)throws Exception{
			String id = (String)session.getAttribute("id");
			
			model.addAttribute("memberInfo",service.memberInfo(id));
			return "/include/myPage";
		}
	
}
