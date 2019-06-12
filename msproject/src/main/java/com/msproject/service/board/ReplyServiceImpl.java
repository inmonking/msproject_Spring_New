package com.msproject.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.msproject.domain.board.ReplyDTO;
import com.msproject.persistence.board.BoardDAO;
import com.msproject.persistence.board.ReplyDAO;	

@Service
public class ReplyServiceImpl implements ReplyService {
	@Inject
	private ReplyDAO rDao;
	@Inject
	private BoardDAO bDao;
	
	@Override
	public List<ReplyDTO> list(int bno) {
		return rDao.list(bno);
	}

	@Transactional
	@Override
	public void create(ReplyDTO rDto) {
		rDao.create(rDto);
		int bno = rDto.getBno();
		int count = rDao.replycount(bno);
		bDao.replyCountUpdate(bno, count);
	}

	@Transactional
	@Override
	public void delete(ReplyDTO rDto) {
		rDao.delete(rDto);
		int bno = rDto.getBno();
		int count = rDao.replycount(bno);
		bDao.replyCountUpdate(bno, count);
	}

	@Override
	public int replycount(int bno) {
		return rDao.replycount(bno);		
	}


}
