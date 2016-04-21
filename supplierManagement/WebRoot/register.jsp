<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>天坊汇会员注册</title>
    <script type="text/javascript" src="kindeditor-4.1.10/jquery-1.8.0.min.js"></script>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/login.css" type="text/css"></link>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/login.js"></script>
    <script charset="utf-8" src="kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor-4.1.10/lang/zh_CN.js"></script>
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
  <!-- 获取当前时间 ，格式为xxxx-xx-xx -->
	<s:set name="todayTime" value="new java.sql.Date(new java.util.Date().getTime()).toString()"></s:set>
  <div align="center" class="register">
    <h3>天坊汇供应商管理会员注册</h3>
    <form action="register.action" method="post" onsubmit="return loginbtn()">
    		用户帐号:<input class="inputText" type="text" name="user.userName" value="" onblur="usernameBlur()" id="userName"/><br>
    		用户密码:<input class="inputText" type="password" name="user.password" value="" onblur="pwdBlur()" id="password"/><br>
    		<!-- <input class="inputText" type="hidden" name="user.createDate" value="" onclick="WdatePicker()" value=""/> -->
    		用户权限:<select name="user.permission" class="inputText">
    					<option value="2">请选择</option>
    					<!-- <option value="0">管理员</option> -->
    					<option value="1">录入员</option>
    					<option value="2">查询员</option>
    				</select><br>
    		<textarea  readonly="readonly" style="width: 500; height: 200">
    					所有用户注意：
    					这是供应商管理测试版（bata1.1）,所有用户都可以注册所有权限，包括管理员和查询员，所有同事可以注册两种权限体验系统。
    					希望各位同事在体验过程中发表自己宝贵意见，有设计不合理和有缺陷的地方，可以和阿甘或者charlie说明，我们会收集意见并合理处理。
    					谢谢大家的宝贵意见！
    					                                                                                       -----信息部全体
    				</textarea>
    		<span class="spanred" id="spanusername" style="size: 10px"></span><br /> 
    		<span class="spanred" id="pwdprompt"></span><br /> 
    		<span class="spanred" id="createDate"></span><br /> 
    		<input type="hidden" name="user.flag0" value="0" />
    		<!-- <input type="hidden" name="user.permission" value="1"/> -->
			<input type="submit" class="input-button" name="submit" value="注册" onclick="return confirm('提交成功，需要系统管理员审核，但你拥有查询员权限！')"/>&nbsp;&nbsp;&nbsp;<input class="input-button" type="reset" name="reset" value="重置"/>&nbsp;&nbsp;&nbsp;<input class="input-button" type="button" value="返回" onclick="javascript:history.go(-1)"/>
    </form>
   </div>
  </body>
  <script type="text/javascript">
  	$(function(){
  		KindEditor.ready(function(K) {
                var editor1 = K.create('#registerAttention', {
                    //自定义工具栏
                	items:[
					        'code', '|', 'justifyleft', 'justifycenter', 'justifyright',
					        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent',
					        'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen',
					        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
					        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
					        'insertfile', 'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
					        'anchor', 'link', 'unlink'
					],
					uploadJson : 'ImgUpload.action', //图片上传Action
					allowImageRemote : false //取消网络图片上传
				});
        });
       })
  </script>
</html>
