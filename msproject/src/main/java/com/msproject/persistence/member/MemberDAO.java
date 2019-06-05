package com.msproject.persistence.member;

import javax.servlet.http.HttpSession;

import com.msproject.domain.member.MemberDTO;

public interface MemberDAO {

	public int idCheck(String id);
	public int create(MemberDTO mDto);
	public String login(MemberDTO mDto);
	public MemberDTO viewMember(String id);
	public void pwUpdate(MemberDTO mDto);
	public void infoUpdate(MemberDTO mDto);
	public int delete(MemberDTO mDto);
}
