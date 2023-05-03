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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.market.domain.ChatMessageVO;
import com.market.domain.ChatRoomVO;
import com.market.domain.ProductVO;
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
    
	// 채팅하기 클릭시 채팅 페이지 조회
	@RequestMapping(value = "/chatroom", method = RequestMethod.POST)
	public String createChatroom(HttpSession session, Model model, ChatRoomVO crvo, 
				@RequestParam(value = "product_num") int pnum, @RequestParam(value = "seller") String seller) {
		
		logger.info(" createChatroom() 실행 ");
		
		// 세션 제어
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "redirect:/members/login";
		}

		logger.info(" 상품 번호 >>>> " + pnum + " 판매자 >>>> " + seller);
		crvo.setBuyer(id);		
		
        if (crservice.searchChatRoom(crvo) == 0) {
        	logger.info(" 채팅방 없음 @@@@@@@@@@@ ");
            crservice.registChatRoom(crvo);
            logger.info(" 채팅방 만듬 @@@@@@@@@@@ ");
        }
        
        model.addAttribute("seller", seller);
        model.addAttribute("pnum", pnum);
        model.addAttribute("currRoomId", crservice.searchRoomId(crvo));
        model.addAttribute("ptitle", crservice.searchTitle(crvo.getRoom_id()));
        
             
        return "/chat/myChat2";

	}
	
    @RequestMapping(value="/chatroom", method=RequestMethod.GET)
    public String chatroomGet(HttpSession session) {
    	
    	logger.info(" chatroomGet() 실행 ");
    	
    	String id = (String) session.getAttribute("id");
		if(id == null) {
			return "redirect:/members/login";
		}
        
        return "/chat/myChat2";

    }
    
    
    // 채팅방 조회
    @RequestMapping(value="/chatroom-info", method=RequestMethod.POST)
    @ResponseBody
    public List<ChatMessageVO> chatroomPost(HttpSession session, Model model) {
    	
    	logger.info(" chatroomPost() 실행 ");
    	
    	String id = (String) session.getAttribute("id");
    	
    	List<ChatMessageVO> cmvoList = cmservice.searchRecentChatDialog(id);
    			
    	for(ChatMessageVO cmvo : cmvoList) {
    		cmvo.setChat_profile(crservice.searchTitle(cmvo.getRoom_id()));
    	}
    	
		return cmvoList;
    }
        

}
