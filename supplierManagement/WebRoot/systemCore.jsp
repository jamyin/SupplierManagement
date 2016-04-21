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
    
    <title>My JSP 'SystemCore.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
	<script src="SpryAssets/systemCore.js" type="text/javascript"></script>
	<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<style type="text/css">
		li{
			margin-left: 10px;
		}
	</style>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<body>
<div>
<div class="div_float"> This is a test Div</div>
<div id="TabbedPanels1" class="TabbedPanels">
  <ul class="TabbedPanelsTabGroup">
    <li class="TabbedPanelsTab" tabindex="0">供应商管理</li>
    <li class="TabbedPanelsTab" tabindex="0">联系人管理</li>
    <li class="TabbedPanelsTab" tabindex="0">合同管理</li>
    <li class="TabbedPanelsTab" tabindex="0">产品管理</li>
    <li class="TabbedPanelsTab" tabindex="0">用户管理</li>
  </ul>
  <div class="TabbedPanelsContentGroup">
    <div class="TabbedPanelsContent">
      <p>供应商管理</p>
     <jsp:include page="suppList.jsp"></jsp:include>
    </div>
    <div class="TabbedPanelsContent">
      <p>联系人管理</p>
      <jsp:include page="contacterList.jsp"></jsp:include>
    </div>
    <div class="TabbedPanelsContent">
      <p>合同管理</p>
      <jsp:include page="contract.jsp"></jsp:include>
    </div>
    <div class="TabbedPanelsContent">
      <p>产品管理</p>
      <jsp:include page="goodsList.jsp"></jsp:include>
    </div>
    <div class="TabbedPanelsContent">
      <p>用户管理</p>
      <jsp:include page="userList.jsp"></jsp:include>
    </div>
  </div>
</div>
</div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
</script>
</body>
</html>
