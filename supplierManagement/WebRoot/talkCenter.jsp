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
    
    <title>My JSP 'talkCenter.jsp' starting page</title>
    
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
  <h2 align="center">供应商管理系统交流中心</h2>
  <div>
  <div>
  <ul>
  	<li><s:property value="#session.user.userName"/></li>
  	<li>说说</li>
  	<li>日志</li>
  	<li>图片</li>
  </ul>
  </div>
  <div>
  	<p>
  		<from>
  			<input type="text" value="" size="60"/><input type="submit" value="发表"/>
  		</from>
  	</p>
  	<table>
  		<s:if test="">
  		<s:iterator>
  		<tr>
  		<td>
  		<input type="text" value='<s:property value="#moodtalk.sysuser.userName"/>'/><br>
  		<textarea rows="" cols="" value=""><s:property value="#moodtalk.mood"/></textarea>
  		</td>
  		</tr>
  		</s:iterator>
  		</s:if>
  	</table>
  		<from>
  			<input type="hidden" value='<s:property valu="#session.user.userName"/>' name="logtable.userName"/><br/>
  			请输入标题：<input type="text" value="" name="logtable.title"/><br/>
  			正文：<textarea rows="" cols="" name="logtable.content"></textarea><br/>
  			<input type="submit" value="发表"/>
  		</from>
  	<table>
  		<s:if test="">
  		<s:iterator>
  		<tr>
  			<td>userName</td>
  			<td><textarea rows="" cols=""></textarea></td>
  		</tr>
  		</s:iterator>
  		</s:if>
  	</table>
  </div>
  </div>
  </body>
</html>
