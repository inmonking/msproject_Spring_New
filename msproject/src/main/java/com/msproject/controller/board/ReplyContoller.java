package com.msproject.controller.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.msproject.domain.board.ReplyDTO;
import com.msproject.service.board.BoardService;
import com.msproject.service.board.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("reply/*")
@Controller
public class ReplyContoller {

	@Inject
	private ReplyService service;
	@Inject
	private BoardService bservice;
	
	@RequestMapping(value="list", method = RequestMethod.GET)
	public String listAll(int bno, Model model) {
		log.info(">>> 댓글 목록 출력");
		List<ReplyDTO> list = service.list(bno);
		model.addAttribute("replyList", list);
		
		return "board/commentlist";
	}
	
	@ResponseBody
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public void create(ReplyDTO rDto) {
		service.create(rDto);
	}
	
	@ResponseBody
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public void delete(ReplyDTO rDto) {
		service.delete(rDto);
	}
}
