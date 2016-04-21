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
   response.setHeader("Content-disposition","attachment; filename=supplier.xls");
   //以上这行设定传送到前端浏览器时的档名为test1.xls
   //就是靠这一行，让前端浏览器以为接收到一个excel档
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'downSupplier.jsp' starting page</title>
    
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
					<th>供应商名称</th>
					<th>产品名称</th>
					<th>联系人</th>
					<th>法人代表</th>
					<th>企业性质</th>
					<th>联系电话</th>
					<th>公司传真</th>
					<th>开户行</th>
					<th>开户账号</th>
					<th>税务登记证号码</th>
					<th>供应商食品流通许可证有效期</th>
					<th>供应商生产许可证有效期</th>
					<th>第三方质检报告有效期</th>
					<th>营业执照号码</th>
					<th>营业执照有效期</th>
					<th>组织机构代码证代码</th>
					<th>组织机构代码证有效期</th>
					<th>注册资金</th>
					<th>公司地址</th>
					<th>公司网站</th>
					<th>公司邮箱</th>
					<th>公司介绍</th>
					<th>专长</th>
					<th>服务过的项目</th>
					<th>备注</th>
					<th>录入日期</th>
					<th>合同订单</th>
					<th>附件</th>
					<th>供应商状态</th>
				</tr>
				<s:if test="supplierlist!=null">
					<s:iterator value="supplierlist" var="supplier" status="sta">
						<tr>
							<%-- <td><s:checkbox name="choice" value="#supplier.supplierID" />
							</td> --%>
							</td> 
							<td><s:property value="#supplier.supplierName"/>
							</td>
							<td><s:property value="#supplier.productName" />
							</td>
							<td><s:property value="#supplier.contacter" />
							</td>
							<td><s:property value="#supplier.legalPerson " />
							</td>
							<td><s:property value="#supplier.companyProperty" />
							</td>
							<td><s:property value="#supplier.tel"/>
							</td>
							<td><s:property value="#supplier.fax" />
							</td>
							<td><s:property value="#supplier.bank" />
							</td>
							<td><s:property value="#supplier.bankAccount" />
							</td>
							<td><s:property value="#supplier.taxCertificateNo" />
							</td>
							<td><s:property value="#supplier.foodCerValidity" />
							</td>
							<td><s:property value="#supplier.productCerValidity" />
							</td>
							<td><s:property value="#supplier.thirdpartyValidity" />
							</td>
							<td><s:property value="#supplier.businessLicense" />
							</td>
							<td><s:property value="#supplier.busLicenseValidity" />
							</td>
							<td><s:property value="#supplier.institutionCertificate" />
							</td>
							<td><s:property value="#supplier.institutionValidity" />
							</td>
							<td><s:property value="#supplier.registeredFund" />
							</td>
							<td><s:property value="#supplier.companyAddr" />
							</td>
							<td><s:property value="#supplier.website" />
							</td>
							<td><s:property value="#supplier.email" />
							</td>
							<td><s:property value="#supplier.briefIntroduction" />
							</td>
							<td><s:property value="#supplier.speciality" />
							</td>
							<td><s:property value="#supplier.servedProject" />
							</td>
							<td><s:property value="#supplier.remark" />
							</td>
							<td><s:property value="#supplier.inputDate" />
							</td>
							<td><s:property value="#supplier.contractOrder" />
							</td>
							<td><s:property value="#supplier.attachment" />
							</td>
							<td><s:property value="#supplier.supplierStatus" />
							</td>
						</tr>
					</s:iterator>
				</s:if>
			</table>
  </body>
</html>
