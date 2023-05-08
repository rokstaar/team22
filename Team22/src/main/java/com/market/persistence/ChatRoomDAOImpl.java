package com.market.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.market.domain.ChatRoomVO;

@Repository
public class ChatRoomDAOImpl implements ChatRoomDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.chatMapper";

	@Override
	public int selectChatRoom(ChatRoomVO crvo) {
		 return sqlSession.selectOne(NAMESPACE + ".selectChatRoom", crvo);
	}
	
	@Override
	public int selectRoomId(ChatRoomVO crvo) {
		return sqlSession.selectOne(NAMESPACE + ".selectRoomId", crvo);
	}

	@Override
	public int insertChatRoom(ChatRoomVO crvo) {
		return sqlSession.insert(NAMESPACE + ".insertChatRoom", crvo);
	}

	@Override
	public ChatRoomVO selectChatRoomInfo(int room_id) {
		return sqlSession.selectOne(NAMESPACE  + ".selectChatRoomInfo", room_id);
	}

	@Override
	public String selectTitle(int room_id) {
		return sqlSession.selectOne(NAMESPACE + ".selectTitle", room_id); 
	}

	@Override
	public List<ChatRoomVO> selectChatList(String id) {
		return sqlSession.selectList(NAMESPACE + ".selectChatList", id);
	}

	

	

}
