<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%-- <% session.getAttribute("userName",user.userName);%> --%>
<%-- <%request.getSession().setAttribute("userName",user.userName); %> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>天坊汇供应商管理系统欢迎您</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css" type="text/css"></link>
    
	<script type="text/javascript"
	src="<%=request.getContextPath() %>/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/login.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
    <div class="login-top"></div>
<div class="login-area" align="center">
	<!-- <table> -->
	<form action="login" method="post" onsubmit="return loginbtn();">
	<!-- <tr> -->
		&nbsp;&nbsp;&nbsp;帐&nbsp;&nbsp;号:<input class="inputText" type="text" name="user.userName"
				id="userName" onblur="usernameBlur();" value="" /> <span
				class="spanred" id="spanusername"></span><br /> 
	<!-- </tr>
	<tr> -->
		&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;码:<input class="inputText"
				type="password" name="user.password" id="password"
				onblur="pwdBlur();" value="" /><span class="spanred"
				id="pwdprompt"></span> <br> 
	<!-- </tr> -->
		&nbsp;&nbsp;&nbsp;验证码:<input class="inputText" type="text"
				name="randStr" id="randStr" size="4" onblur="checkVerifiCode()" /><span
				class="spanred" id="verificationspan"></span><br /> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="mySpan"> <a  href="#" onClick="changeImg();"> <input class="inputText"
					type="image" src="random" title="点击图片刷新验证码" /> </a> </span><br/> 
		<span><input type="submit" class="login-sub" value="" /><a href="register.jsp" target="_blank"><input  class="input-re" type="button" value=""/></a><a  href="updatePassword.jsp" target="_blank"><input class="input-up" type="button" value=""/></a></span><span class="spanred"><s:property
					value="errorMessage" /> </span>
	</form>
	<!-- </table> -->
	</div>
  </body>
</html>
