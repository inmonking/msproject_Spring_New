package com.msproject.controller.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.msproject.domain.member.MemberDTO;
import com.msproject.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping(value = "/member/*")
public class MemberController {

	@Inject
	private MemberService service;
	
	@ResponseBody
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String login(MemberDTO mDto, HttpSession session) {
		log.info(">>> AJAX:로그인");
		
		boolean result = service.login(mDto,session);
		String flag = "-1";
		if(result) {
			flag = "1";
		}
		
		return flag;
	}
	
	@ResponseBody
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public void logout(HttpSession session) {
		log.info(">>> 로그아웃");
		service.logout(session);
	}
	
	@RequestMapping(value="/constract",method = RequestMethod.GET)
	public String constract() {
		log.info(">>> 회원가입 동의");
		return "member/constract";
	}
	
	@ResponseBody	//데이터로 인식
	@RequestMapping(value="/idcheck", method = RequestMethod.POST)
	public int idCheck(String id) {
		
		log.info("AJAX:ID 중복 체크");
		
		return service.idCheck(id);
	}
	
	// 회원가입 페이지 출력
	@RequestMapping(value="/create",method = RequestMethod.GET)
	public String createView() {
		log.info(">>> 회원가입 페이지 출력");
		return "member/member_join";
	}
	
	// DB를 통한 회원가입 액션
	@RequestMapping(value="/create",method = RequestMethod.POST)
	public String createPlay(MemberDTO mDto, RedirectAttributes rttr) {
		log.info(">>> DB를 통한 회원가입 액션");
		log.info(mDto.toString());
		
		int result = service.create(mDto);
		if(result>0) {
			log.info("가입성공");
//			rttr.addFlashAttribute("message","hello");
			return "redirect:/";
		}else {
			log.info("가입실패");
			return "member/constract";
		}
	}
	
	@RequestMapping(value="/update",method = RequestMethod.GET)
	public String update(HttpSession session, Model model) {
		log.info(">>> 회원수정");
		MemberDTO mDto = service.viewMember(session);
		model.addAttribute("one",mDto);
		return "member/info_update";
	}
	@RequestMapping(value="/delete",method = RequestMethod.GET)
	public String delete() {
		log.info(">>> 회원삭제");
		return "";
	}
}
