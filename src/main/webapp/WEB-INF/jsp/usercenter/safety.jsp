<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>安全设置</title>

		<link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${appPath}/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/css/infstyle.css" rel="stylesheet" type="text/css">
	</head>

	<body>
		<!--头 -->
		<%@include file="/_head.jsp" %>
		<!-- ↑引入头部文件 -->
				
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<!--标题 -->
					<div class="user-safety">
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账户安全</strong> / <small>Set&nbsp;up&nbsp;Safety</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">
								<c:if test="${User.userInfo.userPhotopath==null}">
									<img class="am-circle am-img-thumbnail" src="${appPath}/images/getAvatar.do.jpg" alt="" />
								</c:if>
								<c:if test="${User.userInfo.userPhotopath!=null}">
									<img class="am-circle am-img-thumbnail" src="${appPath}/images/${User.userInfo.userPhotopath}.jpg" alt="图片无法加载，稍后重试" />
								</c:if>
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>${sessionScope.User.userName}</i></b></div>
								<c:if test="${sessionScope.User.userEmail!=null}">
								<div><b>邮箱：<i>${sessionScope.User.userEmail}</i></b></div>
								</c:if>
                                <div class="safeText">
                                  	<a href="${appPath}/usercenter/safety">账户安全:<em style="margin-left:20px ;">
                                  													</em>高
                                  	</a>
									<div class="progressBar"><span style="left: -95px;" class="progress"></span></div>
								</div>
							</div>
						</div>

						<div class="check">
							<ul>
								<li>
									<i class="i-safety-lock"></i>
									<div class="m-left">
										<div class="fore1">登录密码</div>
										<div class="fore2"><small>为保证您购物安全，建议您定期更改密码以保护账户安全。</small></div>
									</div>
									<div class="fore3">
										<a href="${appPath}/usercenter/password">
											<div class="am-btn am-btn-secondary">修改</div>
										</a>
									</div>
								</li>
								<li>
									<i class="i-safety-iphone"></i>
									<div class="m-left">
										<div class="fore1">手机验证</div>
										<div class="fore2">
											<c:if test="${sessionScope.User.userTelphone==null}">
												<small>您还没有绑定手机呢</small>
											</c:if>
											<c:if test="${sessionScope.User.userTelphone!=null}">
												<small>您绑定手机号码为：${sessionScope.User.userTelphone} 可用于快速找回登录密码</small>
											</c:if>
										</div>
									</div>
									<div class="fore3">
										<a href="${appPath}/usercenter/bindphone">
											<c:if test="${sessionScope.User.userTelphone==null}">
												<div class="am-btn am-btn-secondary">绑定</div>
											</c:if>
											<c:if test="${sessionScope.User.userTelphone!=null}">
												<div class="am-btn am-btn-secondary">修改</div>
											</c:if>
										</a>
									</div>
								</li>
								<li>
									<i class="i-safety-mail"></i>
									<c:if test="${sessionScope.User.userEmail==null}">
									<div class="m-left">
										<div class="fore1">邮箱绑定</div>
										<div class="fore2"><small>绑定邮箱可用于快速找回登录密码</small></div>
									</div>
									<div class="fore3">
										<a href="${appPath}/usercenter/email">
											<div class="am-btn am-btn-secondary">绑定</div>
										</a>
									</div>
									</c:if>
									<c:if test="${sessionScope.User.userEmail!=null}">
										<div class="m-left">
											<div class="fore1">邮箱更换</div>
											<div class="fore2"><small>更换邮箱需要验证你现在邮箱</small></div>
										</div>
										<div class="fore3">
											<a href="${appPath}/usercenter/email">
												<div class="am-btn am-btn-secondary">更换</div>
											</a>
										</div>
									</c:if>
								</li>
							</ul>
						</div>

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