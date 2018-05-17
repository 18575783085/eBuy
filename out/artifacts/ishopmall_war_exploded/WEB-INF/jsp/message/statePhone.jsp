<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>
			<c:if test="${checkError==null }">
				绑定成功
			</c:if>
			<c:if test="${checkError!=null }">
				绑定失败
			</c:if>
		</title>

		<link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${appPath}/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="${appPath}/js/jquery-1.7.2.min.js"></script>
		<script src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript" src="${appPath}/js/jquery.cookie.js"></script>
		<script type="text/javascript" src="${appPath}/js/registerCheck.js"></script>
		<script type="text/javascript" src="${appPath}/js/checkNull.js"></script>

		<meta http-equiv="refresh" content="3;url=${appPath}/userCenter/index.jsp">
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
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">
														绑定手机
												</strong> / <small>Bind&nbsp;Phone</small>
						</div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<c:if test="${checkError==null }">
							<div class="m-progress-list">
								<span class="step-2 step">
	                                <em class="u-progress-stage-bg"></em>
	                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
	                                <p class="stage-name">
											绑定手机
	                                </p>
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
						</c:if>
						<c:if test="${checkError!=null }">
							<div class="m-progress-list">
								<span class="step-1 step">
	                                <em class="u-progress-stage-bg"></em>
	                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
	                                <p class="stage-name">
											绑定手机
	                                </p>
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
						</c:if>
						
					</div>
					
					<div style="text-align:center">
						<c:if test="${checkError==null }">
			                <div style="font-size:20px;line-height:100px">恭喜您，绑定手机号码成功！！！</div>
			                <div style="font-size:20px;line-height:100px">3秒后即将跳转你的个人中心......</div>
			                <div style="font-size:20px;line-height:100px">没有反应？点击
			                	<a href="${appPath}/userCenter/index.jsp">
			                	<input value="这里" class="am-btn am-btn-primary am-round" style="width: 60px"/>
			                	</a>
			                	前往登录
			                </div>
		                </c:if>
		                <c:if test="${checkError!=null }">
			                <div style="font-size:20px;line-height:100px"><font style="color: red">${checkError}</font></div>
			                <div style="font-size:20px;line-height:100px">3秒后即将跳转你的个人中心......</div>
			                <div style="font-size:20px;line-height:100px">没有反应？点击
			                	<a href="${appPath}/userCenter/index.jsp">
			                	<input value="这里" class="am-btn am-btn-primary am-round" style="width: 60px"/>
			                	</a>
			                	前往登录
			                </div>
		                </c:if>
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