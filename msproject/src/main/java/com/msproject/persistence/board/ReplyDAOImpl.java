package com.msproject.persistence.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.msproject.domain.board.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ReplyDTO> list(int bno) {
		return sqlSession.selectList("reply.list", bno);
	}

	@Override
	public void create(ReplyDTO rDto) {
		sqlSession.insert("reply.create", rDto);
	}

	@Override
	public void delete(ReplyDTO rDto) {
		sqlSession.delete("reply.delete", rDto);
	}

	@Override
	public int replycount(int bno) {
		return sqlSession.selectOne("reply.replycount", bno);
	}
	
}
