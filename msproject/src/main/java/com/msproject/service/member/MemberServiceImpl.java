package com.msproject.service.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.msproject.domain.member.MemberDTO;
import com.msproject.persistence.member.MemberDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO mDao;
	
	@Override
	public int idCheck(String id) {
		return mDao.idCheck(id);
	}

	@Override
	public int create(MemberDTO mDto) {
		// 비즈니스 로직을 처리하는 부분
		// 비즈니스 로직 : 회원가입
		// 회원가입을 하기 위해서는 DB를 사용해야함
		return mDao.create(mDto);
	}

	@Override
	public boolean login(MemberDTO mDto, HttpSession session) {
		// 비즈니스로직
		// 1) DB와 ID와 PW가 매칭되는지 check
		// 2) check가 맞으면 (로그인 성공)
		//		-> session 담음
		// 3) check가 틀리면 (로그인 실패)
		// 		-> modal창 경고메시지 출력
		String name = mDao.login(mDto);
		boolean result = false;
		if(name != null) { // 로그인 성공
			// session에 로그인 정보를 담아야 함
			// id, name만 담음
			session.removeAttribute("userid");
			session.removeAttribute("name");
			session.setAttribute("userid", mDto.getId());
			session.setAttribute("name", name);
			result = true;
			log.info("session>>"+session.getAttribute("name"));
		}
		return result;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	@Override
	public MemberDTO viewMember(HttpSession session) {
		String id = (String) session.getAttribute("userid");
		MemberDTO mDto = mDao.viewMember(id);
		return mDto;
	}

	@Override
	public String pwCheck(MemberDTO mDto) {
		// DB에서 가져온 현재비밀번호와
		// 사용자가 입력한 현재비밀번호가
		// 같은지 체크해서
		// 같으면 1, 틀리면 -1을 view단으로 전송
		String name = mDao.login(mDto);
		String result = "-1";
		log.info(name);
		if(name!=null) {
			result = "1";
		}
		return result;
	}

	@Override
	public void pwUpdate(MemberDTO mDto) {
		//비밀번호 수정
		//data: id, pw => mDto
		mDao.pwUpdate(mDto);
	}

	@Override
	public void infoUpdate(MemberDTO mDto) {
		mDao.infoUpdate(mDto);
	}

	@Override
	public int delete(MemberDTO mDto) {
		return mDao.delete(mDto);		
	}
	
}
