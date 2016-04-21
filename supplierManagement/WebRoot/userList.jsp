<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
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
    	//全选按钮
    	/* function chooseAll(){
    		var chooseAll = document.getElementById('chooseAll');
    		var choosebox = document.getElementsByName('choose');
    		if(choseAll.checked){
    			for(var i=0;i<choosebox.length;i++){
    			choosebox[i].checked = 1;
    		} else{
    			for(var i=0;i<choosebox.length;i++){
    			choosebox[i].checked = 0;
    			}
    		} 
    	}
    	} */
    	
    	function chooseAll(){
    		var ckall = document.getElementById('chooseAll');
    		var choice = document.getElementsByName('choose');		  		
    		for(var i=0;i<choice.length;i++){
    			choice[i].checked = ckall.checked;
    		}
    	}
    	
    	//批量删除
     	function deleteUser(){
     		//alert(1)
    		var choose = document.getElementsByName("choose");
    		var deleteId;
    		for(var i=0;i<choose.length;i++){
    			if(choose[i].checked == true){
    				deleteId = choose[i].value;
    				var flag = confirm("您确定要删除记录："+deleteId);
    				if(flag){
    					window.location.href="deleteAction.action?deleteId="+deleteId;
    				}
    			}
    		}
    		if(deleteId == null){
    			alert("请选择要删除的记录！");
    		} 
    	}
    	
    	//修改
    	function updateUser(){
    		var str = document.getElementsByName("choose");
    		var theSize=str.length;
    		var id;
    		for(var i=0;i<theSize;i++){
    			if(str[i].checked == true){
    				id = str[i].value;
    				window.location.href = "clickUpdateUser.action?id="+id;
    			}
    		}
    		if(id == null ){
    			alert("请选择您要修改的记录！");
    		}
    	}
    	
    	//详细
    	function detailUser(){
    		var str = document.getElementsByName("choose");
    		var theSize=str.length;
    		var id;
    		for(var i=0;i<theSize;i++){
    			if(str[i].checked == true){
    				id = str[i].value;
    				window.location.href = "detailUser.action?id="+id;
    			}
    		}
    		if(id == null ){
    			alert("请选择您要查看的记录！");
    		}
    	}
    	
    	//不显示，拉黑
    	function updateFieldUser(){
    		var str = document.getElementsByName("choose");
    		var theSize=str.length;
    		var id;
    		for(var i=0;i<theSize;i++){
    			if(str[i].checked == true){
    				id = str[i].value;
    				//alert(id);
    				var flag = confirm("您确定要删除："+id);
    				if(flag){
    				window.location.href = "updateFileUser.action?id="+id;
    				}
    			}
    		}
    		if(id == null ){
    			alert("请选择您要删除的记录！");
    		}
    	}
    	
    	function allUser(){
    		window.location.href = "allWholeUser.action"
    	}
    	 
	//GoTo跳转页
	function wantGo(totalPageCount){
		var theIndex=document.getElementById("index").value;
		//alert(theIndex);
		//var regexp=/^\d+$/;
		//alert("正则表达式");
		if(isNaN(theIndex)){
			alert("请输入数字！");
		}else if(theIndex>totalPageCount||theIndex<=0){
			alert("没有此页面！");
		}else{
			window.location.href="userAction?index="+theIndex;
		}
		//if (!regexp.test(theIndex)) {
			//alert("请输入正确的数字！");
			//return false;
		//}else if (theIndex < 0||theIndex > =totalPageCount) {
			//alert("没有此页面！");
			//return false;
		//}else{
			//alert("跳转到");
			//window.parent.location.href='userAction?index=theIndex';
		//}
	}
    	
    function willGo(totalPageCount){
    	var theIndex=document.getElementById("index").value;
    	//alert(theIndex);
    	if(isNaN(theIndex)){
			alert("请输入数字！");
		}else if(theIndex>totalPageCount||theIndex<=0){
			alert("没有此页面！");
		}else{
			window.location.href="userAction?index="+theIndex;
		}
    	//window.location.href="userAction?index="+theIndex;
    	
    }
    
    	function page_nav(name,num) {
		window.location = name+".action?page.index=" + num;
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
    	/* .userTable{
    		border:0;
    		margin:0;
    		height: 310px;
    		} */
    </style>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/style.css" />
  </head>
  <body>
  <div class="menu">
  <table>
<tbody><tr>
<!-- <td><form method="post" action="userIdAction">
用户编号：<input name="id" class="input-text" type="text">&nbsp;&nbsp;<input value="查 询" type="submit">
</form></td> -->
	<td class="colour">
	<form method="post" action="userAction">
		用户名称：<input name="name" class="input-text" type="text" value='<s:property value="name"/>' />&nbsp;&nbsp; <input value="查 询" type="submit"/>&nbsp;&nbsp;&nbsp;
	</form></td>
<s:if test="#session.user.permission==0">
<td><input value="添加" onclick="javascript:window.location.href='addUser.jsp'"  type="button">&nbsp;&nbsp;&nbsp;
</td>
<td><input type="button" value="修改" onclick="updateUser()"/>&nbsp;&nbsp;&nbsp;</td>
<td><input type="button" value="删除" onclick="updateFieldUser()"/>&nbsp;&nbsp;&nbsp;</td>
<!-- <td><input type="button" value="删除" onclick="deleteUser()"/>&nbsp;&nbsp;&nbsp;</td> -->
<td><input type="button" value="详细" onclick="detailUser()"/>&nbsp;&nbsp;&nbsp;</td>
<!-- <td><input type="button" value="全部" onclick="allUser()"/></td> -->
</s:if>
<s:if test="#session.user.permission==1">
<td><input value="添加" onclick="window.open ('addUser.jsp', 'newwindow', 'height=500, width=500')" type="button"/>&nbsp;&nbsp;&nbsp;</td>
<td><input type="button" value="详细" onclick="detailUser()"/></td>
</s:if>
</tr>
</tbody></table></div>
<div>
	<!-- <img src="imgs/pdf.png" /><a href="reportaccountepdf.action">当前页用户信息PDF下载</a>
	<img src="imgs/pdf.png" /><a href="reportaccountepdf.action">所有用户信息PDF下载</a> -->
	<img src="imgs/excel1.jpg" /><a href="userDown.action">当前页用户信息Excel下载</a>
	<img src="imgs/excel1.jpg" /><a href="userAllDown.action">所有用户信息Excel下载</a>
</div>
<hr >
	<div class="userTable">
  	<!-- <table cellpadding="1" border="1" cellspacing="1" width="98%" align="center"> -->
  	<table border="1" width="100%" align="center">
  		<tr>
  			<td class="tableTitle"><input type="checkbox" id="chooseAll" onclick="chooseAll()" /></td>
  			<td class="tableTitle" align="center">用户编号</td>
  			<td class="tableTitle" align="center">用户帐号</td>
  			<td class="tableTitle" align="center">用户密码</td>
  			<td class="tableTitle" align="center">创建日期</td>
  			<td class="tableTitle" align="center">用户权限</td>
  			<!-- <td align="center">操作</td> -->
  		</tr>
  		<s:if test="userlist!=null">
  			<s:iterator value="userlist" var="user" status="sta">
  			<s:if test="#user.permission==0">
  				<tr class="userAdmin">
  				<td><input type="checkbox" name="choose" onclick="getChooseId(<s:property value='#user.userId'/>)" value="<s:property value='#user.userId'/>"/></td>
  				<td><s:property value="#user.userId"/></td>
  				<td><s:property value="#user.userName"/></td>
  				<td><s:if test="#session.user.permission==0">
  				<s:property value="#user.password"/>
  				</s:if>
  				<s:else>
  				无权限
  				</s:else></td>
  				<td><s:property value="#user.createDate"/></td>
  				<td>
  				<s:if test="#user.permission==0">
  					管理员
  				</s:if>
  				<s:if test="#user.permission==1">
  					录入员
  				</s:if>
  				<s:if test="#user.permission==2">
  					查询员
  				</s:if>
  				<s:if test="#user.permission==null">
  					查询员
  				</s:if>
  				</td>
  			</tr>
  			</s:if>
  			<s:else>
  				<tr>
  				<td><input type="checkbox" name="choose" value="<s:property value='#user.userId'/>"/></td>
  				<td><s:property value="#user.userId"/></td>
  				<td><s:property value="#user.userName"/></td>
  				<td><s:if test="#session.user.permission==0">
  				<s:property value="#user.password"/>
  				</s:if>
  				<s:else>
  				无权限
  				</s:else></td>
  				<td><s:property value="#user.createDate"/></td>
  				<td>
  				<s:if test="#user.permission==0">
  					管理员
  				</s:if>
  				<s:if test="#user.permission==1">
  					录入员
  				</s:if>
  				<s:if test="#user.permission==2">
  					查询员
  				</s:if>
  				<s:if test="#user.permission==null">
  					查询员
  				</s:if>
  				</td>
  			</tr>
  			</s:else>
  			</s:iterator>
  		</s:if>
  	</table>
  	</div>
  		<br/>
  		<div>
  			<table align="center">
			<tr>
				<s:if test="index>1">
				<td><a class="input-button" href="userAction?index=1">首页</a>
				</td>
				</s:if>
				<s:if test="%{index>1}">
				<td><a class="input-button" href="userAction?index=${index -1}">上一页</a>
				</td>
				</s:if>
				<td>
					<a class="input-index">第<s:property value="index"/>页</a>
				</td>
				<s:if test="%{index<totalPageCount}">
				<td><a class="input-button" href="userAction?index=${index +1}">下一页</a>
				</td>
				</s:if>
				<s:if test="index<totalPageCount">
				<td><a class="input-button" href="userAction?index=${totalPageCount }">尾页</a>
				</td>
				</s:if>
				<td>
					<a class="input-button">共<s:property value="totalPageCount"/>页</a>
				</td>
				<td><input type="text" id="index" size="10" onblur="wantGo(<s:property value="totalPageCount"/>)">
					<input type="button" value="GOTO" onclick="willGo(<s:property value="totalPageCount"/>)">
				</td>
			</tr>
		</table>
  		</div>
  </body>
</html>
