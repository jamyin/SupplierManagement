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
    
    <title>SupplierManagementSystemHead</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    
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
 <div id="header">
	<div class="title"></div>
	<div class="welcome" align="center">欢迎您
		<s:if test="#session.user.permission==0">
		管理员：
		</s:if>
		<s:if test="#session.user.permission==1">
		录入员:
		</s:if>
		<s:if test="#session.user.permission==2">
		操作员:
		</s:if>
		<s:if test="#session.user.permission==null">
		操作员:
		</s:if>
		<s:property value="#session.user.userName"/>
		<%-- <s:property value="#session.user.flag0"/> --%>
		</div>
<%-- 	<div class="welcome">欢迎您：<%=request.getSession().getAttribute("name") %></div> --%>
</div>
  </body>
</html>
