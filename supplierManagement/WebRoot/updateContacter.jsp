<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <base href="<%=basePath%>">  
    <title>修改联系人</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link type="text/css" rel="stylesheet" href="css/style.css" /> 
  </head>
  <body bgcolor="#F7F7F7" style="text-align: center" onunload="">
    <!-- 
  	<input type="hidden" id="eno" value="${emp.empno}">
    -->
    <s:form method="post" id="updatecontacter" action="updateContacter">
       <!--  <div style="border:1px solid red; width:600px;margin-left:40px;"> -->
    	<!-- <table cellpadding="1" border="1" cellspacing="1" bgcolor="#FFFFFF" style="color: black"> -->
    	<h4>修改联系人</h4>
    	<table  border="1"  bgcolor="#FFFFFF" style="color: black" bordercolor="#AAAAAA">
    	<s:hidden name="linkman.linkmanNo"></s:hidden>
        <tr><td>供应商:</td><td  colspan="3">
        <select id="suppid" name="linkman.supplier.supplierId" style="width: 320px" title="选择供应商" >
    	<option><s:property value="linkman.supplier.supplierName"/></option>
        <s:if test="list!=null">
        <s:iterator value="list" var="supplier" status="sta">
        <option value="<s:property value="#supplier.supplierId"/>"> 
        <s:property value="#supplier.supplierName"/> </option></s:iterator>
        </s:if>        </td></tr> 
    	<tr><td>姓名:</td><td><s:textfield name="linkman.linkmanName"/></td><td>性别:</td><td><s:select label="性别" name="linkman.linkmanSex" list="{'男','女'}" ></s:select></td></tr>
    	<tr><td>职务:</td><td><s:textfield name="linkman.linkmanjob"/></td><td>手机:</td><td><s:textfield name="linkman.linkmantelephone"/></td></tr>
    	<tr><td>电话:</td><td><s:textfield name="linkman.linkmantel"/></td><td>传真:</td><td><s:textfield name="linkman.linkmanfax"/></td></tr>
    	<tr><td>邮箱:</td><td><s:textfield name="linkman.linkmanemail"/></td><td>登记日期:</td><td><input name="linkman.linkmanInDate" onclick="WdatePicker()" value="<s:property value="linkman.linkmanInDate"/>"/></td></tr>
    	</table>
    	<!-- </div> -->
    	<br>
    	<input class="input-button" type="submit" value="修改" >
    	<input class="input-button" type="button" value="返回" onclick="history.go('-1');"/>
    </s:form>
  </body>
</html>
