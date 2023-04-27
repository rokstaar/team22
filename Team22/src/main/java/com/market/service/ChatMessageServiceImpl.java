package com.market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.domain.ChatMessageVO;
import com.market.persistence.ChatMessageDAO;

@Service
public class ChatMessageServiceImpl implements ChatMessageService {
	
	@Autowired
	private ChatMessageDAO cmdao;

	@Override
	public List<ChatMessageVO> searchChatDialog(int room_id, String id) {
		return cmdao.selectChatDialog(room_id, id);
	}

	@Override
	public int registChatDialog(ChatMessageVO cmvo) {
		return cmdao.insertChatDialog(cmvo);
	}

	@Override
	public List<ChatMessageVO> searchRecentChatDialog(String id) {
		return cmdao.selectRecentChatDialog(id);
	}

}
