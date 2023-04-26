package com.market.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.market.domain.ChatMessageVO;

public class ChatMessageDAOImpl implements ChatMessageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	// ä�� ���� ��ȸ
	@Override
	public List<ChatMessageVO> selectChatDialog(int room_id, String id) {
		
		Map<String, String> infoMap = new HashMap<>();
        infoMap.put("id", id);
        infoMap.put("room_id", room_id+"");
        
        return sqlSession.selectList("chat_message.selectChatDialog", infoMap);
	}

}
