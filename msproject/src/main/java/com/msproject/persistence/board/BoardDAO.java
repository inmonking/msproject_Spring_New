package com.msproject.persistence.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.msproject.domain.board.BoardDTO;

public interface BoardDAO {
	public void create(BoardDTO bDto);
	public void update(BoardDTO bDto);
	public void delete(int bno);
	public BoardDTO read(int bno);
	// 게시글목록(페이지 나누기, 검색기능 포함)
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end);
	//조회수 증가 처리
	public void increaseViewCnt(int bno, HttpSession session);
	//레코드 갯수 계산
	public int countArticle(String search_option, String keyword);
}
