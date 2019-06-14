package com.msproject.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.msproject.domain.board.BoardDTO;
import com.msproject.persistence.board.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO bDao;
	@Override
	public void create(BoardDTO bDto) {
		bDao.create(bDto);
	}

	@Override
	public void update(BoardDTO bDto) {
		bDao.update(bDto);		
	}

	@Override
	public void delete(int bno) {
		bDao.delete(bno);		
	}

	@Override
	public BoardDTO read(int bno) {
		return bDao.read(bno);
	}

	@Override
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end) {
		return bDao.listAll(sort_option, search_option, keyword, start, end);
	}

	@Override
	public void increaseViewCnt(int bno, HttpSession session) {
		bDao.increaseViewCnt(bno, session);
	}

	@Override
	public int countArticle(String search_option, String keyword) {
		return bDao.countArticle(search_option, keyword);
	}

	@Override
	public void replyCountUpdate(int bno, int count) {
		bDao.replyCountUpdate(bno, count);
	}

	@Override
	public int lastBno() {
		return bDao.lastBno();
	}

}
