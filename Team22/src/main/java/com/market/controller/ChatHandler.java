package com.market.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.market.domain.ChatMessageVO;
import com.market.domain.ChatRoomVO;
import com.market.service.ChatMessageService;
import com.market.service.ChatRoomService;


@RequestMapping("/chat")
public class ChatHandler extends TextWebSocketHandler {
	
	// 웹 소켓 세션을 저장할 리스트 생성
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	private static final Logger logger = LoggerFactory.getLogger(ChatHandler.class);
	
	
	@Autowired
	public ChatRoomService crservice;
	
	@Autowired
	public ChatMessageService cmservice;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		logger.info(" {} 연결됨 !!! ", session.getId());

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// view에서 보낸 메세지(이름, 채팅내용, 받는 사람)를 msg 변수에 담아줌
		String msg = message.getPayload();
		// 메세지를 구분자(",")를 이용하여 잘라서 배열형태로 담아줌 
		String[] arr = msg.split(",");

		logger.info(" {}님이 >>>>>> '{}' 보냄  ", session.getId(), message.getPayload());
		
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(arr[0]+","+arr[1]+","+arr[2]+","+arr[3]));
			//sess.sendMessage(new TextMessage(message.getPayload()));
		}

		int roomNum = Integer.parseInt(arr[3]);
		
//		logger.info(" 메세지 보낸 사람 : " + arr[0]);
//		logger.info(" 메세지 내용 : " + arr[1]);
//		logger.info(" 메세지 받는 사람 : " + arr[2]);
//		logger.info(" 방 번호 : " + arr[3]);
		
		ChatMessageVO cmvo = new ChatMessageVO();
		
		cmvo.setBuyer_id(arr[0]);
		cmvo.setChat_content(arr[1]);
		cmvo.setSeller_id(arr[2]);
		cmvo.setRoom_id(roomNum);

		int result = cmservice.registChatDialog(cmvo);		
		logger.info(result + " 채팅 입력 성공 ");
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		logger.info(" 연결끊김 !!! ", session.getId());
	}

}
