package com.market.service;

import com.market.domain.ChatRoomVO;

public interface ChatRoomService {
	
	public int searchChatRoom(ChatRoomVO crvo);
	
	public int searchRoomId(ChatRoomVO crvo);
	
	public int registChatRoom(ChatRoomVO crvo);
	
}
