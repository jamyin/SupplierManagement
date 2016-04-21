<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>增加供应商</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
			$(function(){
				$(".pclass").bind('click',function(){
					var proVal = $(this).children(":selected").text();
					var cityVal = $(this).next().children(":selected").text();
				});
				$(".cclass").bind('click',function(){
					var proVal = $(this).prev().children(":selected").text();
					var cityVal = $(this).children(":selected").text();
				});
			});
		var province={
			'请选择':['请选择'],
			'服务':['请选择','筹划','外烩','场地','摄影'],
			'礼品':['请选择','大礼品','小礼品'],
			'食品':['请选择','熟食','冷冻'],
			'公共关系':['请选择','公共关系','政府机构','民间组织','赞助商'],
			};
		
		$(function(){
			//all provinces
			for(var p in province){
				$("<option />",{value:p, text:p}).appendTo("#provinces");
			};
			$(province['请选择']).each(function(i){
				$("<option />",{value:this, text:this}).appendTo("#cities");
			});
			$("#provinces").change(function(){
				$("#cities").html('');//clear city's select
				$(province[this.value]).each(function(j){
					$("<option />",{value:this, text:this}).appendTo("#cities");
				});
			});
		});
		
		function checkAdd(){
			var provinces = document.getElementById("provinces");
			if(provinces.value==""||provinces.value==null){
				alert("供应商类型不能为空！");
				return false;
			}else{
				return true;
			}
		}
	</script>
  </head>
  <body bgcolor="#F7F7F7" style="text-align: center" >
    <!-- 
  	<input type="hidden" id="eno" value="${emp.empno}">
    -->
    <s:form method="post" id="addSupp" action="addSupplier" onclick="return checkAdd()">
    <!-- 
    	<c:if test="${not empty emp }" > 
    		编号:<input name="empno" value="${emp.empno }" readonly="true" style="color:gray;border:3px solid red"><br />
    	</c:if>
    	<c:if test="${empty emp }">
    		编号:<input name="empno"/><br />
    	</c:if>
     -->
        
    	供应商名称:<input name="supplier.supplierName"><br />
    	产品名称:<input name="supplier.productName"><br />
    	联系人:<input name="supplier.contacter">
    	法人代表:<input name="supplier.legalPerson"><br />
                     企业性质:<input name="supplier.companyProperty">
    	联系电话:<input name="supplier.tel"><br />
    	公司传真:<input name="supplier.fax">
    	开户行:<input name="supplier.bank"><br />
    	开户账号:<input name="supplier.bankAccount" ><br />
    	税务登记证号码:<input name="supplier.taxCertificateNo" ><br />
    	供应商食品流通许可证有效期:<input name="supplier.foodCerValidity"><br />
    	供应商生产许可证有效期:<input name="supplier.productCerValidity"><br />
    	第三方质检报告有效期:<input name="supplier.thirdpartyValidity"><br />
    	营业执照号码:<input name="supplier.businessLicense"><br />
    	营业执照有效期:<input name="supplier.busLicenseValidity"><br />
    	组织机构代码证代码:<input name="supplier.institutionCertificate"><br />
    	组织机构代码证有效期:<input name="supplier.institutionValidity"><br />
    	注册资金:<input name="supplier.registeredFund"><br />
    	公司地址:<input name="supplier.companyAddr"><br />
    	公司网站:<input name="supplier.website"><br />
    	公司邮箱:<input name="supplier.email"><br />
    	公司介绍:<input name="supplier.briefIntroduction"><br />
    	专长:<input name="supplier.speciality"><br />
    	服务过的项目:<input name="supplier.servedProject"><br />
    	备注:<input name="supplier.remark"><br />
    	录入日期:<input name="supplier.inputDate"><br />
    	合同订单:<input name="supplier.contractOrder"><br />
    	附件:<input name="supplier.attachment"><br />
    	供应商状态:<input name="supplier.supplierStatus"><br />
    	供应商类型:<select id="provinces" class="pclass" name="supplier.bigSort"></select> <select id="cities" class="cclass" name="supplier.sort"></select> &nbsp;&nbsp;&nbsp;&nbsp;<br>
        <input type="submit" value="提交" onclick=""/>
    	<!--<input type="button" value="返回" onclick="window.open('/mvcProject/WEB-INF/result.jsp')"/>
    	<input type="button" value="返回" onclick="window.location.href='/mvcProject/WEB-INF/result.jsp'"/>-->
    	<input type="button" value="返回" onclick="history.go('-1');"/>
    </s:form>
  </body>
</html>
