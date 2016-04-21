<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%@taglib uri="/struts-tags" prefix="s"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>联系人列表</title>
<script type="text/javascript">
    
    	var choose = function(){
    		var ckall = document.getElementById('ckall');
    		var choice = document.getElementsByName('choice');		  		
    		for(var i=0;i<choice.length;i++){
    			choice[i].checked = ckall.checked;
    		}
    	}
    	var subForm_del = function(){
    		var choice = document.getElementsByName('choice');
    		//alert(choice.length);
    		var flag = false;
    		for(var i=0;i<choice.length;i++){
    			if(choice[i].checked==true){
    				flag = true;
    				break;
    			}
    		}
    		if(flag){
    			var bool = confirm('你真心要删除吗？');
	    		if(bool){
	    			document.getElementById('linkman').submit();
	    		}
    		}else{
    			alert('请选择要删除的项');
    		}
    		
    	}
    	    var subForm_modify = function(){
    		var choice = document.getElementsByName('choice');
            var flag = false;
            var id=0;
    		for(var i=0;i<choice.length;i++){
    			if(choice[i].checked==true){
    			flag = true;
    			id=choice[i].value;
    			//window.location.href="findcontacterByID?linkmanNo="+id;
    			break;
    			}
    		}
    		if(flag){
    		window.location.href="findcontacterByID?linkmanNo="+id;
    		}else{
    		    alert('请选择要修改的项');
    		}
    		
    			//alert('请选择要删除的项');
    	}
    	
    	var subForm_detaile = function(){
    			var choice = document.getElementsByName('choice');
            var flag = false;
            var id=0;
    		for(var i=0;i<choice.length;i++){
    			if(choice[i].checked==true){
    			flag = true;
    			id=choice[i].value;
    			//window.location.href="findcontacterByID?linkmanNo="+id;
    			break;
    			}
    		}
    		if(flag){
    		//window.location.href="contacterDetaileList.jsp";
    		window.location.href="findcontacterDetaile?linkmanNo="+id;
    		}else{
    		    alert('请选择要查看的项');
    		}
    	}
    	
    	var subForm_add = function(){
    	window.location.href="addLinkman";
    	}
    	var checkFrm = function(){
    		//isNaN()//判断非数
    		if(isNaN(parseInt(document.getElementsByName('empno')[0].value)) && document.getElementsByName('empno')[0].value.length!=0){
    			alert('请输入数字');
    			document.getElementsByName('empno')[0].focus();
    			document.getElementsByName('empno')[0].select();
    			
    			return false;
    		}
    		return true;
    	}
    	window.onload = function(){
    		var msg=document.getElementById('msg');
    		if(msg.value!='' && msg.value!=null){
    			alert(msg.value);
    		}
    	}
    	
    	//跳转页面
    	function wantGo(totalPageCount){
    		var theIndex = document.getElementById("index").value;
    		if(isNaN(theIndex)){
    			alert("请输入数字！");
    		}else if(theIndex>totalPageCount||theIndex<=0){
    			alert("没有此页面！");
    		}else{
    			window.location.href = "getContacterList.action?index="+theIndex;
    		}
    	}
    	function willGo(totalPageCount){
    		var theIndex = document.getElementById("index").value;
    		if(isNaN(theIndex)){
    			alert("请输入数字！");
    		}else if(theIndex>totalPageCount||theIndex<=0){
    			alert("没有此页面！");
    		}else{
    			window.location.href = "getContacterList.action?index="+theIndex;
    		}
    	}
    </script>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link type="text/css" rel="stylesheet" href="css/style.css" />
</head>
<body>
 <div class="menu">
 <%-- <s:form action="findContacterByName" method="post" > --%>
 <s:form action="getContacterList" method="post">
                      姓名：<input name="linkmanName" value="${linkmanName}"/>  供应商：<input name="supplierName" value="${supplierName}"/>
		<s:submit value="查询" />&nbsp;&nbsp;
			<s:if test="#session.user.permission==0">
			<!-- <input type="button" value="添加"	onclick="window.open('/supplierManagement/addLinkman.jsp','newwindow', 'height=500, width=800')" />  -->
			<input type="button" value="添加"	onclick="subForm_add()" /> &nbsp;&nbsp;
			<input	type="button" value="修改" onclick="subForm_modify()" />&nbsp;&nbsp;
			<input	type="button" value="删除" onclick="subForm_del()" />&nbsp;&nbsp;
			</s:if>
			<s:if test="#session.user.permission==1">
			<input type="button" value="添加"	onclick="subForm_add()" /> &nbsp;&nbsp;
			</s:if>
			<input	type="button" value="详细" onclick="subForm_detaile()" />
		
		</s:form>
 </div>
<div>
	<!-- <img src="imgs/pdf.png" /><a href="reportaccountepdf.action">当前页联系人信息PDF下载</a>
	<img src="imgs/pdf.png" /><a href="reportaccountepdf.action">所有联系人信息PDF下载</a> -->
	<!-- <img src="imgs/excel.png" /><a href="reportaccounteexcel.action">Excel下载</a> -->
	<img src="imgs/excel1.jpg" /><a href="contacterDown.action">当前页联系人信息Excel下载</a>
	<img src="imgs/excel1.jpg" /><a href="contacterAllDown.action">所有联系人信息Excel下载</a>
	</div>
    <hr>
<!-- 	<div style="border:1px solid red; width:1000px;margin-left:50px;"> -->
<%-- 	    <s:hidden id="msg" value="#message">#msg</s:hidden>  --%>
  	        <input type="hidden" id="msg" value="${message}"> 
		<s:form id="linkman" action="deleteContacter" method="post">
			<table border="1" width="100%" align="center">
				<tr>
                    <th class="tableTitle"><input type="checkbox" id="ckall" onclick="choose();"/></th> 
					<th class="tableTitle">姓名</th>
					<th class="tableTitle">性别</th>
					<th class="tableTitle">职务</th>
					<th class="tableTitle">手机</th>
					<th class="tableTitle">电话</th>
					<!-- <th>传真</th> -->
					<th class="tableTitle">邮箱</th>
					<th class="tableTitle">登记日期</th>
					<th class="tableTitle">供应商</th>					
				</tr>
				<s:if test="linkmanlist!=null">
					<s:iterator value="linkmanlist" var="linkman" status="sta">
						<tr>
							<%-- <td><s:checkbox name="choice" value="#linkman.linkmanID" />
							</td> --%>
							<td><input type="checkbox" name="choice" value="${linkman.linkmanNo}" />
							</td> 
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
							<td><s:property value="#linkman.supplier.supplierName" />
							</td>
						</tr>
					</s:iterator>
				</s:if>
			</table>
		</s:form>

	</div>
	<br/>
	<div>
  	<table align="center">
		<tr>
			<s:if test="index>1">
			<td><a class="input-button"
					href="getContacterList?index=1">首页</a>
			</td>
			</s:if>
			<s:if test="index>1">
			<td><a class="input-button"
					href="getContacterList?index=${index -1}">上一页</a>
			</td>
			</s:if>
			<td>
				<a class="input-index">第<s:property value="index"/>页</a>
			</td>
			<s:if test="index<totalPageCount">
			<td><a class="input-button"
					href="getContacterList?index=${index +1}">下一页</a>
			</td>
			</s:if>
				<s:if test="index<totalPageCount">
				<td><a class="input-button"
					href="getContacterList?index=${totalPageCount }">尾页</a>
				</td>
				</s:if>
				<td>
					<a class="input-button">共<s:property value="totalPageCount"/>页</a>
				</td>
				<td><input type="text" id="index" size="10" onblur="wantGo(<s:property value="totalPageCount"/>)" name="index">
				<input type="button" value="GOTO" onclick="willGo(<s:property value="totalPageCount"/>)">
				</td>
			</tr>
		</table>
		</div>
</body>
</html>
