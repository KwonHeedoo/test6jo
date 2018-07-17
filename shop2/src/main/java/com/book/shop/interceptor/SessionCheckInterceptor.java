package com.book.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import VO.Shopmember;

public class SessionCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		Shopmember m = (Shopmember) session.getAttribute("userInfo");
		if (m == null) {
			response.sendRedirect(request.getContextPath() + "/gotologin");
			// 리스폰스에서 절대경로 가져온다음에 경로는 컨트롤러 에서 받는 액션값을 넣어준다...
			return false; // false 면 컨트롤러의 리턴으로 가지 말라는 뜻
		} else {
			return true;
		}
	}

	
	
}
