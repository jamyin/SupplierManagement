<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page contentType="application/msexcel" %>
<!-- 以上这行设定本网页为excel格式的网页 -->
<%
   //response.setHeader("Content-disposition","inline; filename=user.xls");
   response.setHeader("Content-disposition","attachment; filename=contacter.xls");
   //以上这行设定传送到前端浏览器时的档名为test1.xls
   //就是靠这一行，让前端浏览器以为接收到一个excel档
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'contacterDown.jsp' starting page</title>
    
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
    <table border="1" width="100%" style="text-align: center">
				<tr>
					<th>姓名</th>
					<th>性别</th>
					<th>职务</th>
					<th>手机</th>
					<th>电话</th>
					<!-- <th>传真</th> -->
					<th>邮箱</th>
					<th>登记日期</th>
					<th>单位名称</th>					
				</tr>
				<s:if test="linkmanlist!=null">
					<s:iterator value="linkmanlist" var="linkman" status="sta">
						<tr>
							<td><s:property value="#linkman.linkmanName" />
							</td>
							<td><s:property value="#linkman.linkmanSex" />
							</td>
							<td><s:property value="#linkman.linkmanjob" />
							</td>
							<td><s:property value="#linkman.linkmantelephone " />
							</td>
							<td><s:property value="#linkman.linkmantel" />
							<%-- </td>
							<td><s:property value="#linkman.linkmanfax" />
							</td> --%>
							<td><s:property value="#linkman.linkmanemail" />
							</td>
							<td><s:property value="#linkman.linkmanInDate" />
							</td>
							<td><s:property value="#linkman.linkmanCompany" />
							</td>
						</tr>
					</s:iterator>
				</s:if>
			</table>
  </body>
</html>
