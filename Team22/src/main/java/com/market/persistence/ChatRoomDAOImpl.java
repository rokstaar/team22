package com.market.persistence;

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
	public int searchRoomId(ChatRoomVO crvo) {
		
		return sqlSession.selectOne(NAMESPACE + "selectRoomId", crvo);
	}

	@Override
	public int insertChatRoom(ChatRoomVO crvo) {
		return sqlSession.insert(NAMESPACE + ".insertChatRoom", crvo);
	}

}
