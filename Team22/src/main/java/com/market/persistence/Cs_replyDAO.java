package com.market.persistence;

import java.util.List;

import com.market.domain.Cs_replyVO;
import com.market.domain.CustomerserviceVO;

public interface Cs_replyDAO {
	
	// 댓글 조회
    public List<Cs_replyVO> relist(int cs_num) throws Exception;
	
	// 댓글 작성
    public void rewrite(Cs_replyVO vo) throws Exception;
    
    // 댓글여부 변경
    public void proupdate(CustomerserviceVO cvo)throws Exception;
    
    // 단일 댓글 조회
    public Cs_replyVO replySelect(Cs_replyVO vo) throws Exception;
	
	// 댓글 수정
	public void reupdate(Cs_replyVO vo)throws Exception;
	
	// 댓글 삭제
	public void redelete(Cs_replyVO vo)throws Exception;

}
