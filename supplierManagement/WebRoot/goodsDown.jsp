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
   response.setHeader("Content-disposition","attachment; filename=goods.xls");
   //以上这行设定传送到前端浏览器时的档名为test1.xls
   //就是靠这一行，让前端浏览器以为接收到一个excel档
%>

<%
	response.setCharacterEncoding("utf-8");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsDown.jsp' starting page</title>
    
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
    <table cellpadding="1" border="1" cellspacing="1" width="98%" align="center">
  		<tr>
  			<td>商品编号</td>
  			<td>商品名称</td>
  			<td>商品规格</td>
  			<td>生产厂家</td>
  			<td>厂家税务登记证</td>
  			<td>厂家组织机构代码证</td>
  			<td>厂家营业执照有效期</td>
  			<td>厂家生产许可证有效期</td>
  			<td>厂家第三方质检报告有效期</td>
  		</tr>
  		<s:if test="goodslist!=null">
  			<s:iterator value="goodslist" var="product" status="sta">
  			<tr>
  				<td><s:property value="#product.productId"/></td>
  				<td><s:property value="#product.productName"/></td>
  				<td><s:property value="#product.standard"/></td>
  				<td><s:property value="#product.manufacturer"/></td>
  				<td><s:property value="#product.taxCertificate"/></td>
  				<td><s:property value="#product.institutionCertificate"/></td>
  				<%-- <td><s:property value="#product.institutionCertificate"/></td>tax税务登记证 --%>
  				<td><s:property value="#product.busLicenseValidity"/></td>
  				<td><s:property value="#product.productCerValidity"/></td>
  				<td><s:property value="#product.thirdpartyValidity"/></td>
  			</tr>
  			</s:iterator>
  		</s:if>
  	</table>
  </body>
</html>
