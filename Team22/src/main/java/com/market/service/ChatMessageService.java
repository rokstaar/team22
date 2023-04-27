package com.market.service;

import java.util.List;

import com.market.domain.ChatMessageVO;

public interface ChatMessageService {
	
	  public List<ChatMessageVO> searchChatDialog(int room_id, String id);
	  
	  public int registChatDialog(ChatMessageVO cmvo);
	  
	  public List<ChatMessageVO> searchRecentChatDialog(String id);

}
