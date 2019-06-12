package com.msproject.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.msproject.domain.board.ReplyDTO;
import com.msproject.persistence.board.ReplyDAO;	

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	private ReplyDAO rDao;
	@Override
	public List<ReplyDTO> list(int bno) {
		return rDao.list(bno);
	}

	@Override
	public void create(ReplyDTO rDto) {
		rDao.create(rDto);
	}

	@Override
	public void delete(ReplyDTO rDto) {
		rDao.delete(rDto);
	}

	@Override
	public int replycount(int bno) {
		return rDao.replycount(bno);		
	}


}
