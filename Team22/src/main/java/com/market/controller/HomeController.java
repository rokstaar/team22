package com.market.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.market.service.ProductService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private ProductService pserv;
	
	// http://localhost:8080/main
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request
					,Model model) {
		model.addAttribute("viewlist", pserv.viewedList(request));
		
		return "main";
	}

	/*
	 * @GetMapping(value = "/") public String home() { return "redirect:/main"; }
	 */
}