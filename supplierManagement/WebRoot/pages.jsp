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

<title>My JSP 'pages.jsp' starting page</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript">
	function page_nav(name,num) {
		window.location = name+".action?page.index=" + num;
	}

	function jump_to(name,pageno, totalPage) {

		var regexp = /^\d/;
		if (!regexp.test(pageno)) {
			alert("请输入正确的数字！");
			return false;
		}else if (pageno <= 0||pageno > totalPage) {
			alert("没有此页面！");
			return false;
		} else {
			page_nav(name,pageno);
		}
	}

	function testNum(){
		var testNum=document.getElementById("index").value;
		var regexp=/^\d+$/;
		if(!regexp.test(testNum)){
			alert("请输入数字！");
			return false;
		}else if(testNum<=0||testNum>totalPageCount){
			alert("无此页面！");
		}
	}

</script>
<style type="text/css">
	.page-page{
		width: 70%;
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
	<div>
  	<table align="center">
		<tr>
			<s:if test="index>1">
			<td><a class="input-button" href="goodsAction?index=1">首页</a>
			</td>
			</s:if>
			<s:if test="index>1">
			<td><a class="input-button" href="goodsAction?index=${index -1}">上一页</a>
			</td>
			</s:if>
			<td class="input-index">第<s:property value="index"/>页</td>
			<s:if test="index<totalPageCount">
			<td><a class="input-button" href="goodsAction?index=${index +1}">下一页</a>
			</td>
			</s:if>
				<s:if test="index<totalPageCount">
				<td><a class="input-button" href="goodsAction?index=${totalPageCount }">尾页</a>
				</td>
				</s:if>
				<td class="input-button">共<s:property value="totalPageCount"/>页</td>
				<td><input type="text" id="index" value="2" onblur="testNum()" name="index">
				<input type="button" value="GOTO">
				</td>
			</tr>
		</table>
  		</div>
</body>
</html>
