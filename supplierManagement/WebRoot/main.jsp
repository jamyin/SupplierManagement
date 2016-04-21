<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<% Object o = request.getSession().getAttribute("user");
            if ( o == null||o.equals("")) {
        %>
        <script language="JavaScript">alert('Login first!');window.location.href='login.jsp'</script>
        <%
        }
        %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>供应商管理系统--首页</title>
    <link type="text/css" rel="stylesheet" href="css/style.css" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>

<frameset rows="80,*" cols="*" frameborder="no" border="0"
	framespacing="0">
	<frame src="head.jsp" name="topFrame" scrolling="no"
		noresize="noresize" id="topFrame" />
	<frameset cols="120,*" frameborder="no" border="0" framespacing="0">
		<frame src="left.jsp" name="leftFrame" scrolling="no"
			noresize="noresize" id="leftFrame" />
		<frame src="welcome.jsp" name="mainFrame" id="mainFrame" />
	</frameset>
	<!-- <frame src="foot.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" /> -->
</frameset>
<body>
  </body>
</html>
