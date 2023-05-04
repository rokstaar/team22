package com.market.persistence;

import java.util.List;

import com.market.domain.ChatMessageVO;

public interface ChatMessageDAO {
	
	public List<ChatMessageVO> selectChatDialog(int room_id, String id);
	
	public int insertChatDialog(ChatMessageVO cmvo);
	
	public List<ChatMessageVO> selectRecentChatDialog(String id);
	
	public int updateExitChat(String id, int room_id, String person);
	
}
