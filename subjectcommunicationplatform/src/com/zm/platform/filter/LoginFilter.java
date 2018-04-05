package com.zm.platform.filter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.zm.platform.domain.User;
import com.zm.platform.service.UserService;

public class LoginFilter implements HandlerInterceptor{

	@Autowired
	private UserService userservice;
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("afterCompletion");
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("postHandle");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("preHandle");
		
		Cookie[]  cookies = request.getCookies();
		HttpSession session = request.getSession();
		for(int i =0;i<cookies.length;i++){
			System.out.println("cookiename:"+cookies[i].getName());
			System.out.println("userid".equals(cookies[i].getName())==true);
			if("userid".equals(cookies[i].getName())==true){
				User user = userservice.findById(Long.parseLong(cookies[i].getValue()));
				session.setAttribute("user", user);
			}
		}
		return true;
	}

}
