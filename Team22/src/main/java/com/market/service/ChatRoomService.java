package com.market.service;

import java.util.List;

import com.market.domain.ChatRoomVO;

public interface ChatRoomService {
	
	public int searchChatRoom(ChatRoomVO crvo);
	
	public int searchRoomId(ChatRoomVO crvo);
	
	public int registChatRoom(ChatRoomVO crvo);
	
	public ChatRoomVO searchChatRoomInfo(int room_id);
	
	public String searchTitle(int room_id);
	
	
	public List<ChatRoomVO> chatList (String id);
	
	
}
