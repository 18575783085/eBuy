<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>修改密码</title>

		<link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${appPath}/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="${appPath}/js/jquery-1.7.2.min.js"></script>
		<script src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
	</head>

	<body>
	<!--头 -->
		<%@include file="/_head.jsp" %>
		<!-- ↑引入头部文件 -->
		
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<form class="am-form am-form-horizontal" method="post" action="${appPath}/usercenter/passwordreplace">
						<div class="am-form-group">
							<label for="user-old-password" class="am-form-label">原密码</label>
							<div class="am-form-content">
								<input type="hidden" id="password" name="password" value="${sessionScope.User.userPassword}"/>
								<input type="hidden" id="username" name="username" value="${sessionScope.User.userName}"/>
								<input type="password" id="user-old-password" name="oldPassword" onblur="checkPassword()"  placeholder="请输入原登录密码" required>
								<span></span>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-new-password" class="am-form-label">新密码</label>
							<div class="am-form-content">
								<input type="password" id="user-new-password" name="newPassword" onblur="checkPassword2()" placeholder="由数字、字母组合" required>
								<span></span>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-confirm-password" class="am-form-label">确认密码</label>
							<div class="am-form-content">
								<input type="password" id="user-confirm-password" name="newPassword2" onblur="checkPassword3()" placeholder="请再次输入上面的密码" required>
								<span></span>
							</div>
						</div>
						<div style="text-align:center;color:red" colspan="2" value=${checkError}>
						<!-- 如果校验失败, 在此处获取提示消息提示用户 -->
						${requestScope.checkError}
						</div>
						<div class="info-btn">
							<%-- <a href="${appPath}/usercenter/passwordreplace">
								<div class="am-btn am-btn-danger" >保存修改</div>
							</a> --%>
								<input value="保存修改" class="am-btn  am-btn-danger am-round" type="submit"/>
						</div>
					</form>
					
				</div>
				<!--底部-->
				<%@include file="/_foot.jsp" %>
				<!-- ↑引入底部文件 -->
				
			</div>

			<!-- 菜单menu -->
			<%@include file="/_menu.jsp" %>
			<!-- ↑引入左侧菜单栏 -->
			
		</div>

<!--引导 -->
<%@include file="/_navigation.jsp" %>

<!-- 右侧导航栏 -->
<%@include file="/_rightbtn.jsp" %>
<!-- ↑引入右侧菜单栏 -->
	</body>
<script type="text/javascript">
	/* 密码验证 */
	function checkPassword(){
		$("input[name='oldPassword']").next("span").html("");
		var oldPassword = $("input[name='oldPassword']").val().trim();
		var password = $("input[name='password']").val().trim();
		if(oldPassword==""){
			$("input[name='oldPassword']").next("span").html("<font color='red'>原登录密码不能为空</font>");
			return false; 
		}else{
		$("input[name='oldPassword']").next("span").load(
						"${appPath}/usercenter/checkPassword.do",
						{"oldPassword":oldPassword,"password":password}
					);
		}
	}
	function checkPassword2(){
		$("input[name='newPassword']").next("span").html("");
		var newPassword = $("input[name='newPassword']").val().trim();
		if(newPassword==""){
			$("input[name='newPassword']").next("span").html("<font color='red'>新登录密码不能为空</font>");
		}
	}
	function checkPassword3(){
		$("input[name='newPassword2']").next("span").html("");
		var newPassword = $("input[name='newPassword']").val().trim();
		var newPassword2 = $("input[name='newPassword2']").val().trim();
		if(newPassword2==""){
			$("input[name='newPassword2']").next("span").html("<font color='red'>确认密码不能为空</font>");
			return false; 
		}else{
			if(newPassword!=newPassword2){
			$("input[name='newPassword2']").next("span").html("<font color='red'>两次密码输入不一致</font>");
			return false; 
			}
		}	
	}
	
</script>
</html>

