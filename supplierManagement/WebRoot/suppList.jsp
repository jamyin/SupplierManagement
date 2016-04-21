<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>">
<title>供应商列表</title>
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>	
	<script type="text/javascript">
			$(function(){
				$(".pclass").bind('click',function(){
					var proVal = $(this).children(":selected").text();
					var cityVal = $(this).next().children(":selected").text();
					//$(this).next().next().text(proVal + '' + cityVal + '');
					$("#lever1").val(proVal);
				});
				$(".cclass").bind('click',function(){
					var proVal = $(this).prev().children(":selected").text();
					var cityVal = $(this).children(":selected").text();
					//$(this).next().text(proVal + '' + cityVal + '');
					$("#lever2").val(cityVal);
				});
			});

		var province={
			'请选择':['请选择'],
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
	</script>
	
<script type="text/javascript">
       var checkTime = function(){
//    	alert("111");
//    	alert(supplierlist.size());
   
/*       for ( var int i= 0; i < supplierlist.length; int++) {
	  var supplier = array[i];
      alert(supplier);
      }
      for (Iterator iter = supplierlist.iterator(); iter.hasNext(); ) { 
      alert(iter.);
            	Integer x = (Integer) iter.next(); 
                sum = sum + x.intValue(); 
      }*/
//      var strValue = "<s:property value='thirdpartyValidity'  />";    alert(strValue);
     
       var thirdpartyValidity= document.getElementById("thirdpartyValidity").value;
       //alert(thirdpartyValidity);
       var now = new Date(); 
       var year = new Date().getFullYear();
       var month = new Date().getMonth()+1;
       var day= new Date().getDate();
       var today=year+"-"+month+"-"+day;
       if(thirdpartyValidity<today){
       document.getElementById("thirdpartyValidity").style.color="red";
       }
/*     alert(now);
       alert(year);
       alert(month);
       alert(day);
       alert(today); */
        }
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
    			//alert(choice[i].value);
    				flag = true;
    				break;
    			}
    		}
    		if(flag){
    			var bool = confirm('你真心要删除吗？');
	    		if(bool){
	    			document.getElementById('supplier').submit();
	    		}
    		}else{
    			alert('请选择要删除的项');
    		}
    		
    	}
    	
    	//修改供应商
    	var subForm_modify = function(){
    		var choice = document.getElementsByName('choice');
            var flag = false;
            var id=0;
    		for(var i=0;i<choice.length;i++){
    			if(choice[i].checked==true){
    			flag = true;
    			id=choice[i].value;
    			//window.location.href="findSupplierByID?supplierID="+choice[i].value;
    			break;
    			}
    		}
    		if(flag){
    		window.location.href="findSupplierByID?supplierID="+id;
    		//alert(id);
    		}else{
    		    alert('请选择要修改的项');
    		}
    	}
    	
    	//审核供应商
    	var checkSupplier = function(){
    		var choice = document.getElementsByName('choice');
            var flag = false;
            var id=0;
    		for(var i=0;i<choice.length;i++){
    			if(choice[i].checked==true){
    			flag = true;
    			id=choice[i].value;
    			//window.location.href="findSupplierByID?supplierID="+choice[i].value;
    			break;
    			}
    		}
    		if(flag){
    		window.location.href="auditSupplier?supplierID="+id;
    		}else{
    		    alert('请选择要审核的项');
    		}
    	}
    	
    	var subForm_add = function(){
    	//window.open('/supplierManagement/addSupplier1.jsp','newwindow','height=900,width=1440,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
    	window.location.href="addSupplier1.jsp";
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
    		window.location.href="findSupplierDetaile?supplierID="+id;
    		}else{
    		    alert('请选择要查看的项');
    		}
    	
    	}
 /*   	    var subForm_modify = function(){      
     		var choice = document.getElementsByName('choice');
     		alert(choice.checked.length);
   		    if(choice.length!=0){
	    			var supplierId=document.getElementById('supplier');
	    			alert(supplierId);
	    			//window.open("findSupplierByID?supplierID="+supplierId);
    		}else{
    			alert('请选择要修改的项');
    		}  
    		
    	    }*/
    	
    	window.onload = function(){
    		var msg=document.getElementById('msg');
    		if(null!=msg.value&& msg.value!=''){
    			alert(msg.value);
    		}
    	}
    	var contractToRed = function(){
    	//alert("hey ，boy");
    	}
    	//跳转页面
    	function wantGo(totalPageCount){
    		var theIndex = document.getElementById("index").value;
    		if(isNaN(theIndex)){
			alert("请输入数字！");
		}else if(theIndex>totalPageCount||theIndex<=0){
			alert("没有此页面！");
		}else{
			window.location.href="getSupplierList?index="+theIndex;
		}
    	}
    	
    	function willGo(totalPageCount){
    		var theIndex = document.getElementById("index").value;
    		if(isNaN(theIndex)){
			alert("请输入数字！");
		    }if(theIndex>totalPageCount||theIndex<=0){
			alert("没有此页面！");
		}else{
			window.location.href="getSupplierList?index="+theIndex;
		}
    	}
    </script>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link type="text/css" rel="stylesheet" href="css/style.css" />
<!-- <link type="text/css" rel="stylesheet" href="css/jam_style.css" /> -->
</head>
<body onload="">
<div class="menu">
 		<%-- <s:form action="findSupplierByField" method="post"> --%>
 		<s:form action="getSupplierList" method="post">
<%--    按名称查：<input type="text" name="supplierName" value="#supplier.supplierName"></> 
    	按专长查：<s:textfield name="speciality"   value="#supplier.speciality"></s:textfield>  --%>
    	一级分类：<select id='provinces' class="pclass">${bigSort}</select> 二级分类： <select id='cities' class="cclass">${sort}</select>
	    <input type="hidden" name="bigSort" id="lever1"/> <input type="hidden" id="lever2" name="sort"/>
                     名称：<input name="supplierName" value="${supplierName}"/>
      	专长：<input name="speciality"  value="${speciality}"/>
		<s:submit value="查询" />&nbsp;&nbsp;
		<s:if test="#session.user.permission==0">
		<input type="button" value="添加"	onclick="subForm_add()"/>&nbsp;&nbsp;
        <input	type="button" value="修改" onclick="subForm_modify()" />&nbsp;&nbsp;
		<input	type="button" value="删除" onclick="subForm_del()" />&nbsp;&nbsp;
		<input type="button" value="审核" onclick="checkSupplier()"/>&nbsp;&nbsp;
		</s:if>
		<s:if test="#session.user.permission==1">
		<input type="button" value="添加"	onclick="subForm_add()"/>&nbsp;&nbsp;
		</s:if>
        <input	type="button" value="详细" onclick="subForm_detaile()" />
		</s:form>
</div>
<div>
	<!-- <img src="imgs/pdf.png" /><a href="reportaccountepdf.action">当前页供应商信息PDF下载</a>
	<img src="imgs/pdf.png" /><a href="reportaccountepdf.action">所有供应商信息PDF下载</a> -->
	<!-- <img src="imgs/excel.png" /><a href="reportaccounteexcel.action">Excel下载</a> -->
	<img src="imgs/excel1.jpg" /><a href="supplierDown.action">当前页供应商信息Excel下载</a>
	<img src="imgs/excel1.jpg" /><a href="supplierAllDown.action">所有供应商信息Excel下载</a>&nbsp;&nbsp;&nbsp;&nbsp;
</div>	
<hr>
  	        <input type="hidden" id="msg" value="${message}"> 
		     <s:form id="supplier" action="deleteSupplier" method="post">
			<table border="1" width="100%" align="center" bordercolor="#ACA899">
				<tr>
                    <th class="tableTitle" width="5" height="25"><input type="checkbox" id="ckall" onclick="choose();"/></th> 
					<th class="tableTitle" width="130">公司名称</th>
					<th class="tableTitle" width="40">联系人</th>
					<th class="tableTitle" width="50">法人代表</th>
					<th class="tableTitle" width="50">品牌名称</th>
					<th class="tableTitle" width="50">联系电话</th>
					<th class="tableTitle" width="60">注册资金</th>
					<th class="tableTitle" width="120">公司地址</th>
					<th class="tableTitle" width="50">公司网站</th>
					<th class="tableTitle" width="50">公司邮箱</th>
					<th class="tableTitle" width="50">状态</th>
					<th class="tableTitle" width="100">专长业务</th>
					<th class="tableTitle" width="40">查询</th>
				</tr>
				<s:if test="supplierlist!=null">
				<s:set name="today" value="new java.sql.Date(new java.util.Date().getTime()).toString()"></s:set>
					<s:iterator value="supplierlist" var="supplier" status="sta">
					<s:if test="#supplier.busLicenseValidity <#today||#supplier.institutionValidity <#today">
						<tr>
						    <s:hidden id="%{supplier++}" value="#supplier.thirdpartyValidity"></s:hidden>
							<%--  <td><s:checkbox name="choice" value="#supplier.supplierID" />
							</td> --%>
							<td class="pastDue"><input type="checkbox" name="choice" id="modify_Id" value="${supplier.supplierId}"/>
							</td> 
							<td class="pastDue"><s:property value="#supplier.supplierName"/>
							</td>
							<td class="pastDue"><s:property value="#supplier.contacter" />
							</td>
							<td class="pastDue"><s:property value="#supplier.legalPerson " />
							</td>
							<td class="pastDue"><s:property value="#supplier.brandName" />
							</td>
							<td class="pastDue"><s:property value="#supplier.tel"/>
							</td>
							<td class="pastDue"><s:property value="#supplier.registeredFund" />
							</td>
							<td class="pastDue"><s:property value="#supplier.companyAddr" />
							</td>
							<td class="pastDue"><s:property value="#supplier.website" />
							</td>
							<td class="pastDue"><s:property value="#supplier.email" />
							</td>
							<td class="pastDue"><s:property value="#supplier.supplierStatus" />
							</td>
							<td class="pastDue"><s:property value="#supplier.speciality" />
							</td>
							<td>
							<a href="<c:url value="findProductByName?supplierName=${supplier.supplierName}"/>"><img src="images/jam/WP01.png"  height="15" width="10" alt="相关产品"/></a>
							<a href="<c:url value="findContacterByName1?supplierName=${supplier.supplierName}"/>"><img src="images/jam/LXR01.png" height="15" width="10" alt="相关联系人"/></a>
							<a href="<c:url value="findContractByName?supplierName=${supplier.supplierName}"/>"><img src="images/jam/HT01.png" height="15" width="10" alt="相关合同"/></a>
							<a href="<c:url value="/toModify?empno=${emp.empno}"/>">修改</a>
                            <input type="button" onclick="window.open ('updateUser.jsp?id=<s:property value="#user.userId"/>&userName=<s:property value="#user.userName"/>&password=<s:property value="#user.password"/>&createDate=<s:property value="#user.createDate"/>', 'newwindow', 'height=500, width=500')" value="修改"/>
							<a href="<c:url value="findSupplierByID?supplierID=${supplier.supplierId}"/>">修改</a>
							<a href="<c:url value="findAllContent?supplierID=${supplier.supplierId}"/>">修改所有</a>
							</td>
						</tr>
						</s:if>
						<s:else>
						<tr >
						    <s:hidden id="%{supplier++}" value="#supplier.thirdpartyValidity"></s:hidden>
							 <td><s:checkbox name="choice" value="#supplier.supplierID" />
							</td>
							<%-- <td><input type="checkbox" name="choice" id="modify" value="${supplier.supplierId}"/>
							</td>  --%>
							<td><s:property value="#supplier.supplierName"/>
							</td>
							<td><s:property value="#supplier.contacter" />
							</td>
							<td><s:property value="#supplier.legalPerson " />
							</td>
							<td><s:property value="#supplier.brandName" />
							</td>
							<td><s:property value="#supplier.tel"/>
							</td>
							<td><s:property value="#supplier.registeredFund" />
							</td>
							<td><s:property value="#supplier.companyAddr" />
							</td>
							<td><s:property value="#supplier.website" />
							</td>
							<td><s:property value="#supplier.email" />
							</td>
							<td><s:property value="#supplier.supplierStatus" />
							</td>
							<td>&nbsp;<s:property value="#supplier.speciality" />
							</td>
							<td>
							<a href="<c:url value="findProductByName?supplierName=${supplier.supplierName}"/>"><img src="images/jam/WP01.png"  height="15" width="10" alt="相关产品"/></a>
							<a href="<c:url value="findContacterByName1?supplierName=${supplier.supplierName}"/>"><img src="images/jam/LXR01.png" height="15" width="10" alt="相关联系人"/></a>
							<a href="<c:url value="findContractByName?supplierName=${supplier.supplierName}"/>"><img src="images/jam/HT01.png" height="15" width="10" alt="相关合同"/></a>
							<%--<a href="<c:url value="/toModify?empno=${emp.empno}"/>">修改</a>
                            <input type="button" onclick="window.open ('updateUser.jsp?id=<s:property value="#user.userId"/>&userName=<s:property value="#user.userName"/>&password=<s:property value="#user.password"/>&createDate=<s:property value="#user.createDate"/>', 'newwindow', 'height=500, width=500')" value="修改"/>
						 	<a href="<c:url value="findSupplierByID?supplierID=${supplier.supplierId}"/>">修改</a>
							<a href="<c:url value="findAllContent?supplierID=${supplier.supplierId}"/>">修改所有</a> --%>
							</td>
						</tr>
						</s:else>
					</s:iterator>
			</table>
			</s:if>
			</s:form> 
        <center>
	    <input type="button" value="添加"	onclick="window.open('/supplierManagement/addSupp.jsp')" /> 
		<input	type="button" value="修改" onclick="findSupplierByID?supplierID=${supplier.supplierId}" /> 
		<input	type="button" value="删除" onclick="subForm()" />
		</center>  
		<%-- <jsp:include page="pages.jsp"></jsp:include> --%>
	<br/>
	<div>
  	<table align="center">
		<tr>
			<s:if test="index>1">
			<td><a class="input-button"
					href="getSupplierList?index=1">首页</a>
			</td>
			</s:if>
			<s:if test="index>1">
			<td><a class="input-button"
					href="getSupplierList?index=${index -1}">上一页</a>
			</td>
			</s:if>
			<td>
				<a class="input-index">第<s:property value="index"/>页</a>
			</td>
			<s:if test="index<totalPageCount">
			<td><a class="input-button"
					href="getSupplierList?index=${index +1}">下一页</a>
			</td>
			</s:if>
				<s:if test="index<totalPageCount">
				<td><a class="input-button"
					href="getSupplierList?index=${totalPageCount }">尾页</a>
				</td>
				</s:if>
				<td>
					<a class="input-button">共<s:property value="totalPageCount"/>页</a>
				</td>
				<td><input type="text" id="index"  size="10" onblur="wantGo(<s:property value="totalPageCount"/>)" name="index">
				<input type="button" value="GOTO" onclick="willGo(<s:property value="totalPageCount"/>)">
				</td>
			</tr>
		</table>
  		</div>
</body>
</html>
