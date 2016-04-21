//手机号提示发送验证码
var i=4;
var sendPhoneNo;
function sendPhone(){
	phone_pro.innerHTML="";
	phone_pro.innerHTML="  "+i;
	i--;
	if(i==-1){
		clearTimeout(sendPhoneNo);
		document.getElementById("phone_pro").innerHTML="验证码已经发送";	
	}
}

function sendPhoneMess(){
	var phone=document.getElementById("phoneTel").value;
	var phone_pro=document.getElementById("phone_pro");
	phone_pro.innerHTML="";
	var reg=/^1[0-9]{10}$/;
	if(reg.test(phone)==false){
		phone_pro.innerHTML="手机号输入错误";
		}else{
			phone_pro.innerHTML="  "+5;
			sendPhoneNo = setInterval("sendPhone()",1000);
		}
}

//邮箱发送验证
var sendEmailNo;
var j=4;
function sendEmail(){
	email_pro.innerHTML="";
	email_pro.innerHTML="  "+j;
	j--;
	if(j==-1){
		clearTimeout(sendEmailNo);
		document.getElementById("email_pro").innerHTML="已发送验证码";
	}
}
function sendEmailmess(){
	var email=document.getElementById("email").value;
	var email_pro=document.getElementById("email_pro");
	email_pro.innerHTML="";
	var reg=/^\w+@\w+\.[a-zA-Z]{2,3}$/;
	if(reg.test(email)==false){
		email_pro.innerHTML="邮箱格式错误";
		}else{
			email_pro.innerHTML="  "+5;
			sendEmailNo=setInterval("sendEmail()",1000);
		}
}