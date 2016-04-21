<%@page import="java.io.File"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%

	String webPath = request.getRealPath("/") + File.separator + "installed";
	File file = new File(webPath);
	if(file.exists()){
		//exist
		request.getRequestDispatcher("/login.jsp").forward(request, response); 
	}else{
		//no exist
		request.getRequestDispatcher("/login.jsp").forward(request, response); 
		//response.sendRedirect("index.jsp");
	}
	file = null;
%>