package com.market.service;

import java.util.List;

import com.market.domain.ChatMessageVO;

public interface ChatMessageService {
	
	  public List<ChatMessageVO> searchChatDialog(int roomId, String id);

}
