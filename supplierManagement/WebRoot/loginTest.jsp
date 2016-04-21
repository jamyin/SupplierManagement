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
    <%-- <base href="<%=basePath%>"> --%>
    
    <title>天坊汇供应商管理系统欢迎您</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css" type="text/css"></link>
    
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/login.js"></script>
	<script type="text/javascript" src="jsp/manhuaDialog.1.0.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#register").click(function(){
				$("#registerView").show();
			});
		});
	</script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    <div class="login-top"></div>
<div class="login-area" align="center">
	<form action="login.action" method="post" onsubmit="return loginbtn()">
		&nbsp;&nbsp;&nbsp;帐&nbsp;&nbsp;号:<input class="inputText" type="text" name="user.userName"
				id="userName" onblur="usernameBlur()" value="" /> 
				<br /> 
		&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;码:<input class="inputText"
				type="password" name="user.password" id="password"
				onblur="pwdBlur()" value="" /> <br> 
		&nbsp;&nbsp;&nbsp;验证码:<input class="inputText" type="text"
				name="randStr" id="randStr" size="4" onblur="checkVerifiCode()" /><br /> 
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="mySpan"> 
		<input class="inputText" type="image" src="random" title="点击图片刷新验证码" onClick="changeImg()" />
					</span><br/> 
		<span><input type="submit" class="login-sub" value="" /><input id="register" type="button" value="注册"/><!-- <input id="register" class="input-re" type="button" onclick="location.href='register.jsp'" target="_blank"/> --><input class="input-up" type="button" onclick="location.href='updatePassword.jsp'" target="_blank"/><!-- <a href="register.jsp" target="_blank" class="input-re" type="button"></a><a  href="updatePassword.jsp" class="input-up" target="_blank"></a> -->
		</span><span class="spanred"><s:property
					value="errorMessage" /> </span>&nbsp;&nbsp;<span class="spanred" id="spanusername"></span>&nbsp;&nbsp;<span class="spanred" id="pwdprompt"></span>&nbsp;&nbsp;<span class="spanred" id="verificationspan"></span>
	</form>
	</div>
	<div id="registerView" style="display: none;">
		<form action="register.action" method="post">
			帐&nbsp;&nbsp;号:<input class="inputText" type="text" name="user.userName" value="" onblur="usernameBlur()" id="userName"/><span class="spanred" id="spanusername"></span><br /> 
    		密&nbsp;&nbsp;码:<input class="inputText" type="password" name="user.password" value="" onblur="pwdBlur()" id="password"/><span class="spanred" id="pwdprompt"></span><br /> 
    		日&nbsp;&nbsp;期:<input class="inputText" type="text" name="user.createDate" value="" onclick="WdatePicker()"/><span class="spanred" id="createDate"></span><br /> 
    		权&nbsp;&nbsp;限:<!-- <input class="inputText" type="text" name="user.flag0" value=""/> -->
    		<select class="inputText" name="user.flag0">
    			<option>请选择</option>
    			<option value="0">管理员</option>
    			<option value="1">查询员</option>
    		</select>
    		<br /> 
    		验证码:<input class="inputText" type="text"
				name="randStr" id="randStr" size="4" onblur="checkVerifiCode()" /><span
				class="spanred" id="verificationspan"></span><br />
		<span id="mySpan"> <a  href="#" onClick="changeImg();"> <input class="inputText"
					type="image" src="random" title="点击图片刷新验证码" /> </a> </span><br /> 
			<input type="submit" class="input-re" name="submit" value=""/><input class="input-reset" type="reset" name="reset" value=""/>
		</form>
	</div>
  </body>
</html>
