package com.msproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter {
	// 메인액션 실행되기 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session 체크, 값이 있으면 통과, 없으면 돌려보냄(원래 페이지로 가서 모달창 에러메시지 출력)
		HttpSession session = request.getSession();
		if(session.getAttribute("userid")==null) {
			log.info("로그인 해주세요!!");
			String referer = request.getHeader("referer");
			String uri = request.getRequestURI();
			
			int index = referer.lastIndexOf("/");
			int length = referer.length();
			String url = referer.substring(index,length);
			
			if(url.equals("/create")) {
				response.sendRedirect(request.getContextPath()+"/board/list");
				return false;
			}
			if(url.equals("/update")) {
				response.sendRedirect(request.getContextPath()+"/board/list");
				return false;
			}
			
			// Login 페이지로 이동
			FlashMap flashMap = RequestContextUtils.getOutputFlashMap(request);
			flashMap.put("message", "nologin");
			flashMap.put("uri", uri);
			log.info(">>>URI: "+ uri+" >>>url: "+url);
			
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			return false;
		}else {
			log.info("통과하세요");
			return true;
		}
		
		
		//return false; -> 못들어감 돌아가게 만듦
		//return true; -> 통과! 메인액션 실행
		//return super.preHandle(request, response, handler);
	}
	// 메인액션 실행 된 후
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
