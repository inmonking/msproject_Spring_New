package com.msproject.persistence.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.msproject.domain.board.BoardDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void create(BoardDTO bDto) {
		sqlSession.insert("board.create", bDto);
	}

	@Override
	public void update(BoardDTO bDto) {
		sqlSession.update("board.update", bDto);
	}

	@Override
	public void delete(int bno) {
		sqlSession.update("board.delete", bno);
	}

	@Override
	public BoardDTO read(int bno) {
		return sqlSession.selectOne("board.read",bno);
	}

	@Override
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.listAll",map);
	}

	@Override
	public void increaseViewCnt(int bno, HttpSession session) {
		long update_time = 0;
		int result = 0;
		if(session.getAttribute("update_time_"+bno) != null) {
			update_time = (long)session.getAttribute("update_time_"+bno);
		}
		long current_time = System.currentTimeMillis();
		if(current_time - update_time > 24*60*60*1000) {
			result = sqlSession.update("board.viewCnt", bno);
			session.setAttribute("update_time_"+bno, current_time);
		}
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectOne("board.countArticle",map);
	}

	@Override
	public void replyCountUpdate(int bno, int count) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("count", count);
		sqlSession.update("board.replyCountUpdate", map);
	}

	@Override
	public int lastBno() {
		return sqlSession.selectOne("board.lastbno");
	}

}
