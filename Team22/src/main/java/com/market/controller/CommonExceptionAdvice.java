package com.market.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

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
}
