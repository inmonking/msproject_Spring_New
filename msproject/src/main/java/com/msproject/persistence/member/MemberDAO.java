package com.msproject.persistence.member;

import javax.servlet.http.HttpSession;

import com.msproject.domain.member.MemberDTO;

public interface MemberDAO {

	public int idCheck(String id);
	public int create(MemberDTO mDto);
	public String login(MemberDTO mDto, HttpSession session);
	public MemberDTO viewMember(String id);
}
