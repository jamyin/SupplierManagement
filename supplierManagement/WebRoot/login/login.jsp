<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <title>Jquery弹框</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<script src="../jsp/jquery.js" type="text/javascript"></script>
	<script src="../jsp/PopupDiv_v1.0.js" type="text/javascript"></script>
	<script src="../jsp/demo.js" type="text/javascript"></script>
	<script src="../jsp/checkpwd.js" type="text/javascript"></script>
	<script src="../jsp/jquery.validate.js" type="text/javascript"></script>
	<script src="../jsp/index.js" type="text/javascript"></script>
	<link href="../cs/style_pass.css" rel="stylesheet" type="text/css"/>
	<script src="../jsp/cmxforms.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../cs/demo.css" type="text/css" >
	<link rel="stylesheet" href="../cs/PopupDiv.css" type="text/css" >
	<link rel="stylesheet" type="text/css" href="../cs/milk.css" />
	<link rel="stylesheet" type="text/css" href="../cs/chili.css" />
	<link rel="stylesheet" type="text/css" href="../cs/screen.css" />
	<link rel="stylesheet" type="text/css" href="../cs/index.css">
  </head>
  
  <body>
   
     <fieldset style="position:absolute;left:358px;top:160px;width:224px; height:245px;">
		 <div class="user_1"><b>登录</b></div>
		 <form action="" method="post">
			 <div class="user_2">
			 	&nbsp;用户名(手机号码/邮箱地址)<br/>
			 	<input type="text" name="username" maxlength="16" size="27"/><br/>
			 	&nbsp;密码<br/>
			 	<input type="password" name="pass" maxlength="16" size="27"/><br/>
			 </div>
			 <div class="user_3">
			 	<a href="#" style="text-decoration:none">忘记密码</a><br/>
			 	<input type="checkbox" name="VoteOption1" value='1' />记住我的用户名<br/><br/>
			 	<input type="submit" name="submit" value="" class="user_img_1" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 	<input id="PopupDivBtn_35" type="button" name="submit" value="注册" class="user_img_2" /> 
			 </div>
		 </form>
    	</fieldset>
 
    
  
    	<div  id="PopupDiv_35" style="display:none" align="center"><br/>
    	
			<form class="cmxform" id="signupForm" method="post" action="saveUserRegist">
				<p>用户名：<input id="username" name="username" /></p>
				密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" id="password" class="it" size="22"
				maxlength="16" onchange="javascript:EvalPwd(this.value);" onkeyup="javascript:EvalPwd(this.value);"/>
				<table cellpadding="0" cellspacing="0" border="0" id="pwdpower">
				  <tr>
				    <td id="pweak" style="">弱</td>
				    <td id="pmedium" style="">中</td>
				    <td id="pstrong" style="">强</td>
				  </tr>
				</table>
				<p>重复密码：<input id="confirm_password" name="confirm_password" type="password" /></p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email：<input id="email" name="email" size="18"/></p>
				验&nbsp;证&nbsp;码：<input type="text" name="agree" maxlength="4" id="agree" size="5"/><img src="authImg" id="authImg"/><br/><br/>
				<input type="submit" name="submit" value="提交"/>&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"/><br/><br/><br/><br/><br/>
			</form>
		
		</div>
	 
  </body>
</html>
