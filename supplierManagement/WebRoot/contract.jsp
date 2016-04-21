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
    
    <title>My JSP 'contract.jsp' starting page</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript">
    	function chooseSupplier(){
    		window.location.href="goodsBySupplierName.action?supplierName=<s:property value='#supplier.supplierName'/>";
    	}
    	//checked全选
    	function chooseAll(){
    		var ckall = document.getElementById('chooseAll');
    		var choice = document.getElementsByName('choose');		  		
    		for(var i=0;i<choice.length;i++){
    			choice[i].checked = ckall.checked;
    		}
    	}
    	
    	//批量删除deleteContract
     	function deleteContract(){
     		//alert(1)
    		var choose = document.getElementsByName("choose");
    		var deleteId;
    		var flag = confirm("您确定要删除已选记录");
    		for(var i=0;i<choose.length;i++){
    			if(choose[i].checked == true){
    				deleteId = choose[i].value;
    				//alert(deleteId)
    				//var flag = confirm("您确定要删除记录："+deleteId);
    				if(flag){
    					window.location.href="deleteContract.action?contractId="+deleteId;
    				}
    			}
    		}
    		if(deleteId == null){
    			alert("请选择要删除的记录！");
    		} 
    	}
    	
    	//修改flag0至不显示
     	function notShowContract(){
     		//alert(1)
    		var choose = document.getElementsByName("choose");
    		var deleteId;
    		var flag = confirm("您确定要删除已选记录");
    		for(var i=0;i<choose.length;i++){
    			if(choose[i].checked == true){
    				deleteId = choose[i].value;
    				//alert(deleteId)
    				//var flag = confirm("您确定要删除记录："+deleteId);
    				if(flag){
    					window.location.href="notShowContract.action?contractId="+deleteId;
    				}
    			}
    		}
    		if(deleteId == null){
    			alert("请选择要拉黑的记录！");
    		} 
    	}
    	
    	//修改
    	function updateContract(){
    		var str = document.getElementsByName("choose");
    		var theSize=str.length;
    		var id;
    		for(var i=0;i<theSize;i++){
    			if(str[i].checked == true){
    				id = str[i].value;
    				window.location.href = "updateContract.action?contractId="+id;
    			}
    		}
    		if(id == null ){
    			alert("请选择您要修改的记录！");
    		}
    	}
    	
    	//审核，即修改状态字段
    	function checkContract(){
    		var str = document.getElementsByName("choose");
    		var theSize=str.length;
    		var id;
    		for(var i=0;i<theSize;i++){
    			if(str[i].checked == true){
    				id = str[i].value;
    				window.location.href = "checkContract.action?contractId="+id;
    			}
    		}
    		if(id == null ){
    			alert("请选择您要审核的记录！");
    		}
    	}
    	
    	//详细
    	function detailContract(){
    		var str = document.getElementsByName("choose");
    		var theSize=str.length;
    		var id;
    		for(var i=0;i<theSize;i++){
    			if(str[i].checked == true){
    				id = str[i].value;
    				window.location.href = "detailContract.action?contractId="+id;
    			}
    		}
    		if(id == null ){
    			alert("请选择您要查看的记录！");
    		}
    	}
    	
    	//跳转页面
    	function wantGo(totalPageCount){
    		var theIndex = document.getElementById("index").value;
    		if(isNaN(theIndex)){
    			alert("请输入数字！");
    		}else if(theIndex>totalPageCount||theIndex<=0){
    			alert("没有此页面！");
    		}else{
    			window.location.href = "allContract.action?index="+theIndex;
    		}
    	}
    	//点击跳转
    	function willGo(totalPageCount){
    		var theIndex = document.getElementById("index").value;
    		if(isNaN(theIndex)){
    			alert("请输入数字！");
    		}else if(theIndex>totalPageCount||theIndex<=0){
    			alert("没有此页面！");
    		}else{
    			window.location.href = "allContract.action?index="+theIndex;
    		}
    		//window.location.href = "allContract.action?index= "+theIndex;
    	}
    	
    	//组合查询
    	function selectAll(){
    		supplierName = document.getElementById("supplierName").value;
    		contractName = document.getElementById("contractName").value;
    	}
    	
    </script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
  <div class="menu">
  <table>
<tbody><tr>
<!-- <td>
<form method="post" action="contractById">
<input name="flag" value="search" class="input-text" type="hidden">
合同编号：<input name="contractId" class="input-text" type="text">&nbsp;<input value="查 询" type="submit"/>
</form>
</td> -->
<td class="colour">
	<form action="allContract" method="post">
		供应商：<input name="supplierName" id="supplierName" class="input-text" type="text" value='<s:property value="supplierName"/>'/>&nbsp;
		合同名称：<input name="contractName" id="contractName" class="input-text" type="text" value='<s:property value="contractName"/>'/>&nbsp;
		<input value="查 询" type="submit" onclick="selectAll()"/>&nbsp;&nbsp;&nbsp;
	</form></td>
<s:if test="#session.user.permission==0">
<td>
<input value="添加" type="button" onclick="javascript:location.href='clickAddContract.action'"/>&nbsp;&nbsp;&nbsp;
</td>
<td><input type="button" value="修改" onclick="updateContract()"/>&nbsp;&nbsp;&nbsp;</td>
<!-- <td><input type="button" value="删除" onclick="deleteContract()"/>&nbsp;&nbsp;&nbsp;</td> -->
<td><input type="button" value="删除" onclick="notShowContract()"/>&nbsp;&nbsp;&nbsp;</td>
<td><input type="button" value="审核" onclick="checkContract()"/>&nbsp;&nbsp;&nbsp;</td>
<!-- <td><input type="button" value="删除" onclick="deleteContract()"/>&nbsp;&nbsp;&nbsp;</td> -->
</s:if>
<s:if test="#session.user.permission==1">
<td>
<input value="添加" type="button" onclick="javascript:location.href='clickAddContract.action'">&nbsp;&nbsp;&nbsp;
</td>
</s:if>
<td><input type="button" value="详细" onclick="detailContract()"/></td>
</tr>
</tbody></table></div>
<div>
	<img src="imgs/excel1.jpg" /><a href="contractDown.action">当前页合同信息Excel下载</a>
	<img src="imgs/excel1.jpg" /><a href="contractAllDown.action">所有合同信息Excel下载</a>
</div>
<hr >
	
	<!-- 获取当前时间 ，格式为xxxx-xx-xx -->
	<s:set name="todayTime" value="new java.sql.Date(new java.util.Date().getTime()).toString()"></s:set>
	<div class="contract">
  	<table  border="1" width="100%" align="center">
  		<tr>
  			<!-- <td>合同编号</td> -->
  			<td class="tableTitle"><input type="checkbox" id="chooseAll" onclick="chooseAll()" /></td>
  			<td class="tableTitle" align="center">供应商</td>
  			<td class="tableTitle" align="center">合同名称</td>
  			<td class="tableTitle" align="center">付款方式</td>
  			<td class="tableTitle" align="center">交易币种</td>
  			<td class="tableTitle" align="center">合同总价</td>
  			<td class="tableTitle" align="center">签订日期</td>
  			<td class="tableTitle" align="center">执行日期</td>
  			<td class="tableTitle" align="center">合同状态</td>
  			<td class="tableTitle" align="center">业务员</td>
  		</tr>
  		<s:if test="contractList!=null">
  			<s:iterator value="contractList" var="contract" status="sta">
  		<tr> 
  				<td><input type="checkbox" name="choose"  value="<s:property value='#contract.contractId'/>"/></td>
  				<input type="hidden" name="contract.supplierId" value='<s:property value="#contract.supplier.supplierId"/>'/>
  				<td><s:property value="#contract.supplier.supplierName"/></td>
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
					href="allContract?index=1">首页</a>
				</td>
				</s:if>
				<s:if test="%{index>1}">
				<td><a class="input-button"
					href="allContract?index=${index -1}">上一页</a>
				</td>
				</s:if>
				<td>
					<a class="input-index">第<s:property value="index"/>页</a>
				</td>
				<s:if test="%{index<totalPageCount}">
				<td><a class="input-button"
					href="allContract?index=${index +1}">下一页</a>
				</td>
				</s:if>
				<s:if test="index<totalPageCount">
				<td><a class="input-button"
					href="allContract?index=${totalPageCount }">尾页</a>
				</td>
				</s:if>
				<td>
					<a class="input-button">共<s:property value="totalPageCount"/>页</a>
				</td>
				<td><input type="text" id="index" size="10" onblur="wantGo(<s:property value="totalPageCount"/>)">
					<input type="button" value="GOTO" onclick="willGo(<s:property value="totalPageCount"/>)">
				</td>
			</tr>
		</table>
  		</div>
  		<br/>
  </body>
</html>
