<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>验证邮箱</title>

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
						<c:if test="${sessionScope.User.userEmail==null}">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">绑定邮箱</strong> / <small>Email</small></div>
						</c:if>
						<c:if test="${sessionScope.User.userEmail!=null}">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">更换邮箱</strong> / <small>Email</small></div>
						</c:if>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
								<p class="stage-name"><c:if test="${sessionScope.User.userEmail==null}">绑定</c:if><c:if test="${sessionScope.User.userEmail!=null}">更换</c:if>邮箱</p>
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
					<form class="am-form am-form-horizontal" action="${appPath}/usercenter/AddEmail.do">
						<div class="am-form-group">
							<label for="userEmail" class="am-form-label"><c:if test="${sessionScope.User.userEmail==null}">绑定</c:if>邮箱</label>
							<div class="am-form-content">
								<input type="email" id="userEmail" name="userEmail" placeholder="请输入邮箱地址">
							</div>
						</div>
						<c:if test="${sessionScope.User.userEmail!=null}">
							<div class="info-btn">
								<button class="am-btn am-btn-danger" type="submit">保存修改</button>
							</div>
						</c:if>
						<c:if test="${sessionScope.User.userEmail==null}">
							<div class="info-btn">
								<button class="am-btn am-btn-danger" type="submit">添加邮箱</button>
							</div>
						</c:if>
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

</html>