<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'byHand.jsp' starting page</title>
    <script type="text/javascript" src="../jsp/byHand.js"></script>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		#result{
			display: none;
		}
	</style>
  </head>
  <script type="text/javascript">
  	$(function(){
  		$("#test").function({
  			jQuery.Event: "click",
  			title: "用户登录！",
  			type: "id",
  			content: "result",
  		});
  	});
  </script>
  <body>
    <div id="test" align="center">这是一个弹出窗</div>
    <div id="result">
    	<form action="">
    		用户名：<input type="text" value=""/><br/>
    		密码：<input type="text" value=""/><br/>
    		权限：<input type="text" value=""/><br/>
    		<input type="submit" value="登录"><input type="reset" value="重置"/>
    	</form>
    </div>
    
    <div onclick="javascript:alert('这个数据是num')">alert弹出窗</div>
    <div onclick="javascript:confirm('确认弹出窗')">确认弹出窗</div>
    <div onclick="outInf()">确认弹出窗,有返回值</div>
    <script type="text/javascript">
    	function outInf(){
    	var flag=confirm("打开demo？");
    		if(flag){
    			window.location.href="demo.jsp"
    		}
    	}
    </script>
  </body>
</html>
