package com.market.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.domain.ChatMessageVO;

@Repository
public class ChatMessageDAOImpl implements ChatMessageDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.chatMapper";

	// 채팅 내용 조회
	@Override
	public List<ChatMessageVO> selectChatDialog(int room_id, String id) {
		
		Map<String, String> infoMap = new HashMap<>();
        infoMap.put("id", id);
        infoMap.put("room_id", room_id+"");
        
        return sqlSession.selectList(NAMESPACE + ".selectChatDialog", infoMap);
	}

	// 채팅 보내기
	@Override
	public int insertChatDialog(ChatMessageVO cmvo) {
		return sqlSession.insert(NAMESPACE + ".insertChatDialog", cmvo); 
	}

	//
	@Override
	public List<ChatMessageVO> selectRecentChatDialog(String id) {
		return sqlSession.selectList(NAMESPACE + ".selectRecentChatDialog", id);
	}

}
