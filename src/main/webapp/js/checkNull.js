function checkUser1(){
		//获取input标签中该属性的选择器
		var user1 = $("#user_name1").val().trim();
		
		//判断输入项的value是否为空
		if(user1 == ""){
			$("#user_name1").next("span").html("<font color='red'>× 用户名不能为空</font>");
			return false;
		}
		if(user1 != ""){
			$("#user_name1").next("span").html("");			
		}
		return true;
	}
function checkUser2(){
	//获取input标签中该属性的选择器
	var user2 = $("#user_name2").val().trim();
	
	//判断输入项的value是否为空
	if(user2 == ""){
		$("#user_name2").next("span").html("<font color='red'>× 用户名不能为空</font>");
		return false;
	}
	if(user2 != ""){
		$("#user_name2").next("span").html("");
	}
	return true;
}

	function checkPassword1(){
		//获取input标签中该属性的选择器
		var password1 = $("#password1").val().trim();
		
		//判断输入项的value是否为空
		if(password1 == ""){
			$("#password1").next("span").html("<font color='red'>× 密码不能为空</font>");
			return false;
		}
		if(password1 != ""){
			$("#password1").next("span").html("");
		}
		return true;
	}

	function checkConfirmPassword1(){
		//获取input标签中该属性的选择器
		var password1 = $("#password1").val().trim();
		var confirmPassword1 = $("#passwordRepeat1").val().trim();
		
		//判断输入项的value是否为空
		if(confirmPassword1 == ""){
			$("#passwordRepeat1").next("span").html("<font color='red'>× 确认密码不能为空</font>");
			return false;
		}
		//判断两次密码是否匹配
		if(password1 != "" && confirmPassword1 != "" && password1 != confirmPassword1){
			$("#passwordRepeat1").next("span").html("<font color='red'>× 两次密码不一致</font>");
			return false;
		}
		else if(password1 != "" && confirmPassword1 != "" && password1 == confirmPassword1){
		    $("#passwordRepeat1").next("span").html("<font color='#339933'>√ 密码匹配正确</font>"); 
			return true;
		}
		return true;
	}
	
	function checkPassword2(){
		//获取input标签中该属性的选择器
		var password2 = $("#password2").val().trim();
		
		//判断输入项的value是否为空
		if(password2 == ""){
			$("#password2").next("span").html("<font color='red'>× 密码不能为空</font>");
			return false;
		}
		if(password2 != ""){
			$("#password2").next("span").html("");
		}
		return true;
	}

	function checkConfirmPassword2(){
		//获取input标签中该属性的选择器
		var password2 = $("#password2").val().trim();
		var confirmPassword2 = $("#passwordRepeat2").val().trim();
		
		//判断输入项的value是否为空
		if(confirmPassword2 == ""){
			$("#passwordRepeat2").next("span").html("<font color='red'>× 确认密码不能为空</font>");
			return false;
		}
		//判断两次密码是否匹配
		if(password2 != "" && confirmPassword2 != "" && password2 != confirmPassword2){
			$("#passwordRepeat2").next("span").html("<font color='red'>× 两次密码不一致</font>");
			return false;
		}else if(password2 != "" && confirmPassword2 != "" && password2 == confirmPassword2){
		    $("#passwordRepeat2").next("span").html("<font color='#339933'>√ 密码匹配正确</font>"); 
			return true;
		}
		return true;
	}