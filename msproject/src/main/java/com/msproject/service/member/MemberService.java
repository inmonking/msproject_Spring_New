package com.msproject.service.member;

import javax.servlet.http.HttpSession;

import com.msproject.domain.member.MemberDTO;

public interface MemberService {
	// Ajax : ID 중복체크
	public int idCheck(String id);
	// 회원가입
	public int create(MemberDTO mDto);
	// 로그인
	public boolean login(MemberDTO mDto, HttpSession session);
	public void logout(HttpSession session);
	public MemberDTO viewMember(HttpSession session);
	public String pwCheck(MemberDTO mDto);
	public void pwUpdate(MemberDTO mDto);
	public void infoUpdate(MemberDTO mDto);
	public int delete(MemberDTO mDto);
}
