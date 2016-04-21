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

public class CharactorFilter implements Filter {
	  //字符编码   
	String encoding=null;
	@Override
	public void destroy() {
		/**
		 * @author by Jam
		 * 2014-12-8 上午10:18:31
		*/
		encoding=null;
	}

	@Override
	public void doFilter(ServletRequest srequest, ServletResponse sresponse,FilterChain chain) 
			throws IOException, ServletException {
		/**
		 * @author by Jam
		 * 2014-12-8 上午10:18:31
		*/
		HttpServletRequest request = (HttpServletRequest)srequest;
		HttpServletResponse response = (HttpServletResponse)sresponse;
		if(encoding!=null){
			//设置request字符编码           
			request.setCharacterEncoding(encoding);         
			//设置response字符编码          
			response.setCharacterEncoding(encoding); 
			//response.setContentType("text/html;charset="+encoding);        
			}    
		//System.out.println("设置编码成功");
		    //传递给下一个过滤器       
		chain.doFilter(request, response);
		}
	

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		/**
		 * @author by Jam
		 * 2014-12-8 上午10:18:31
		*/
		 //获取初始化参数      
		encoding=filterConfig.getInitParameter("encoding");
		System.out.println("编码是"+encoding);
	}

	
}
