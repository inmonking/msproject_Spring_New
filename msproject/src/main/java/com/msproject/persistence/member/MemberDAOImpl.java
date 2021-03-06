package com.msproject.persistence.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.msproject.domain.member.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.idCheck",id);
	}

	@Override
	public int create(MemberDTO mDto) {
		return sqlSession.insert("member.create", mDto);
	}

	@Override
	public String login(MemberDTO mDto) {
		return sqlSession.selectOne("member.login", mDto);
	}

	@Override
	public MemberDTO viewMember(String id) {
		return sqlSession.selectOne("member.viewMember",id);
	}

	@Override
	public void pwUpdate(MemberDTO mDto) {
		sqlSession.update("member.pwUpdate", mDto);		
	}

	@Override
	public void infoUpdate(MemberDTO mDto) {
		sqlSession.update("member.infoUpdate", mDto);
	}

	@Override
	public int delete(MemberDTO mDto) {
		return sqlSession.delete("member.delete", mDto);
	}

}
