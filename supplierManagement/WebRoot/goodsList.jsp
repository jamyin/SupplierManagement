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
    <style type="text/css">
    	/* .goodsList{
    		height: 310px;
    	} */
    </style>
    <title>My JSP 'goodsList.jsp' starting page</title>
    <script type="text/javascript">
    	/* function chooseSupplier(){
    		window.location.href="goodsBySupplierName.action?supplierName=<s:property value="#supplier.supplierName"/>";
    	} */
    	
    	//全选按钮
    	function choosedAll(){
    		var ckall = document.getElementById('chooseAll');
    		var choice = document.getElementsByName('choose');		  		
    		for(var i=0;i<choice.length;i++){
    			choice[i].checked = ckall.checked;
    		}
    	}
    	
    	//批量删除
     	function deleteGoods(){
     		//alert(1)
    		var choose = document.getElementsByName("choose");
    		var deleteId;
    				var flag = confirm("您确定要删除已选记录！");
    		for(var i=0;i<choose.length;i++){
    			if(choose[i].checked == true){
    				deleteId = choose[i].value;
    				if(flag){
    					window.location.href="deleteGoods.action?deleteId="+deleteId;
    				}
    			}
    		}
    		if(deleteId == null){
    			alert("请选择要删除的记录！");
    		} 
    	}
    	
    	//拉黑，不显示在页面上
     	function notShowGoods(){
     		//alert(1)
    		var choose = document.getElementsByName("choose");
    		var deleteId;
    		var flag = confirm("您确定要删除已选记录");
    		for(var i=0;i<choose.length;i++){
    			if(choose[i].checked == true){
    				deleteId = choose[i].value;
    				//var flag = confirm("您确定要删除记录："+deleteId);
    				if(flag){
    					window.location.href="notShowGoods.action?deleteId="+deleteId;
    				}
    			}
    		}
    		if(deleteId == null){
    			alert("请选择要删除的记录！");
    		} 
    	}
    	
    	//修改
    	function updateGoods(){
    		var str = document.getElementsByName("choose");
    		var theSize=str.length;
    		var id;
    		for(var i=0;i<theSize;i++){
    			if(str[i].checked == true){
    				id = str[i].value;
    				window.location.href = "updateGoods.action?deleteId="+id;
    			}
    		}
    		if(id == null ){
    			alert("请选择您要修改的记录！");
    		}
    	}
    	
    	//详细
    	function detailGoods(){
    		var str = document.getElementsByName("choose");
    		var theSize=str.length;
    		var id;
    		for(var i=0;i<theSize;i++){
    			if(str[i].checked == true){
    				id = str[i].value;
    				window.location.href = "detailGoods.action?deleteId="+id;
    			}
    		}
    		if(id == null ){
    			alert("请选择您要查看的记录！");
    		}
    	}
    	
    	//跳转
    	function wantGo(totalPageCount){
    		var theIndex=document.getElementById("index").value;
    		//alert(theIndex);
    		if(isNaN(theIndex)){
    			alert("请输入数字！");
    		}else if(theIndex>totalPageCount||theIndex<=0){
    			alert("没有此页面");
    		}else{
    		window.location.href="goodsAction?index="+theIndex;
    		}
    	}
    	
    	function willGo(totalPageCount){
    		var theIndex=document.getElementById("index").value;
    		if(isNaN(theIndex)){
    			alert("请输入数字！");
    		}else if(theIndex>totalPageCount||theIndex<=0){
    			alert("没有此页面");
    		}else{
    		window.location.href="goodsAction?index="+theIndex;
    		}
    		//window.location.href="goodsAction?index="+theIndex;
    	}
    	
    	//通过供应商名称获取供应商Id
    	function getSupplierName(){
    		
    	}
    	
    	//删除
    	/* function deleteGoods(deleteId){
    		var flag = confirm("您确定删除该记录！");
    		if(flag){
    			window.location.href="deleteGoods.action?deleteId="+deleteId;
    		}
    	} */
    </script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<style type="text/css">
		.pastDue{
			color: red;
		}
	</style>

  </head>
  
  <body>
<div class="menu">
  <table>
<tbody><tr>
<!-- <td><form method="post" action="productById">
<input name="flag" value="search" class="input-text" type="hidden">
产品编号：<input name="deleteId" class="input-text" type="text">&nbsp;<input value="查 询" type="submit"/>
</form></td> -->
<td class="colour">
	<form action="goodsAction" method="post">
		供应商：<input type="text" class="input-text" name="product.supplier.supplierName" value='<s:property value="product.supplier.supplierName"/>'/>&nbsp;
		产品名称：<input name="productName" class="input-text" type="text" value='<s:property value="productName"/>'/>&nbsp;
		<input value="查 询" type="submit"/>&nbsp;&nbsp;&nbsp;
	</form></td>
<s:if test="#session.user.permission==0">
<td>
<input value="添加" onclick="javascript:window.location.href='clickAddGoods.action'" type="button">&nbsp;&nbsp;&nbsp;
</td>
<td><input type="button" value="修改" onclick="updateGoods()"/>&nbsp;&nbsp;&nbsp;</td>
<!-- <td><input type="button" value="删除" onclick="deleteGoods()"/>&nbsp;&nbsp;&nbsp;</td> -->
<td><input type="button" value="删除" onclick="notShowGoods()"/>&nbsp;&nbsp;&nbsp;</td>
</s:if>
<s:if test="#session.user.permission==1">
<td>
<input value="添加" onclick="javascript:window.location.href='clickAddGoods.action'" type="button">&nbsp;&nbsp;&nbsp;
</td>
</s:if>
<td><input type="button" value="详细" onclick="detailGoods()"/></td>
</tr>
</tbody></table></div>
<div>
	<!-- <img src="imgs/pdf.png" /><a href="reportaccountepdf.action">当前页用户信息PDF下载</a>
	<img src="imgs/pdf.png" /><a href="reportaccountepdf.action">所有用户信息PDF下载</a> -->
	<!-- <img src="imgs/excel.png" /><a href="reportaccounteexcel.action">Excel下载</a> -->
	<img src="imgs/excel1.jpg" /><a href="goodsDown.action">当前页产品信息Excel下载</a>
	<img src="imgs/excel1.jpg" /><a href="goodsAllDown.action">所有产品信息Excel下载</a>
</div>
<hr >
	
   <form action="goodsAction" method="post">
  <div class="goodsList">
  		<table border="1" width="100%" align="center">
  		<tr>
  			<!-- <td>商品编号</td> -->
  			<td class="tableTitle"><input type="checkbox" id="chooseAll" onclick="choosedAll()"/></td>
  			<td class="tableTitle" align="center">供应商</td>
  			<td class="tableTitle" align="center">产品名称</td>
  			<td class="tableTitle" align="center">产品规格</td>
  			<td class="tableTitle" align="center">生产厂家</td>
  			<td class="tableTitle" align="center">厂家税务登记证</td>
  			<td class="tableTitle" align="center">组织机构代码证</td>
  			<td class="tableTitle" align="center">营业执照有效期</td>
  			<td class="tableTitle" align="center">生产许可证有效期</td>
  			<td class="tableTitle" align="center">第三方质检报告有效期</td>
  			<!-- <td align="center">操作</td> -->
  		</tr>
  		<s:if test="goodslist!=null">
  			<s:iterator value="goodslist" var="product" status="sta">
  			<tr>
  				<td><input type="checkbox" name="choose" value="<s:property value='#product.productId'/>"/></td>
  				<td><s:property value="#product.supplier.supplierName"/></td>
  				<td><s:property value="#product.productName"/></td>
  				<td><s:property value="#product.standard"/></td>
  				<td><s:property value="#product.manufacturer"/></td>
  				<td><s:property value="#product.taxCertificate"/></td>
  				<td><s:property value="#product.institutionCertificate"/></td>
  				<td><s:property value="#product.busLicenseValidity"/></td>
  				<td><s:property value="#product.productCerValidity"/></td>
  				<td><s:property value="#product.thirdpartyValidity"/></td>
  			</tr>
  			</s:iterator>
  		</s:if>
  		<s:if test="product!=null">
  			<s:iterator value="product" var="product" status="sta">
  			<tr>
  				<%-- <td><s:property value="#product.productId"/></td> --%>
  				<td><input type="checkbox" name="choose" value="<s:property value='#product.productId'/>"/></td>
  				<td><s:property value="#product.supplier.supplierName"/></td>
  				<td><s:property value="#product.productName"/></td>
  				<td><s:property value="#product.standard"/></td>
  				<td><s:property value="#product.manufacturer"/></td>
  				<td><s:property value="#product.taxCertificate"/></td>
  				<td><s:property value="#product.institutionCertificate"/></td>
  				
  				<s:if test="#todayTime>=#product.busLicenseValidity>">
  				<td class="pastDue"><s:property value="#product.busLicenseValidity"/></td>
  				</s:if>
  				<s:else>
  				<td><s:property value="#product.busLicenseValidity"/></td>
  				</s:else>
  				
  				<s:if test="#todayTime>=#product.productCerValidity">
  				<td class="pastDue"><s:property value="#product.productCerValidity"/></td>
  				</s:if>
  				<s:else>
  				<td><s:property value="#product.productCerValidity"/></td>
  				</s:else>
  				
  				<s:if test="#todayTime>=#product.thirdpartyValidity">
  				<td class="pastDue"><s:property value="#product.thirdpartyValidity"/></td>
  				</s:if>
  				<s:else>
  				<td><s:property value="#product.thirdpartyValidity"/></td>
  				</s:else>
  			</tr>
  			</s:iterator>
  		</s:if>
  	</table>
  	</div>
  	<br/>
  	<div>
  		<table align="center">
		<tr>
			<s:if test="index>1">
			<td><a class="input-button"
					href="goodsAction?index=1">首页</a>
			</td>
			</s:if>
			<s:if test="index>1">
			<td><a class="input-button"
					href="goodsAction?index=${index -1}">上一页</a>
			</td>
			</s:if>
			<td>
				<a class="input-index">第<s:property value="index"/>页</a>
			</td>
			<s:if test="index<totalPageCount">
			<td><a class="input-button"
					href="goodsAction?index=${index +1}">下一页</a>
			</td>
			</s:if>
				<s:if test="index<totalPageCount">
				<td><a class="input-button"
					href="goodsAction?index=${totalPageCount }">尾页</a>
				</td>
				</s:if>
				<td>
					<a class="input-button">共<s:property value="totalPageCount"/>页</a>
				</td>
				<td><input type="text" id="index" size="10" onblur="wantGo(<s:property value="totalPageCount"/>)"/>
				<input type="button" value="GOTO" onclick="willGo(<s:property value="totalPageCount"/>)">
				</td>
			</tr>
		</table>
  	</div>
  <%-- <jsp:include page="pages.jsp"></jsp:include> --%>
  </form>
  <br>
  </body>
</html>
