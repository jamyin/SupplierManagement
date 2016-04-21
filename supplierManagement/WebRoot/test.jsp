<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript">
    function clickMe() {
    alert("hi");
    //window.open(/supplierManagement/login.jsp);
    //window.open("login.jsp");
    //window.open("findAllContacter.action");
    window.open("addSupplier.action");    
    
	}
	</script>    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	function my_change() {
		alert("xxxx");
	} 
	
	//test javaScript
	function changeText(){
		document.getElementById("changeOne").innerHTML = "这是一个测试javaScript！"//.innerHTML是对各种标签内部而言
		document.getElementById("changeTwo").value = "这是一个测试javaScript！"//.value是对input这种而言
	}
	
	</script>

  </head>
  
  <body>
 <!--  <center>
  <h2 style="color: pink " align="center">==================测试专用=====================</h2>
  <h2 align="center"><input type="button"  value="测试" onclick="clickMe()" /></h2>
  <select name="jam" id="jam" onchange="my_change()"><option selected>=请选择=</option><option>222</option></select>
  </center> -->
  <button type="button" onclick="changeText()">click it</button>
  <h5 id="changeOne">This is test javaScript</h5>
  <input type="text" id="changeTwo" value="changeTwo"/>
  <h4>计算</h4>
  <input type="text" id="numOne" /><input type="text" id="numTwo" onblur="countNum()"/><input type="text" id="numCount"/>
  <input type="button" id="testOne" value="click" onclick="testOne()"/>
  <br>
  <input type="button" value="点击" onclick="welcome('天坊汇','大礼包')"/><input type="text" id="testReturn" value="" onclick="testReturn()"/>
  </body>
  <script type="text/javascript">
  	function countNum(){
  		numOne = document.getElementById("numOne").value;
  		numTwo = document.getElementById("numTwo").value;
  		document.getElementById("numCount").value = numOne*numTwo;
  	}
  	function testOne(){
  		var testOne = 'hello';
  		alert(testOne.length+"和"+testOne.valueOf()+"和"+testOne.toUpperCase()+"和"+testOne);
  	}
  	 function welcome(name,gift){//按顺序传参数
  	 	alert("很是期待 "+name+" 的精品 "+gift);
  	 }
  	
  	function testReturn(){
  		var x = 5;
  		return x; 
  	}
  	
  	//var testReturn = testReturn();
  	document.getElementById("testReturn").value = testReturn()
  </script>
  
</html>
