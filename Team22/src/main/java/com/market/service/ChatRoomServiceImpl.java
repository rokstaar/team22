package com.market.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.domain.ChatRoomVO;
import com.market.persistence.ChatRoomDAO;


@Service
public class ChatRoomServiceImpl implements ChatRoomService {

	@Autowired
	private ChatRoomDAO crdao;

	@Override
	public int searchChatRoom(ChatRoomVO crvo) {
		return crdao.selectChatRoom(crvo);

	}

	@Override
	public int registChatRoom(ChatRoomVO crvo) {
		return crdao.insertChatRoom(crvo);
	}

	@Override
	public int searchRoomId(ChatRoomVO crvo) {
		return 0;
	}

}
