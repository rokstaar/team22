package com.market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.market.domain.ChatMessageVO;
import com.market.persistence.ChatMessageDAO;


public class ChatMessageServiceImpl implements ChatMessageService {
	
	@Autowired
	private ChatMessageDAO cmdao;

	@Override
	public List<ChatMessageVO> searchChatDialog(int roomId, String id) {
		return null;
	}

}
