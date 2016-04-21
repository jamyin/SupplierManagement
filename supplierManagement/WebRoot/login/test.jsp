<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>../js/jquery-2.1.1.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>../js/jquery-2.1.1.min.js"></script>
    <link rel="stylesheet" href="" type="text/css"></link>
    <script type="text/javascript">
    	/* $(document).ready(function(){
    		$("#test1").click(function(){
    			$(this).hide();
    		});
    	});
    	$(document).ready(function(){
  		$("p").click(function(){
    	$(this).hide();
 		 });
		}); */
		/* $(document).ready(function(){
  $("button").click(function(){
    $("#test").hide();
  });
}); */

	$(document).ready(function(){
  $("button").click(function(){
    $("#div1").fadeOut();
    $("#div2").fadeOut("slow");
    $("#div3").fadeOut(3000);
  });
});
    </script>
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
    <!-- <input id="test1" type="button" value="点击消失"><br/> -->
    <!-- <p id="test">this is a test button,click it will lost</p>
    <p>click it will lost</p>
    <p>will lost</p> -->
    <!-- <p>如果您点击我，我会消失。</p>
	<p>点击我，我会消失。</p>
	<p>也要点击我哦。</p> -->
	
	<!-- <h2>This is a heading</h2>
	<p>This is a paragraph.</p>
	<p id="test">This is another paragraph.</p>
	<button type="button">Click me</button> -->
	
	<p>演示带有不同参数的 fadeOut() 方法。</p>
<button>点击这里，使三个矩形淡出</button>
<br><br>
<div id="div1" style="width:80px;height:80px;background-color:red;"></div>
<br>
<div id="div2" style="width:80px;height:80px;background-color:green;"></div>
<br>
<div id="div3" style="width:80px;height:80px;background-color:blue;"></div>
  </body>
</html>
