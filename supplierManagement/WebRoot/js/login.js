// JavaScript Document
//验证码
function changeImg() {
	var a = document.getElementById("mySpan");
	a.innerHTML = '<a href="#" onclick="changeImg()"><input  type="image" title="点击图片刷新验证码"  src="/supplierManagement/random?t='
			+ new Date()
			+ '" /></a> ';
}
	function check() {
		var msg = document.getElementById("msg").value;
		if (msg.length != 0) {
			alert(msg);
			document.getElementById("msg").value = "";
		}
	}
	//用户名称
	function usernameBlur()
	{
		var username=document.getElementById("userName").value;
		if(username==""||username=="null"||username=="undefined"){
			document.getElementById("spanusername").innerHTML="帐号不能为空!";
			 return false;
		}
		if(username.length<2||username.length>20){
			document.getElementById("spanusername").innerHTML="帐号长度2到20!";
			 return false;
		}
		document.getElementById("spanusername").innerHTML="";
		return true;
	}
	//密码
	function pwdBlur()
	{
		var pwd=document.getElementById("password").value;
		if(pwd==""||pwd=="null"||pwd=="undefined"){
			document.getElementById("pwdprompt").innerHTML="密码不能为空!";
			 return false;
		}
		if(pwd.length<4||pwd.length>20){
			document.getElementById("pwdprompt").innerHTML="密码长度4到20!";
			 return false;
		}
		document.getElementById("pwdprompt").innerHTML="";
		return true;
	}
	//验证非空验证验证码
	function checkVerifiCode() {
		var code = document.getElementById("randStr").value;
		if (code == ""||code=="null"||code=="undefined") {
		   $("#verificationspan").html(" 验证不能为空!");
			return false;
		} 
		var fag=/^\d{4}$/;
		if(!fag.test(code)){
			  $("#verificationspan").html(" 验证码错误了!");
			  return false;
		}
		 $("#verificationspan").html("");
		return true;
	}
	/*function loginbtn(){
		if(usernameBlur()&&pwdBlur()&&checkVerifiCode()){
			 return true;
		}else{
			return false;
			}
	}*/
	/*测试版*/
	function loginbtn(){
		if(usernameBlur()&&pwdBlur()){
			return true;
		}else{
			return false;
		}
	}