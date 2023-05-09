package com.market.controller;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	
	List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
	
	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
			
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		sessionList.add(session);
		
		String senderId = getMemberId(session);
		
		if(senderId != null) {
			log(senderId + " 연결 됨");
			users.put(senderId, session);
		}

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String senderId = getMemberId(session);
		
		// 특정 유저에게 보내기
		String msg = message.getPayload();
		
		if(msg != null) {
			String[] strs = msg.split(",");
			log(strs.toString());
			
			if(strs != null && strs.length == 4) {
				String type = strs [0];
				String target = strs[1];
				String content = strs[2];
				String url = strs[3];
				WebSocketSession targetSession = users.get(target); 
				
				if(targetSession != null) {
					TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ url +"'>[<b>" + type + "</b>] " + content + "</a>");
					targetSession.sendMessage(tmpMsg);
				}
			}
		}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		String senderId = getMemberId(session);
		
		if(senderId != null) {
			log(senderId + " 연결 종료됨");
			users.remove(senderId);
			sessionList.remove(session);
		}
		
	}
	
	public void log(String logmsg){
		logger.info(new Date() + " : " + logmsg);
		
	}
	
	// 웹 소켓에 로그인한 회원 id 가져오기
	private String getMemberId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String id = (String) httpSession.get("id");
		
		return id == null ? null: id;
	}

}
