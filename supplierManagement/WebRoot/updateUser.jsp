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
    
    <title>修改用户</title>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	

  </head>
  <%-- <%=request.getParameter("id") %> --%>
  <body onunload="javascript:window.opener.location.reload();window.close()">
  	<h4 align="center">修改用户</h4>
  	<table border="1" align="center"   bordercolor="#AAAAAA">
  	<tr><td>用户编号：</td><td><input type="text" name="user.userId" value="<s:property value='user.userId'/>" readonly="readonly"/></td></tr>
  	<tr><td>用户帐号：</td><td><input type="text" name="user.userName" value="<s:property value='user.userName'/>"/></td></tr>
  	<tr><td>用户密码：</td><td><input type="text" name="user.password" value="<s:property value='user.password'/>"/></td></tr>
  	<tr><td>创建日期：</td><td><input type="text" onclick="WdatePicker()" name="user.createDate" value="<s:property value='user.createDate'/>" /></td></tr>
  	<%-- 用户权限：<input type="text" name="user.permission" value="<s:property value='user.permission'/>"/> --%>
  	<tr><td>用户权限：</td><td><select name="user.permission">
  				<s:if test="user.permission==0">
  				<option value="0">
  					管理员
  				</option>
  				</s:if>
  				<s:if test="user.permission==1">
  				<option value="1">
  					录入员
  				</option>
  				</s:if>
  				<s:if test="user.permission==2">
  				<option value="">
  					查询员
  				</option>
  				</s:if>
  				<option value="0">管理员</option>
  				<option value="1">录入员</option>
  				<option value="2">查询员</option>
  			</select></td></tr>
  	<%-- 用户编号：<input type="text" name="user.userId" value="<%=request.getParameter("id")%>" readonly="readonly"/><br/>
  	用户帐号：<input type="text" name="user.userName" value="<%=request.getParameter("userName") %>"/><br/>
  	用户密码：<input type="text" name="user.password" value="<%=request.getParameter("password") %>"/><br/>
  	创建日期：<input type="text" onclick="WdatePicker()" name="user.createDate" value="<%=request.getParameter("createDate") %>" /><br/> --%>
  	<tr><td colspan="2" align="center"><input type="submit" class="input-button" value="提交" onblur="javascript:window.opener.location.reload();window.close()"/>
  	<input type="reset" class="input-button" value="重置"/><input class="input-button" type="button" value="返回" onclick="javascript:history.go(-1)">
  	</td>
  	</tr>
  	</table>
  </form>
  </body>
</html>
