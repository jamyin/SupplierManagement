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
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/style.css" /> 
<%--<link type="text/css" rel="stylesheet" href="css/jam_style.css" /> 
    <style type="text/css">body { font:12px 宋体; background:#fff; }</style> --%>
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
	/* $(function(){
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
		 */
		 
		 $(function(){
				$(".pclass").bind('click',function(){
					var proVal = $(this).children(":selected").text();
					var cityVal = $(this).next().children(":selected").text();
					//$(this).next().next().text(proVal + '1' + cityVal + '2');
					//$(this).next().next().value(proVal);
					$("#lever1").val(proVal);
				});
				$(".cclass").bind('click',function(){
					var proVal = $(this).prev().children(":selected").text();
					var cityVal = $(this).children(":selected").text();
					//$(this).next().text(proVal + '3' + cityVal + '4');
					//$(this).next().next().value(cityVal);
					$("#lever2").val(cityVal);
				});
			});
			
	
		$(function(){
			//all provinces
			for(var p in province){
				$("<option />",{value:p, text:p}).appendTo("#provinces");
			};
			//default city
			$(province['请选择']).each(function(i){
				$("<option />",{value:this, text:this}).appendTo("#cities");
			});
			//change province
			$("#provinces").change(function(){
				$("#cities").html('');//clear city's select
				//get this province's cities
				$(province[this.value]).each(function(j){
					$("<option />",{value:this, text:this}).appendTo("#cities");
				});
			});
		});

	
		var province={
			'服务':['筹划','外烩','场地','摄影'],
			'礼品':['礼品'],
			'食品':['食品'],
			'公共关系':['媒体','政府机构','民间组织','赞助商'],
			};	
		function checkAdd(){
			/* if(supplier.value==""||supplier==null){
	           alert("请输入供应商！");  
	           return false;
	        } */
		
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
				return confirm("进入待审核状态，请耐心等待管理员审核！")
				return true;
			}

		}
	
	var addContracter =function(){
//	alert("&");
/* 	window.open("addContacter.action"); 
    window.location.href="/supplierManagement/addContacter"; */
    window.open("/supplierManagement/addContracter.jsp");
	}
	
	</script>

  </head>
  <body bgcolor="#F7F7F7" style="text-align: center">
  <!-- 获取当前时间 ，格式为xxxx-xx-xx -->
	<s:set name="todayTime" value="new java.sql.Date(new java.util.Date().getTime()).toString()"></s:set>
    <!--   	<input type="hidden" id="eno" value="${emp.empno}">    
    <s:property value="#linkman.linkmanName" />-->
    <s:form method="post" id="updateSupplier" action="updateSupplier">
<table width="894"  border="1" class="tableStyle" bordercolor="#AAAAAA" align="center">
	<h4 align="center">修改供应商</h4>
	<tr><s:hidden name="supplier.supplierId" ></s:hidden>
	<td colspan="1">供应商类型:</td>
	<td colspan="5" align="left">
  	一级分类:
  	<select id='provinces' name="supplier.bigSort" class="pclass"><option value="<s:property value="supplier.bigSort"/>"><s:property value="supplier.bigSort"/></option></select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	二级分类:
  	<select id="cities" name="supplier.sort" class="cclass"><option value="<s:property value="supplier.sort"/>"><s:property value="supplier.sort"/></option></select>
  	<input type="hidden" id="lever1"/> <input type="hidden" id="lever2"/>
  	</td>
  </tr>
  <tr>
    <td width="147" >公司名称（全称）</td>
    <td  colspan="3"  align="left"><label>
      <input name="supplier.supplierName" id="supplierId" type="text" size="65" value="${supplier.supplierName}"/>
    </label></td>
    <td width="122" >来访日期</td>
    <td width="158"  align="left"><label>
      <input name="supplier.inputDate" type="text" size="18" onclick="WdatePicker()" value="${supplier.inputDate}" />
    </label></td>
  </tr>
  <tr>
    <td>联系人</td>
    <td width="145" align="left"><input name="supplier.contacter" type="text" size="18" value="${supplier.contacter}"/></td>
    <td width="133">联系电话</td>
    <td width="149" align="left"><input name="supplier.tel" type="text" size="18" value="${supplier.tel}"/></td>
    <td width="122">公司传真</td>
    <td width="158" align="left"><input name="supplier.fax" type="text" size="18" value="${supplier.fax}"/></td>
  </tr>
  <tr>
    <td>公司邮箱</td>
    <td align="left"><input name="supplier.email" type="text" size="18" value="${supplier.email}"/></td>
    <td>公司网址</td>
    <td align="left"><input name="supplier.website" type="text" size="18" value="${supplier.website}"/></td>
    <td>所属行业</td>
    <td align="left" size="18"><select name="supplier.industry">
        <option value="${supplier.industry}" selected="selected">${supplier.industry}</option>
        <option value="制造业">制造业</option>
        <option value="批发零售业">批发零售业</option>
        <option value="餐饮业">餐饮业</option>
        <option value="交通运输业">交通运输业</option>
        <option value="软件信息业">软件信息业</option>
        <option value="租赁商务服务业">租赁商务服务业</option>
        <option value="文化娱乐业">文化娱乐业</option>
        <option value="建筑业">建筑业</option>
        <option value="其他">其他</option>
      </select></td>   </tr>
  <tr>
    <td>联系地址</td>
    <td colspan="3" align="left"><input name="supplier.companyAddr" type="text" size="65" value="${supplier.companyAddr}"/></td>
    <td>供应商状态</td>
     <td align="left">
     <input type="text" name="supplier.supplierStatus" value="待审核" readonly="readonly" size="18"/>
     <%-- <select name="supplier.supplierStatus">
        <option value="合格">合格</option>
        <option value="不合格">不合格</option>
        <option value="待审核">待审核</option>
      </select> --%></td>
  </tr>
  <tr>
    <td>法人代表</td>
    <td align="left"><input name="supplier.legalPerson" type="text" size="18"  value="${supplier.legalPerson}"/></td>
    <td>注册资金</td>
    <td align="left"><select name="supplier.registeredFund">
        <option value="${supplier.registeredFund}" selected="selected">${supplier.registeredFund}</option>
        <option value="<10万"><10万</option>
        <option value="10万-50万">10万-50万</option>
        <option value="50万-100万">50万-100万</option>
        <option value="100万-1000万">100万-1000万</option>
        <option value="1000万-1亿">1000万-1亿</option>
        <option value=">1亿">>1亿</option>
      </select></td>
    <td>品牌名称</td>
    <td align="left"><input name="supplier.brandName" type="text" size="18"  value="${supplier.brandName}"/></td>
  </tr>
  <tr>
    <td>企业规模</td>
    <td align="left"><select name="supplier.companySize">
        <option value="${supplier.companySize}" selected="selected">${supplier.companySize}</option>
        <option value="<10人"><10人</option>
        <option value="10人-50人">10人-50人</option>
        <option value="50人-100人">50人-100人</option>
        <option value="100人-500人">100人-500人</option>
        <option value="500人以上">500人以上</option>
      </select></td>   
       <td>年营业额</td>
    <td align="left"><select name="supplier.turnover">
        <option value="${supplier.turnover}" selected="selected">${supplier.turnover}</option>
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
    <td colspan="5" align="left"><s:textarea name="supplier.advantage" rows="2" cols="85"/></td>
  </tr>
  <tr>
    <td>专长业务</td>
    <td colspan="5" align="left"><s:textarea name="supplier.speciality" rows="2" cols="85"/></td>
  </tr>
  <tr>
    <td>覆盖区域</td>
    <td colspan="5" align="left"><s:textarea name="supplier.area" rows="2" cols="85"/></td>
  </tr>
  <tr>
    <td>经典案例/重要客户</td>
    <td colspan="5" align="left"><s:textarea name="supplier.classicCase" rows="2" cols="85"/></td>
  </tr>
  <tr>
    <td>其他平台合作情况</td>
    <td colspan="5" align="left"><s:textarea name="supplier.cooperation" rows="2" cols="85"/></td>
  </tr>
  <tr>
    <td>营业执照编号</td>
    <td  colspan="2" align="left"><input name="supplier.businessLicense" type="text" size="35"  value="${supplier.businessLicense}"/></td>
    <td>营业执照有效期</td>
    <td colspan="2" align="left"><input name="supplier.busLicenseValidity" type="text" size="35" onclick="WdatePicker()"  value="${supplier.busLicenseValidity}"/></td>
  </tr>
  <tr>
    <td>组织机构代码证编号</td>
    <td colspan="2" align="left"><input name="supplier.institutionCertificate" type="text" size="35"  value="${supplier.institutionCertificate}"/></td>
    <td>组织机构代码证有效期</td>
    <td colspan="2" align="left"><input name="supplier.institutionValidity" type="text" size="35" onclick="WdatePicker()"  value="${supplier.institutionValidity}"/></td>
  </tr>
  <tr>
    <td>税务登记证编号</td>
    <td colspan="2" align="left"><input name="supplier.taxCertificateNo" type="text" size="35"  value="${supplier.taxCertificateNo}"/></td>
    <td>开户许可证编号</td>
    <td colspan="2" align="left"><input name="supplier.accountLicense" type="text" size="35"  value="${supplier.accountLicense}"/></td>
  </tr>
  <tr>
    <td>开户行</td>
    <td colspan="2" align="left"><input name="supplier.bank" type="text" size="35"  value="${supplier.bank}"/></td>
    <td>开户银行账号</td>
    <td colspan="2" align="left"><input name="supplier.bankAccount" type="text" size="35"  value="${supplier.bankAccount}"/></td>
  </tr>
  
  <tr>
    <td>备&nbsp;&nbsp;&nbsp;&nbsp;注</td>
    <td colspan="5" align="left"><s:textarea name="supplier.remark" rows="2" cols="85"/></td>
  </tr>
    <tr align="center"><td colspan="6">
    	<input class="input-button" type="submit" value="提交" onclick="return checkAdd()">
    	<input class="input-button" type="button" value="返回" onclick="history.go('-1');"/>
    	</td>
  </tr>
</table>
    </s:form>
  </body>
</html>
