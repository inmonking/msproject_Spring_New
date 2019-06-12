package com.msproject.persistence.board;

import java.util.List;

import com.msproject.domain.board.ReplyDTO;

public interface ReplyDAO {
	public List<ReplyDTO> list(int bno);
	public void create(ReplyDTO rDto);
	public void delete(ReplyDTO rDto);
	public int replycount(int bno);
}
