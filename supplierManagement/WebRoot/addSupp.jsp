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
    <base href="<%=basePath%>">  
    <title>增加供应商</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	var addContracter =function(){
//	alert("&");
/* 	window.open("addContacter.action"); 
    window.location.href="/supplierManagement/addContacter"; */
    window.open("/supplierManagement/addLinkman.jsp");
	}
	var checkSupplier= function(){
	//JS区分大小写
	var supplierID= document.getElementById("supplierId").value;
	if(supplierID==""){
	alert("请输入供应商！");  
	return false;
	}else{
	return true;
	}
	}
	</script>
  </head>
  <body bgcolor="#F7F7F7" style="text-align: center" >
    <!--   	<input type="hidden" id="eno" value="${emp.empno}">    -->
    <% String linkmanName=request.getParameter("linkmanName");out.print(linkmanName); %>
    <s:property value="#linkman.linkmanName" />
    <s:form method="post" id="addSupp" action="addSupplier" onsubmit="checkSupplier()">
        <div style="border:1px solid red; width:1100px;margin-left:100px;">
    	<table cellpadding="1" border="1" cellspacing="1" bgcolor="#FFFFFF" style="color: black">
        <tr><td>供应商名称:</td><td colspan="3"><s:textfield name="supplier.supplierName" id="supplierId"/></td></tr>
    	<tr><td>产品名称:</td><td  colspan="3"><s:textfield name="supplier.productName"/></td></tr>
    	<tr><td>联系人:<input type="button" value="添加详细" onclick="addContracter()"/></td><td><s:textfield name="supplier.contacter"/></td><td>法人代表：</td><td><s:textfield name="supplier.legalPerson"/></td></tr>
    	<tr><td>企业性质:</td><td><s:textfield name="supplier.companyProperty"/></td><td>联系电话:</td><td><s:textfield name="supplier.tel"/></td></tr>
    	<tr><td>公司传真:</td><td><s:textfield name="supplier.fax"/></td><td>开户行:</td><td><s:textfield name="supplier.bank"/></td></tr>
    	<tr><td>开户账号:</td><td><s:textfield name="supplier.bankAccount"/></td><td>税务登记证号码:</td><td><s:textfield name="supplier.taxCertificateNo"/></td></tr>
    	<tr><td>供应商食品流通许可证有效期:</td><td><s:textfield name="supplier.foodCerValidity"/></td><td>供应商生产许可证有效期:</td><td><s:textfield name="supplier.productCerValidity"/></td></tr>
    	<tr><td>第三方质检报告有效期:</td><td><s:textfield name="supplier.thirdpartyValidity"/></td><td>营业执照号码:</td><td><s:textfield name="supplier.businessLicense"/></td></tr>
    	<tr><td>营业执照有效期:</td><td><s:textfield name="supplier.busLicenseValidity"/></td><td>组织机构代码证代码:</td><td><s:textfield name="supplier.institutionCertificate"/></td></tr>
    	<tr><td>组织机构代码证有效期:</td><td><s:textfield name="supplier.institutionValidity"/></td><td>注册资金:</td><td><s:textfield name="supplier.registeredFund"/></td></tr>
    	<tr><td>公司地址:</td><td><s:textfield name="supplier.companyAddr"/></td><td>公司网站:</td><td><s:textfield name="supplier.website"/></td></tr>
    	<tr><td>公司邮箱:</td><td><s:textfield name="supplier.email"/></td><td>公司介绍:</td><td><s:textfield name="supplier.briefIntroduction"/></td></tr>
    	<tr><td>专长:</td><td><s:textfield name="supplier.speciality"/></td><td>服务过的项目:</td><td><s:textfield name="supplier.servedProject"/></td></tr>
    	<tr><td>备注:</td><td><s:textfield name="supplier.remark"/></td><td>录入日期:</td><td><s:textfield name="supplier.inputDate"/></td></tr>
    	<tr><td>合同订单:<input type="button" value="添加详细"/></td><td><s:textfield name="supplier.contractOrder"/></td><td>附件:</td><td><s:textfield name="supplier.attachment"/></td></tr>
    	<tr><td>供应商状态:</td><td><s:textfield name="supplier.supplierStatus"/></td>
    	</table>
    	</div>
    	<br>
    	<input type="submit" value="提交" >
    	<input type="button" value="返回" onclick="history.go('-1');"/>
    </s:form>
  </body>
</html>
