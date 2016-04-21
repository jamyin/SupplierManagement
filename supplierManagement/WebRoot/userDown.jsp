<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	response.setCharacterEncoding("utf-8");
 %>

<%@ page contentType="application/msexcel" %>
<!-- 以上这行设定本网页为excel格式的网页 -->
<%
   //response.setHeader("Content-disposition","inline; filename=user.xls");
   response.setHeader("Content-disposition","attachment; filename=user.xls");
   //以上这行设定传送到前端浏览器时的档名为test1.xls
   //就是靠这一行，让前端浏览器以为接收到一个excel档
%>

<%-- <%@ page contentType="application/msword" %>
<!-- 以上这行设定本网页为word格式的网页 -->
<%
   response.setHeader("Content-disposition","inline; filename=user.doc");
   //以上这行设定传送到前端浏览器时的档名为test1.xls
   //就是靠这一行，让前端浏览器以为接收到一个excel档
%> --%>
 
 
 <!-- PDF格式的不能使用 -->
<%-- <%@ page contentType="application/mspdf" %>
<!-- 以上这行设定本网页为word格式的网页 -->
<%
   response.setHeader("Content-disposition","inline; filename=user.pdf");
   //以上这行设定传送到前端浏览器时的档名为test1.xls
   //就是靠这一行，让前端浏览器以为接收到一个excel档
%> --%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userDown.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <div class="userTable">
  	<table cellpadding="1" border="1" cellspacing="1" width="90%" align="center">
  		<tr>
  			<td>用户编号</td>
  			<td>用户帐号</td>
  			<td>用户密码</td>
  			<td>创建日期</td>
  		</tr>
  		<s:if test="userlist!=null">
  			<s:iterator value="userlist" var="user" status="sta">
  			<tr>
  				<td><s:property value="#user.userId"/></td>
  				<td><s:property value="#user.userName"/></td>
  				<td><s:property value="#user.password"/></td>
  				<td><s:property value="#user.createDate"/></td>
  			</tr>
  			</s:iterator>
  		</s:if>
  	</table>
  	</div>
  </body>
</html>
