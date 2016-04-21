package com.project.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {
	// private String encoding;

	public void init(FilterConfig filterconfig) throws ServletException {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 获得在下面代码中要用的request,response,session对象
		HttpServletRequest servletRequest = (HttpServletRequest) request;
		HttpServletResponse servletResponse = (HttpServletResponse) response;
		HttpSession session = servletRequest.getSession();

		//StringBuffer fileURL = servletRequest.getRequestURL();
		// 获得用户请求的URI
		String path = servletRequest.getRequestURI();
		// System.out.println(path);

		// 从session里取员工工号信息
		String name = (String) session.getAttribute("userName");

		
		
		// 登陆页面无需过滤
		if (path.indexOf("login.jsp") > 0||path.indexOf(".jpg") > 0 || path.indexOf(".png") > 0
			     || path.indexOf(".gif") > 0
			     || path.indexOf("image.jsp") > 0) {
			chain.doFilter(servletRequest, servletResponse);
			return;
		}

		// 判断如果没有取到员工信息,就跳转到登陆页面
		if (name == null || "".equals(name)) {
			// 跳转到登陆页面
			servletResponse.sendRedirect("login.jsp");
		} else {
			// 已经登陆,继续此次请求
			chain.doFilter(request, response);
		}
	}

	public void destroy() {

	}
}
