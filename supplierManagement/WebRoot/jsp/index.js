$.validator.setDefaults({
	submitHandler: function() { alert("submitted!"); }
});

$().ready(function() {
	// validate the comment form when it is submitted
	$("#commentForm").validate();
	
	// validate signup form on keyup and submit
	$("#signupForm").validate({
		rules: {
			username: {
				required: true,
				minlength: 6
			},
			password: {
				required: true,
				minlength: 6
			},
			confirm_password: {
				required: true,
				minlength: 6,
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
			},
			topic: {
				required: "#newsletter:checked",
				minlength: 2
			},
			agree: "required"
		},
		messages: {
			username: {
				required: "用户名不能为空！",
				minlength: "用户名位数太短！"
			},
			password: {
				required: "密码不能为空！",
				minlength: "密码长度不能小于6位！"
			},
			confirm_password: {
				required: "重复密码不能为空！",
				minlength: "密码长度不能小于6位！",
				equalTo: "两次密码不一致！"
			},
			email: "Emeil输入错误！",
			agree: "验证码为空！"
		}
	});
	
	$("#username").focus(function() {
		if(firstname && lastname && !this.value) {
			this.value = firstname + "." + lastname;
		}
	});
	
	var newsletter = $("#newsletter");
	var inital = newsletter.is(":checked");
	var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
	var topicInputs = topics.find("input").attr("disabled", !inital);
	newsletter.click(function() {
		topics[this.checked ? "removeClass" : "addClass"]("gray");
		topicInputs.attr("disabled", !this.checked);
	});
});