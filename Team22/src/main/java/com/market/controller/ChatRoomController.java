package com.market.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.market.service.ChatMessageService;
import com.market.service.ChatRoomService;

@Controller
public class ChatRoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatRoomController.class);
	
	@Autowired
	private ChatRoomService crservice;
	
	@Autowired
	private ChatMessageService cmservice;
    
    // 채팅 홈 화면
    @RequestMapping(value = "/chatroom", method = RequestMethod.GET)
    public String selectChatHome(HttpSession session, Model model) {
    	
    	logger.info(" selectChatHome() 실행 ");
    	
    	String id = (String) session.getAttribute("id");
    	
    	// 채팅방 리스트 출력
    	model.addAttribute("chatRoomList", crservice.chatList(id)); 
    	
    	List<ChatMessageVO> chatList = cmservice.searchRecentChatDialog(id);
    	model.addAttribute("chatList", chatList);
    	
    	return "/chat/chat";
    	
    }
    
    
    // 상품 페이지에서 채팅하기 클릭시 채팅방 조회
    @RequestMapping(value = "/chatroom-select", method = RequestMethod.GET)
    public String createChatroom(HttpSession session, Model model, ChatRoomVO crvo,
    		@RequestParam(value = "product_num") int pnum, 
    		@RequestParam(value = "seller") String seller) {
    	
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

    	// 채팅 내역 출력
    	List<ChatMessageVO> chatList = cmservice.searchRecentChatDialog(id);
    	model.addAttribute("chatList", chatList);
    	
    	model.addAttribute("seller", seller);
    	model.addAttribute("pnum", pnum);
		model.addAttribute("room_id", crservice.searchRoomId(crvo));
    	model.addAttribute("ptitle", crservice.searchTitle(crvo.getRoom_id()));
    	
    	return "/chat/chat"; 
    }

    
    // 채팅방 목록에서 방 클릭시 채팅창 조회
    @RequestMapping(value = "/selectroom", method = RequestMethod.GET)
    public String selectRoom(HttpSession session, Model model, ChatRoomVO crvo, 
    						@RequestParam(value = "room_id") int room_id) {
    	
    	logger.info(" selectRoom() 실행 ");
    	
    	String id = (String) session.getAttribute("id");
    	
    	ChatRoomVO result = crservice.searchChatRoomInfo(room_id);
    	model.addAttribute("readRoom", result);
    	
    	crvo.setRoom_id(room_id);
    	crvo.setBuyer(id);

    	List<ChatMessageVO> cmList = cmservice.searchChatDialog(room_id, id);
    	model.addAttribute("selectChatting", cmList); 
    	model.addAttribute("ptitle", crservice.searchTitle(crvo.getRoom_id()));
    	model.addAttribute("room_id", room_id);

		return "/chat/selectroom";
    }
    

}
