package com.market.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.util.ProductRegException;

@ControllerAdvice
public class CommonExceptionAdvice {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
	@ExceptionHandler(Exception.class)
	public ModelAndView commons(Exception e) {
		logger.info("CommonsExceptionAdvice_commons()");
		logger.info(e.toString());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/commonsException");
		mav.addObject(e.toString());
		
		return mav;
	}
	
	@ExceptionHandler(ProductRegException.class)
	public ModelAndView prodReghandle(ProductRegException e) {
		logger.info(e.toString());
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/product/prodReg");
		mav.addObject("product_seller", e.getProduct_seller());
		mav.addObject("warningMessage", e.getMessage());
		
		return mav;
	}
}
