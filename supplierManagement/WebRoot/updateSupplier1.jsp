<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>修改供应商</title>
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
 	<link type="text/css" rel="stylesheet" href="css/jam_style.css" /> 
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
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
			'服务':['请选择','筹划','外烩','场地','摄影'],
			'礼品':['请选择','礼品'],
			'食品':['请选择','食品'],
			'公共关系':['请选择','媒体','政府机构','民间组织','赞助商'],
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
			var supplier= document.getElementById("supplierId").value;
			var provinces = document.getElementById("provinces").value;
			var cities = document.getElementById("cities").value;
			//alert(provinces+cities);
			if(provinces==""||provinces==null||provinces=="请选择"){
				alert("请选择一级供应商！");
				return false;
			}
			if(cities==""||cities==null||cities=="请选择"){
				alert("请选择二级供应商！");
				return false;
			}
			if(supplier==""||supplier==null){
				alert("请输入供应商！");  
	           	return false;
			}else{
				return true;
			}
		}
	
	var addContracter =function(){
//	alert("&");
/* 	window.open("addContacter.action"); 
    window.location.href="/supplierManagement/addContacter"; */
    window.open("/supplierManagement/addLinkman.jsp");
	}
	</script>
	<style type="text/css">
		#provinces{width: 280px;}
		#cities{width: 280px;}
	</style>
  </head>
  <body bgcolor="#F7F7F7" style="text-align: center" >
    <!--   	<input type="hidden" id="eno" value="${emp.empno}">    -->
    <s:form method="post" id="updateSupplier" action="updateSupplier">
<table width="894" height="395" border="1">
<tr>
  	<td>
  	供应商类型
  	</td>
  	<td colspan="5">
  	<select id="provinces" class="pclass" name="supplier.bigSort"> <option value="<s:property value="supplier.bigSort"/>"><s:property value="supplier.bigSort"/></option></select>
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	<select id="cities" class="cclass" name="supplier.sort"><option value="<s:property value="supplier.sort"/>"><s:property value="supplier.sort"/></option></select>
  	</td>
  </tr>
  <tr>
   <s:hidden name="supplier.supplierId" ></s:hidden>
    <td width="147" height="28">公司名称（全称）</td>
    <td height="25" colspan="3" ><s:textfield size="60" name="supplier.supplierName"/></td>
    <td width="122" height="25">来访日期</td>
    <td width="158" height="25"><%-- <s:textfield name="supplier.inputDate" /> --%>
    <input name="supplier.inputDate" type="text" size="18" onclick="WdatePicker()" value="<s:property value="supplier.inputDate"/>"/>
    </td>
  </tr>
  <tr>
    <td height="28">联系人</td>
    <td width="145"><s:textfield name="supplier.contacter"/></td>
    <td width="133">联系电话</td>
    <td width="149"><s:textfield name="supplier.tel"/></td>
    <td width="122">公司传真</td>
    <td width="158"><s:textfield name="supplier.fax"/></td>
  </tr>
  <tr>
    <td height="28">公司邮箱</td>
    <td><s:textfield name="supplier.email"/></td>
    <td>公司网址</td>
    <td><s:textfield name="supplier.website"/></td>
    <td>所属行业</td>
    <td><select name="supplier.industry" >
        <option value="<s:property value="supplier.industry"/>"><s:property value="supplier.industry"/></option>
        <option value="制造业">制造业</option>
        <option value="批发零售业">批发零售业</option>
        <option value="餐饮业">餐饮业</option>
        <option value="交通运输业">交通运输业</option>
        <option value="软件信息业">软件信息业</option>
        <option value="租赁商务服务业">租赁商务服务业</option>
        <option value="文化娱乐业">文化娱乐业</option>
        <option value="建筑业">建筑业</option>
        <option value="其他">其他</option> 
      </select></td> </tr>
  <tr>
    <td height="28">联系地址</td>
    <td colspan="3"><s:textfield name="supplier.companyAddr" size="60"/></td>
    <td>供应商状态</td>
     <td><select name="supplier.supplierStatus">
        <option value="<s:property value="supplier.supplierStatus"/>"><s:property value="supplier.supplierStatus"/></option>
        <option value="合格">合格</option>
        <option value="不合格">不合格</option>
        <option value="待审核">待审核</option>
      </select></td>
  </tr>
  <tr>
    <td height="28">法人代表</td>
    <td><s:textfield name="supplier.legalPerson"/></td>
    <td>注册资金</td>
    <td><select name="supplier.registeredFund">
        <option value="<s:property value="supplier.registeredFund"/>"><s:property value="supplier.registeredFund"/></option>
        <option value="<10万"><10万</option>
        <option value="10万-50万">10万-50万</option>
        <option value="50万-100万">50万-100万</option>
        <option value="100万-1000万">100万-1000万</option>
        <option value="1000万-1亿">1000万-1亿</option>
        <option value=">1亿">>1亿</option>
      </select></td>
    <td>品牌名称</td>
    <td><s:textfield name="supplier.brandName"/></td>
  </tr>
  <tr>
    <td height="28">企业规模</td>
    <td><select name="supplier.companySize">
        <option value="<s:property value="supplier.companySize"/>"><s:property value="supplier.companySize"/></option>
        <option value="<10人"><10人</option>
        <option value="10人-50人">10人-50人</option>
        <option value="50人-100人">50人-100人</option>
        <option value="100人-500人">100人-500人</option>
        <option value="500人以上">500人以上</option>
      </select></td>  
       <td>年营业额</td>
    <td><select name="supplier.turnover">
        <option value="<s:property value="supplier.turnover"/>"><s:property value="supplier.turnover"/></option>
        <option value="<50万"><50万</option>
        <option value="50万-100万">50万-100万</option>
        <option value="100万-300万">100万-300万</option>
        <option value="300万-500万">300万-500万</option>
        <option value="500万-1000万">500万-1000万</option>
        <option value=">1000万">>1000万</option>
      </select></td>    
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>资源优势</td>
    <td colspan="5"><s:textarea name="supplier.advantage" rows="3" cols="80"/></td>
  </tr>
  <tr>
    <td height="50">专长业务</td>
    <td colspan="5"><s:textarea name="supplier.speciality" rows="3" cols="80"/></td>
  </tr>
  <tr>
    <td height="50">覆盖区域</td>
    <td colspan="5"><s:textarea name="supplier.area" rows="3" cols="80"/></td>
  </tr>
  <tr>
    <td height="50">经典案例/重要客户</td>
    <td colspan="5"><s:textarea name="supplier.classicCase" rows="3" cols="80"/></td>
  </tr>
  <tr>
    <td height="50">其他平台合作情况</td>
    <td colspan="5"><s:textarea name="supplier.cooperation" rows="3" cols="80"/></td>
  </tr>
  <tr>
    <td height="28" colspan="2">营业执照编号</td>
    <td><s:textfield name="supplier.businessLicense"/></td>
    <td colspan="2">营业执照有效期</td>
    <td><input name="supplier.busLicenseValidity" type="text" size="18" onclick="WdatePicker()" value="<s:property value="supplier.busLicenseValidity"/>"/></td>
  </tr>
  <tr>
    <td height="28" colspan="2">组织机构代码证编号</td>
    <td><s:textfield name="supplier.institutionCertificate"/></td>
    <td colspan="2">组织机构代码证有效期</td>
    <td><input name="supplier.institutionValidity" type="text" size="18" onclick="WdatePicker()" value="<s:property value="supplier.institutionValidity"/>"/></td>
  </tr>
  <tr>
    <td height="28" colspan="2">税务登记证编号</td>
    <td><s:textfield name="supplier.taxCertificateNo"/></td>
    <td colspan="2">开户许可证编号</td>
    <td><s:textfield name="supplier.accountLicense"/></td>
  </tr>
  <tr>
    <td height="25" colspan="2">开户行</td>
    <td><s:textfield name="supplier.bank"/></td>
    <td colspan="2">开户银行账号</td>
    <td><s:textfield name="supplier.bankAccount"/></td>
  </tr>
  <tr>
    <td height="50">备&nbsp;&nbsp;&nbsp;&nbsp;注</td>
    <td colspan="5"><s:textarea name="supplier.remark" rows="3" cols="80"/></td>
  </tr>
</table>

    	<input class="input-button" type="submit" value="修改" >
    	<input class="input-button" type="button" value="返回" onclick="history.go('-1');"/>
    </s:form>
  </body>
</html>
