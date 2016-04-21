<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%@ page contentType="application/msexcel" %>
<!-- 以上这行设定本网页为excel格式的网页 -->
<%
   response.setHeader("Content-disposition","attachment; filename=contract.xls");
   //以上这行设定传送到前端浏览器时的档名为test1.xls
   //就是靠这一行，让前端浏览器以为接收到一个excel档
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'contractDown.jsp' starting page</title>
    
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
  			<!-- <td>合同编号</td> -->
  			<td>供应商</td>
  			<td>合同名称</td>
  			<!-- <td>合同甲方</td>
  			<td>合同已方</td>
  			<td>收付类型</td> -->
  			<td>付款方式</td>
  			<td>交易币种</td>
  			<td>合同总价</td>
  			<!-- <td>登记日期</td> -->
  			<td>签订日期</td>
  			<td>执行日期</td>
  			<!-- <td>截止日期</td> -->
  			<td>合同状态</td>
  			<td>业务员</td>
  			<!-- <td>操作员</td> -->
  			<!-- <td align="center">操作</td> -->
  		</tr>
  		<s:if test="contractList!=null">
  			<s:iterator value="contractList" var="contract" status="sta">
  				<s:if test="#todayTime>=#contract.endDate&&#contract.endDate!=null">
  			<tr class="contractTime">
  				<td><s:property value="#contract.supplierName"/></td>
  				<td><s:property value="#contract.contractName"/></td>
  				<%-- <td><s:property value="#contract.partyA"/></td>
  				<td><s:property value="#contract.partyB"/></td>
  				<td><s:property value="#contract.receiptsPaymentType"/></td> --%>
  				<td><s:property value="#contract.payway"/></td>
  				<td><s:property value="#contract.currency"/></td>
  				<td><s:property value="#contract.contractPrice"/></td>
  				<td><s:property value="#contract.registerDate"/></td>
  				<%-- <td><s:property value="#contract.signDate"/></td> --%>
  				<td><s:property value="#contract.startDate"/></td>
  				<%-- <td><s:property value="#contract.endDate"/></td> --%>
  				<s:if test='#contract.contractState!="合格"'>
  				<td class="contractState"><s:property value="#contract.contractState"/></td>
  				</s:if>
  				<s:else>
  				<td><s:property value="#contract.contractState"/></td>
  				</s:else>
  				<td><s:property value="#contract.operationPerson"/></td>
  				<%-- <td><s:property value="#contract.operator"/></td> --%>
  			</tr>
  			
  				</s:if>
  				
  				<s:else>
  					<tr>
  				<td><s:property value="#contract.supplierName"/></td>
  				<td><s:property value="#contract.contractName"/></td>
  				<%-- <td><s:property value="#contract.partyA"/></td>
  				<td><s:property value="#contract.partyB"/></td>
  				<td><s:property value="#contract.receiptsPaymentType"/></td> --%>
  				<td><s:property value="#contract.payway"/></td>
  				<td><s:property value="#contract.currency"/></td>
  				<td><s:property value="#contract.contractPrice"/></td>
  				<td><s:property value="#contract.registerDate"/></td>
  				<%-- <td><s:property value="#contract.signDate"/></td> --%>
  				<td><s:property value="#contract.startDate"/></td>
  				<%-- <td><s:property value="#contract.endDate"/></td> --%>
  				<s:if test='#contract.contractState!="合格"'>
  				<td class="contractState"><s:property value="#contract.contractState"/></td>
  				</s:if>
  				<s:else>
  				<td><s:property value="#contract.contractState"/></td>
  				</s:else>
  				<td><s:property value="#contract.operationPerson"/></td>
  			</tr>
  				</s:else>
  				
  			</s:iterator>
  		</s:if>
  	</table>
  </body>
</html>
