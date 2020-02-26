package com.nr.springboot.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute("principal") == null) {
//			System.out.println("인증이 되지 않았습니다, 돌아가시오.");
			response.sendRedirect("/");
			return false;
		}

//		System.out.println("인증되었습니다.");
		
		return true;
	}
}
