<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>供应商管理系统--页尾</title>
    <style type="text/css">
    #foot { background:url(../images/header_bg.gif); height:100px; width: 100%; }
    .foot{
    	margin-bottom: 5px;
    }
    .first{
			height: 40px;
		}
    </style>
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
  	<div class="first"></div>
    <h3 id="foot" class="foot" align="center" >上海天坊汇供应链(集团)有限公司 Shanghai SKY-GRADEN Supply Chain Group.,LTD</h3>
  </body>
</html>
