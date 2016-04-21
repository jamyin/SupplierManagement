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
    
    <title>添加用户</title>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body onunload="javascript:window.opener.location.reload();window.close()">
  <!-- 获取当前时间 ，格式为xxxx-xx-xx -->
	<s:set name="todayTime" value="new java.sql.Date(new java.util.Date().getTime()).toString()"></s:set>
		<h4 align="center">添加用户</h4>
	    <table border="1" align="center"  bgcolor="#FFFFFF" style="color: black" bordercolor="#AAAAAA">
   		<tr><td>用户帐号：</td><td><input type="text" name="user.userName"/></td></tr>
   		<tr><td>用户密码：</td><td><input type="password" name="user.password" /></td></tr>
   		<tr><td>添加日期：</td><td><input type="text" name="user.createDate" onClick="WdatePicker()"  value="<s:property value='#todayTime'/>"/></td></tr>
   		<input type="hidden" name="user.flag0" value="0"/>
   		<tr><td>用户权限：</td><td><select name="user.permission">
   		<option value="2">请选择</option>
   		<option value="0">管理员</option>
   		<option value="1">录入员</option>
   		<option value="2">查询员</option>
   		</select></td></tr>
   		<tr><td colspan="2" align="center"><input type="submit" value="添加"  class="input-button" onblur="javascript:window.opener.location.reload();window.close();"/>
   		<!-- <input class="input-button" type="reset" value="重置"/>&nbsp; --><input class="input-button" type="button" value="返回" onclick="javascript:history.go(-1)"/></td></tr>
   		</table>
   </form>
  </body>
</html>
