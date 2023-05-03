package com.market.persistence;

import com.market.domain.ChatRoomVO;

public interface ChatRoomDAO {
	
	public int selectChatRoom(ChatRoomVO crvo);
	
	public int selectRoomId(ChatRoomVO crvo);
	
	public int insertChatRoom(ChatRoomVO crvo);
	
	public ChatRoomVO selectChatRoomInfo(int room_id);
	
	public String selectTitle(int room_id);

	
}
