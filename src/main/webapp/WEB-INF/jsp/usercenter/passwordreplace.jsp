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
							<span class="step-1 step">
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
					<div style="text-align:center;color:green" colspan="2">
						<span>密码修改成功</span>
					</div>

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

