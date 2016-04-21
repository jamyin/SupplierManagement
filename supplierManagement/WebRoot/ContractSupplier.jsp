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
    
    <title>My JSP 'supplier.jsp' starting page</title>
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
  <body >
  	<%-- <table cellpadding="1" border="1" cellspacing="1">
		<tr>
			<td rowspan="<s:property value="#supplierlist.size()"/>">所有供应商</td>
			<a href="goodsIdAction.action" name="supplierId"><td>供应商编号</td></a>
			<a href="goodsNameAction.action" name="supplierName"><td>供应商名称</td></a>
			<a href="goodsNameAction.action" name="supplierName"><td>供应商食品</td></a>
		</tr>
		<s:if test="supplierlist!=null">
			<s:iterator value="supplierlist" var="supplier" status="sta">
		<tr>
			<a href="goodsIdAction.action" name="supplierId"><td><s:property value="#supplier.supplierId"/></td></a>
			<a href="goodsNameAction.action" name="supplierName"><td ><s:property value="#supplier.supplierName"/></td></a>
			<a href="productNameAction.action" name="productName"><td ><s:property value="#supplier.productName"/></td></a>
		</tr>
			</s:iterator>
		</s:if>
	</table> --%>
  <table cellpadding="1" border="1" cellspacing="1">
  	<tr>
  		<td>
		<ul class="left-menu">
			<!-- <li><frame src="index.jsp" target="mainFrame"></frame></li> -->
			<li><a href="goodsAction.action" name="supplierId" target="mainFrame"><h3>供应商名称</h3></a></li>
		<s:if test="supplierlist!=null">
			<s:iterator value="supplierlist" var="supplier" status="sta">
			<li><a href="goodsAction.action" name="supplierName" target="mainFrame"><s:property value="#supplier.supplierName"/></a><li>
			</s:iterator>
		</s:if>
	 	</ul>
	 	</td>
	 </tr>
	</table>
  </body>
</html>
