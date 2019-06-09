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
			return "member/index2";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/pwcheck",method = RequestMethod.POST)
	public String pwCheck(MemberDTO mDto) {
		log.info(">>> AJAX:현재 비밀번호 체크");
		String result = service.pwCheck(mDto);
		// id => 현재 로그인 유저의 ID
		// pw => 사용자가 입력한 현재 비밀번호 값
		// DB에 등록되있는 비밀번호 값
		return result;
	}
	@RequestMapping(value="/pwupdate",method = RequestMethod.GET)
	public String pwUpdateView() {
		log.info(">>> 비밀번호 수정 페이지 출력");
		return "member/pw_update";
	}
	
	@RequestMapping(value="/pwupdate",method = RequestMethod.POST)
	public String pwUpdatePlay(MemberDTO mDto) {
		log.info(">>> 비밀번호 수정 액션");
		service.pwUpdate(mDto);
		return "redirect:/";
	}
	
	@RequestMapping(value="/update",method = RequestMethod.GET)
	public String updateView(HttpSession session, Model model) {
		log.info(">>> 회원수정");
		MemberDTO mDto = service.viewMember(session);
		model.addAttribute("one",mDto);
		return "member/index2";
	}
	
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String updatePlay(MemberDTO mDto, HttpSession session) {
		log.info(">>> 회원수정 액션");
		service.infoUpdate(mDto);

		session.removeAttribute("userid");
		session.removeAttribute("name");
		session.setAttribute("userid", mDto.getId());
		session.setAttribute("name", mDto.getName());
		return "redirect:/";
	}
	
	@RequestMapping(value="/delete",method = RequestMethod.GET)
	public String deleteView() {
		log.info(">>> 회원삭제");
		return "member/member_delete";
	}
	
	@RequestMapping(value="/delete",method = RequestMethod.POST)
	public String deletePlay(MemberDTO mDto, HttpSession session) {
		log.info(">>> 회원삭제");
		int result = service.delete(mDto);
		if(result > 0) {
			session.invalidate();
		}
		return "redirect:/";
	}
}
