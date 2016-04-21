<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
  <!-- 下面这段不注销的话，jquery无法显示，这是什么原因 -->
    <%-- <base href="<%=basePath%>"> --%>
    
    <title>My JSP 'jquery.jsp' starting page</title>
    <script type="text/javascript" src="../js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="../jsp/manhuaDialog.1.0.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
  $("#hide").click(function(){
  $("p").hide(1000);
  });
  $("#show").click(function(){
  $("p").show(1000);
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
    <button type="button" id="hide">隐藏</button><button type="button" id="show">显示</button>
<p>这是一个段落。</p>
<p>这是另一个段落。</p>
  </body>
</html>
