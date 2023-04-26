package com.market.persistence;

import java.util.List;

import com.market.domain.ChatMessageVO;

public interface ChatMessageDAO {
	
	public List<ChatMessageVO> selectChatDialog(int room_id, String id);

}
