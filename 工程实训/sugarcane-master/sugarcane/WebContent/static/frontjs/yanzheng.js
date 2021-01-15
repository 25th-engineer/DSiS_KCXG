function check_password() {
	if ($("#password").val() != $("#checkPWD").val()){
		alert("请保证两次输入密码的一致性！");
		$("#checkPWD").focus();
	}
}
/*function check_email() {
	var reg = /\w+[@]{1}\w+[.]\w+/;
	if (!reg.test($("#checkemail").val())){
		alert("请输入正确的email！");
		$("#email").focus();
	}
}*/
/*function check_phone() {
	var reg = /^1[34578]\d{9}$/;
	if (!reg.test($("#phone").val())){
		alert("请输入正确的手机号！");
		$("#phone").focus();
	}
}*/