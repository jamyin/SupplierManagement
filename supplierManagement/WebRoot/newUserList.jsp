<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理</title>
    <script type="text/javascript">
    	function deleteUser(){
    		var flag=confirm("确定删除此用户？");
    		var deleteId=document.getElementById("userId").innerHTML;
    		if(flag){
    		alert(deleteId);
    			window.location.href='deleteAction.action?deleteId=deleteId';
    		}
    	}
    	
    	function page_nav(name,num) {
		window.location = name+".action?page.index=" + num;
	}

	function jump_to(name,pageno, totalPage) {
		var regexp = /^\d+$/;
		if (!regexp.test(pageno)) {
			alert("请输入正确的数字！");
			return false;
		}else if (pageno <= 0||pageno > totalPage) {
			alert("没有此页面！");
			return false;
		} else {
			page_nav(name,pageno);
		}
	}
	
	function testNum(){
		var testNum=document.getElementById("index").value;
		//var regexp=/^\d+$/;
		if(NaN){
			alert("请输入数字！");
			return false;
		}else if(testNum<=0||testNum>totalPageCount){
			alert("无此页面！");
		}
	}
	
	function gotoPage(){
		var testNum=document.getElementById("index").value;
		window.location.href="userAction?index=testNum";
	}
	
    </script>
    <style type="text/css">
    	.userTable{
    		border:0;
    		margin:0;
    		height: 170px;
    		}
    </style>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body>
  <div class="menu">
  <table>
<tbody><tr><td><form method="post" action="userIdAction">
<input name="flag" value="search" class="input-text" type="hidden">
用户编号：<input name="id" class="input-text" type="text">&nbsp;&nbsp;<input value="查 询" type="submit">
</form></td>
<td><form method="post" action="userNameAction">
<input name="flag" value="search" class="input-text" type="hidden">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
用户名称：<input name="name" class="input-text" type="text">&nbsp;&nbsp; <input value="查 询" type="submit">
</form></td></tr>
</tbody></table></div>
  <div class="optitle clearfix">
<em><input value="添加数据" class="input-button" onclick="window.open ('addUser.jsp', 'newwindow', 'height=500, width=500')" type="button"></em>
	</div>
	<div>
	<!-- <img src="imgs/pdf.png" /><a href="reportaccountepdf.action">当前页用户信息PDF下载</a>
	<img src="imgs/pdf.png" /><a href="reportaccountepdf.action">所有用户信息PDF下载</a> -->
	<!-- <img src="imgs/excel.png" /><a href="reportaccounteexcel.action">Excel下载</a> -->
	<img src="imgs/excel.png" /><a href="userDown.action">当前页用户信息Excel下载</a>
	<img src="imgs/excel.png" /><a href="userAllDown.action">所有用户信息Excel下载</a>
	</div>
	<div class="userTable">
  	<table cellpadding="1" border="1" cellspacing="1" width="90%" align="center">
  		<tr>
  			<td>用户编号</td>
  			<td>用户帐号</td>
  			<td>用户密码</td>
  			<td>创建日期</td>
  			<td align="center">操作</td>
  		</tr>
  		<s:if test="userlist!=null">
  			<s:iterator value="userlist" var="user" status="sta">
  			<s:if test="#user.flag0==0">
  				<tr class="userAdmin">
  				<td id="userId"><s:property value="#user.userId"/></td>
  				<td><s:property value="#user.userName"/></td>
  				<td><s:property value="#user.password"/></td>
  				<td><s:property value="#user.createDate"/></td>
  				<td colspan="2">
  					<s:if test="#session.user.flag0==0">
  					<span ><input type="button" onclick="window.open ('updateUser.jsp?id=<s:property value="#user.userId"/>&userName=<s:property value="#user.userName"/>&password=<s:property value="#user.password"/>&createDate=<s:property value="#user.createDate"/>', 'newwindow', 'height=500, width=500')" value="修改"/></span>
  					<a href="deleteAction.action?deleteId=<s:property value='#user.userId'/>"><input onclick="return confirm('您确定要删除')" type="button" value="删除" /></a>
  					<!-- <input type="button" onclick="deleteUser()" value="删除"/> -->
  					</s:if>
  				</td>
  			</tr>
  			</s:if>
  			<s:else>
  				<tr>
  				<td id="userId"><s:property value="#user.userId"/></td>
  				<td><s:property value="#user.userName"/></td>
  				<td><s:property value="#user.password"/></td>
  				<td><s:property value="#user.createDate"/></td>
  				<td colspan="2">
  					<s:if test="#session.user.flag0==0">
  					<span ><input type="button" onclick="window.open ('updateUser.jsp?id=<s:property value="#user.userId"/>&userName=<s:property value="#user.userName"/>&password=<s:property value="#user.password"/>&createDate=<s:property value="#user.createDate"/>', 'newwindow', 'height=500, width=500')" value="修改"/></span>
  					<a href="deleteAction.action?deleteId=<s:property value='#user.userId'/>"><input onclick="return confirm('您确定要删除')" type="button" value="删除" /></a>
  					<!-- <input type="button" onclick="deleteUser()" value="删除"/> -->
  					</s:if>
  				</td>
  			</tr>
  			</s:else>
  			</s:iterator>
  		</s:if>
  		<s:if test="user!=null">
  			<s:iterator value="user" var="user" status="sta">
  			<tr>
  				<td><s:property value="#user.userId"/></td>
  				<td><s:property value="#user.userName"/></td>
  				<td><s:property value="#user.password"/></td>
  				<td><s:property value="#user.createDate"/></td>
  				<td colspan="2">
  					<s:if test="#session.user.flag0==0">
  					<input type="button" onclick="window.open ('updateUser.jsp?id=<s:property value="#user.userId"/>&userName=<s:property value="#user.userName"/>&password=<s:property value="#user.password"/>&createDate=<s:property value="#user.createDate"/>', 'newwindow', 'height=500, width=500',scrollbars=yes, resizable=yes)" value="修改"/>
  					<%-- <a href="deleteAction.action?deleteId=<s:property value='#user.userId'/>" title="删除" onclick="confirm('您确定要删除')"></a> --%>
  					<a href="deleteAction.action?deleteId=<s:property value='#user.userId'/>" title="删除" onclick="deleteUser()"></a>
  					</s:if>
  				</td>
  			</tr>
  			</s:iterator>
  		</s:if>
  	</table>
  	</div>
  		<br/>
  		<div>
  			<table align="center">
			<tr>
				<s:if test="index>1">
				<td><a class="input-button"
					href="userAction?index=1">首页</a>
				</td>
				</s:if>
				<s:if test="%{index>1}">
				<td><a class="input-button"
					href="userAction?index=${index -1}">上一页</a>
				</td>
				</s:if>
				<td class="input-index">第<s:property value="index"/>页</td>
				<s:if test="%{index<totalPageCount}">
				<td><a class="input-button"
					href="userAction?index=${index +1}">下一页</a>
				</td>
				</s:if>
				<s:if test="index<totalPageCount">
				<td><a class="input-button"
					href="userAction?index=${totalPageCount }">尾页</a>
				</td>
				</s:if>
				<td class="input-button">共<s:property value="totalPageCount"/>页</td>
				<td><input type="text" id="index" value="2" onblur="testNum()"><input
					type="button" value="GOTO" onblur="gotoPage()">
				</td>
			</tr>
		</table>
  		</div>
  </body>
</html>
