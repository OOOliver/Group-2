//验证邮箱
function checkEmail(emailstr){
	var filter = /[_a-zA-Z\d\-\.]+@[_a-zA-Z\d\-]+(\.[_a-zA-Z\d\-]+)+$/;
	if (filter.test(emailstr)){
		return true;
	}
	else {
		return false;
	}
}