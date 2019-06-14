package com.msproject.controller.board;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.msproject.domain.board.BoardDTO;
import com.msproject.service.board.BoardService;
import com.msproject.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("board/*")
public class BoardController {
	@Inject
	private BoardService service;
	
	//게시글 전체리스트 출력
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(
			@RequestParam(defaultValue = "new") String sort_option,
			@RequestParam(defaultValue = "all") String search_option,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "1") int curPage			
			) {
		log.info(">>> 게시글목록 출력");
		int count = service.countArticle(search_option, keyword);
		
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		// 페이지에 출력할 게시글 목록
		List<BoardDTO> list = service.listAll(sort_option, search_option, keyword, start, end);
		
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("keyword",keyword);
		map.put("search_option", search_option);
		
		mav.setViewName("board/boardList");
		mav.addObject("map",map);
		
		return mav;
	}
	
	//게시글 1건(상세게시글) 출력
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String view(int bno, Model model,HttpSession session) {
		service.increaseViewCnt(bno, session);
		BoardDTO bDto = service.read(bno);
		model.addAttribute("one", bDto);
		return "board/boardView";
	}
	
	//게시글 등록 페이지 출력
	@RequestMapping(value="create", method = RequestMethod.GET)
	public String createView() {
		log.info(">>>>>>게시글 등록 페이지 출력");
		return "board/boardInsert";
	}
	
	//게시글 등록
	@Transactional
	@RequestMapping(value="create", method = RequestMethod.POST)
	public String create(BoardDTO bDto) {
		service.create(bDto);
		return "redirect:/board/view?bno="+bDto.getBno();
	}
	
	@RequestMapping(value="update", method = RequestMethod.GET)
	public String updateView(int bno, Model model) {
		BoardDTO bDto = service.read(bno);
		model.addAttribute("one", bDto);
		return "board/boardUpdate";
	}
	
	@RequestMapping(value="update", method = RequestMethod.POST)
	public String update(BoardDTO bDto) {
		service.update(bDto);
		return "redirect:/board/view?bno="+bDto.getBno();
	}
	
	@RequestMapping(value="delete", method = RequestMethod.GET)
	public String delete(int bno) {
		service.delete(bno);
		return "redirect:/board/list";
	}
}
