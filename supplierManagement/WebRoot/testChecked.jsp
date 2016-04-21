<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'testChecked.jsp' starting page</title>
    <script type="text/javascript">
function checkbox(){
var str=document.getElementsByName("box");
alert(str);
var objarray=str.length;
var chestr="";
for (i=0;i<objarray;i++){
  if(str[i].checked == true){
  alert(chestr);
   chestr=str[i].value;
   alert(chestr);
  }
}
if(chestr == ""){
  alert("请先选择一个爱好～！");
}else{
  alert("您先择的是："+chestr);
}
}
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
    <input type="checkbox" name="box" id="box1" value="跳水" />跳水
  <input type="checkbox" name="box" id="box2" value="跑步" />跑步
  <input type="checkbox" name="box" id="box3" value="听音乐" />听音乐
  <input type="button" name="button" id="button" onclick="checkbox()" value="提交" /> 
  </body>
</html>
