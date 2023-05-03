package com.market.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.market.domain.ChatMessageVO;
import com.market.domain.ChatRoomVO;
import com.market.service.ChatMessageService;
import com.market.service.ChatRoomService;

@Controller
@RequestMapping("/chatroom")
public class ChatMessageController {
	
	private static final Logger logger = LoggerFactory.getLogger(ChatMessageController.class);
	
	@Autowired
	private ChatRoomService crservice;
	
	@Inject
	private ChatMessageService cmservice;

    // 채팅 기록 가져오기
    @RequestMapping(value="/chatdialog", method=RequestMethod.POST)
    @ResponseBody
    public List<ChatMessageVO> chatdialog(@RequestParam int room_id, HttpSession session) {
    	
    	logger.info(" chatdialogPost() 실행 ");
    	
    	String id = (String) session.getAttribute("id");
    	
    	List<ChatMessageVO> cmList = cmservice.searchChatDialog(room_id, id);
    	
		return cmList;
    }

	// 채팅 하기
	@RequestMapping(value = "/chatdialog/{room_id}", method = RequestMethod.POST)
	@ResponseBody
	public List<ChatMessageVO> registChatDiaolog(
			@PathVariable("room_id") int room_id, @RequestBody ChatMessageVO vo, HttpSession session) {
		
		logger.info(" registChatDiaologPost() 실행 ");

		String id = (String) session.getAttribute("id");
		
		ChatRoomVO crvo = crservice.searchChatRoomInfo(room_id);
		
		logger.info(" 채팅방 찾았따 @@@@@@@@@@@@ " + room_id);
		
		ChatMessageVO cmvo = new ChatMessageVO();
		cmvo.setRoom_id(room_id);
		cmvo.setBuyer_id(id);
		cmvo.setChat_content(vo.getChat_content());
		
		if(crvo.getSeller().equals(id)) { // 판매글 작성자와 접속한 회원의 정보가 같다면
			cmvo.setSeller_id(crvo.getBuyer());
		} else {
			cmvo.setSeller_id(crvo.getSeller()); 
		}
		
		cmservice.registChatDialog(cmvo);
		
		logger.info(" 채팅방 생성 완료 @@@@@@@@@@@@ ");
		
		List<ChatMessageVO> cmList = cmservice.searchChatDialog(cmvo.getRoom_id(), id);
		
		return cmList;
		
	}
	
}
