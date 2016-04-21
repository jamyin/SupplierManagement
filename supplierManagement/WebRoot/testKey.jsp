<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'testKey.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		function onkeyPress(){
			alert("实现回车触发事件！ onkeypress");
		}
		
		function onkeydown(){
			alert("实现回车触发事件！ onkeydown");
		}
		
		function onclick(){
			alert("点击触发事件！onclick");
		}
		
		function b_onclick(){
			alert("你好！");
		}
		function BindEnter(obj){
			//使用document.getElementById获取到按钮对象
			var button = document.getElementById("test");
			if(obj.keyCode == 13){
				button.click();
			}
		/* function b_onclick(){
			alert("你好！");
			function document.onkeydown(){//使用document.getElementById获取到按钮对象
			var button = document.getElementById("test");
			if(event.keyCode == 13){button.click();
			event.returnValue = false;}}
			} */
			
		//此写法火狐浏览器无法执行
/* function document.onkeydown()
{
    if(event.keyCode==13)
    {
        var btn=document.getElementById("btnLogin");
        btn.onclick();
    }
} */
//IE，火狐都支持
/* document.onkeydown = function(e)
{
    var e = window.event   ?   window.event   :   e; 
    if(e.keyCode == 13){
     var btn=document.getElementById("btnLogin");
     btn.onclick();}
} */ 
	</script>

  </head>
  
  <body onkeydown="BindEnter(event)">
    <!-- <input type="button" value="keyPress" onkeypress="onkeyPress()"/>
    <input type="button" value="keyDown" onkeydown="onkeydown()"/>
    <input type="button" value="onclick" onclick="onclick()"/> -->
    <input type="text" name="userName"/>
    <input type="button" value="测试按钮" id="test" onclick="b_onclick()" />
  </body>
</html>
