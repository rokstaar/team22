package com.market.persistence;

import com.market.domain.ChatRoomVO;

public interface ChatRoomDAO {
	
	public int selectChatRoom(ChatRoomVO crvo);
	
	public int searchRoomId(ChatRoomVO crvo);
	
	public int insertChatRoom(ChatRoomVO crvo);

}
