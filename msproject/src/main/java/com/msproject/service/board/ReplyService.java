package com.msproject.service.board;

import java.util.List;

import org.springframework.stereotype.Service;

import com.msproject.domain.board.ReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> list(int bno);
	public void create(ReplyDTO rDto);
	public void delete(ReplyDTO rDto);
	public int replycount(int bno);
}
