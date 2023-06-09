package com.market.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.market.domain.ChatMessageVO;
import com.market.domain.ChatRoomVO;
import com.market.service.ChatMessageService;
import com.market.service.ChatRoomService;

@Controller
public class ChatRoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatRoomController.class);
	
	@Autowired
	private ChatRoomService crservice;
	
	@Autowired
	private ChatMessageService cmservice;
	
	// 채팅 테스트 ------------------------------------------------------
    @RequestMapping("/test/{id}")
    public String test(HttpSession session, @PathVariable String id) {
        session.setAttribute("id", id);
        return "chat/test";
    }

	/*
	 * @RequestMapping("/chat") public ModelAndView chatControl(ChatRoomVO vo) {
	 * 
	 * if(!vo.getSeller().equals(vo.getBuyer())) { }
	 * 
	 * return null;
	 * 
	 * }
	 */
    
	// 채팅 페이지 조회
	@RequestMapping(value = "/chatroom", method = RequestMethod.POST)
	public String createChatroom(HttpSession session, Model model, ChatRoomVO crvo) {
		
		// 세션 제어
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "redirect:/members/login";
		}
		
		crvo.setBuyer(id);
		
        if (crservice.searchChatRoom(crvo) == 0) {
        	logger.info(" 채팅방 없음 @@@@@@@ ");
            crservice.registChatRoom(crvo);
        }
        
        model.addAttribute("currRoomId", crservice.searchRoomId(crvo));
             
        return "/chat/myChat3";
	}
	
    @RequestMapping(value="/chatroom", method=RequestMethod.GET)
    public String chatroomGet(HttpSession session) {
    	
    	String id = (String) session.getAttribute("id");
		if(id == null) {
			return "redirect:/members/login";
		}
        
        return "/chat/myChat3";
    }
    
    
    @RequestMapping(value="/chatroom-info", method=RequestMethod.POST)
    public List<ChatMessageVO> chatroomPost(HttpSession session) {
    	
    	String id = (String) session.getAttribute("id");
    	
    	List<ChatMessageVO> cmvoList = cmservice.searchRecentChatDialog(id);
    			
    	for(ChatMessageVO cmvo : cmvoList) {
    		
    	}
    	
		return cmvoList;
    	
    }
        

}
