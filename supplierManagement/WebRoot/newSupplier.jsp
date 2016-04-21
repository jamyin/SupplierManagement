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
    
    <title>供应商核心管理</title>
    <script src="js/SpryTabbedPanels.js" type="text/javascript"></script>
	<link href="css/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
	<!-- <link type="text/css" rel="stylesheet" href="css/style.css" /> -->
	<%-- <style type="text/css">
		li{
			margin-left: 10px;
		}
	</style> --%>
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
    <s:set name="todayTime" value="new java.sql.Date(new java.util.Date().getTime()).toString()"></s:set>
   <!--  <div class="menu">
    </div>
    <div class="allStyle clearfix">
    	<input class="input-button" type="button" value="查询">
    	<input onclick="window.open('newAdd.jsp', 'newwindow')" class="input-button" type="button" value="增加">
    	<input class="input-button" type="button" value="修改">
    	<input class="input-button" type="button" value="删除">
    </div> -->
    <div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0" >供应商信息&nbsp;&nbsp;</li>
    <li class="TabbedPanelsTab" tabindex="0" >合同信息&nbsp;&nbsp;</li>
    <li class="TabbedPanelsTab" tabindex="0" >产品信息&nbsp;&nbsp;</li>
    <li class="TabbedPanelsTab" tabindex="0" >联系人信息&nbsp;&nbsp;</li>
    <!-- <li class="TabbedPanelsTab" tabindex="0" >用户信息&nbsp;&nbsp;</li> -->
  </ul>
  
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent">
    <!-- 供应商信息 -->
    <jsp:include page="suppList.jsp"></jsp:include>
    </div>
    <div class="TabbedPanelsContent">
    <!-- 合同信息 -->
    <jsp:include page="contract.jsp"></jsp:include>
    </div>
     <div class="TabbedPanelsContent">
     <!-- 产品信息 -->
     <jsp:include page="goodsList.jsp"></jsp:include>
    </div>
  <div class="TabbedPanelsContent">
  <!-- 联系人信息 -->
  	<jsp:include page="contacterList.jsp"></jsp:include>
    </div>
    <%-- <div class="TabbedPanelsContent">
    <!-- 用户信息 -->
    	<jsp:include page="userList.jsp"></jsp:include>
    </div> --%>
  </div>
</div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
  </body>
</html>
