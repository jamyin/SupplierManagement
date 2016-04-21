<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript">
    	function exitSystem(){
    	//var flag=confirm("您确定要退出系统");
    	if(confirm("您确定要退出系统")){
    	 //window.location.href="exitSystem.action";
    	 window.parent.location.href="login.jsp";
    	// window.location.href="exit.action";
    	}else{
    		window.parent.location.href="main.jsp";
    		//back;//无法实现
    		//return;//无法实现
    		//back();//无法实现
    		//如果不写else，会出现框架的leftMain实现推出
    	}
    	}
    	
    </script>
    <style type="text/css">
    	/* a:LINK {
	cursor:pointer;
	border:0;
	font-size:14px;
	font-weight:bold;
	padding:4px 14px;
	background:url(../images/button_bg.png) no-repeat;
	color:#fff;
	overflow:visible;
}
	a:VISITED {
	cursor:pointer;
	border:0;
	font-size:14px;
	font-weight:bold;
	padding:4x 14px;
	background:url(../images/button_bg.png) no-repeat;
	color:#888888;
	overflow:visible;
} */
	
	/* .leftType{
	cursor:pointer;
	border:0;
	font-size:19px;
	font-weight:bold;
	padding:3px 16px;
	background:url(../images/button_bg.png) no-repeat;
	color:#fff;
	overflow:visible;
	} */
	
	
	
    </style>
    
    <title>My JSP 'left.jsp' starting page</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body class="frame-bd">
<ul class="left-menu">
	<li><frame src="index.jsp" target="mainFrame"></frame></li>
	<!--非图片  -->
	<!-- <li><a href="getSupplierList.action" target="mainFrame"><h4 class="input-button">供应商管理</h4></a></li>
	<li><a href="getContacterList.action" target="mainFrame" ><h4 class="input-button">联系人管理</h4></a></li>
	<li><a href="allContract.action" target="mainFrame"><h4 class="input-button">合同管理</h4></a></li>
	<li><a href="goodsAction.action" target="mainFrame"><h4 class="input-button">产品管理</h4></a></li>
	<li><a href="userAction.action" target="mainFrame"><h4 class="input-button">用户管理</h4></a></li>
	<li><a href="findOverSuppList" target="mainFrame" ><h4 class="input-button">过期管理</h4></a></li>
	<li><a href="window.open('newIntroduce.jsp','newwindow','toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no')"><h4 class="input-button">系统介绍</h4></a></li>
	<li><a href="#" onclick="exitSystem()" ><h4 class="input-button">退出系统</h4></a></li> -->
	
	<!-- <li><a href="#" onclick="exitSystem()" ><input type="button" class="input-button" value="退出系统"/></a></li> -->
	
	<!-- 图片实现右侧管理 -->
	<li><a href="getSupplierList.action" target="mainFrame"><img src="images/btn_suppliers.gif" /></a></li>
	<li><a href="getContacterList.action" target="mainFrame" ><img src="images/btn_link.gif" /></a></li>
	<li><a href="allContract.action" target="mainFrame"><img src="images/btn_contract.gif" /></a></li>
	<li><a href="goodsAction.action" target="mainFrame"><img src="images/btn_products.gif" /></a></li>
	<li><a href="userAction.action" target="mainFrame"><img src="images/btn_user.gif" /></a></li>
	<li><a href="findOverSuppByField" target="mainFrame" ><img src="images/past.gif" /></a></li>
	<!-- <li><a href="center.jsp" target="mainFrame" ><img src="images/btn_tlak.gif" /></a></li> -->
	<li><a href="#" onclick="exitSystem()" ><img src="images/btn_exit.gif" /></a></li>
	<!-- <li><a href="exit"><img src="images/btn_exit.gif" /></a></li> -->
	<!-- <li><a href="allTable.action" target="_blank"><img src="images/btn_suppliers.gif" /></a></li> -->
	<!-- <li><a href="userTest.jsp" target="mainFrame"><img src="images/btn_users.gif" /></a></li> -->
</ul>
</body>
</html>
