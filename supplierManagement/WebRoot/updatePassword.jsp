<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>供应商管理系统-修改密码</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css" type="text/css"></link>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body >
  <div align="center" class="updatePassword">
  <h2>供应商管理系统-找回密码</h2>
  <form action="findPassword" method="post">
  	<table align="center">
  		<tr>
  			<td>请输入用户帐号：
  			<input type="text" id="" class="input-text" name="name"/></td>
  		</tr>
  		<tr>
  			<td>请输入用户邮箱：
  			<input type="text" id="" class="input-text" name="email"/></td>
  		</tr>
  		
  		<tr>
  			<td align="center"><input type="submit" class="input-button" value="提交"/>&nbsp;<input class="input-button" type="button" value="返回" onclick="javascript:window.location.href='login.jsp'"/></td>
  		</tr>
  		<s:if test="userlist!=null">
  			<s:iterator value="userlist" var="user" status="sta">
  			<tr>
  				<td>您好，用户名为<s:property  value="#user.userName"/>的用户，密码为：<s:property value="#user.password"/></td>
  			</tr>
  			</s:iterator>
  		</s:if>
  		<s:if test="userlist==null">
  			<tr>
  				<td>您好，用户<s:property  value="#name"/>不存在</td>
  			</tr>
  		</s:if>
  	</table>
  </form>
  </div>
  </body>
</html>
