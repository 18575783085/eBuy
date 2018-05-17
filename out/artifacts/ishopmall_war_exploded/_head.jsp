<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>

<%-- <meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
<link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
<link href="${appPath}/css/personal.css" rel="stylesheet" type="text/css">
<link href="${appPath}/css/vipstyle.css" rel="stylesheet" type="text/css">
<script src="${appPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script> --%>

<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<c:if test="${sessionScope.User==null}">
									<div class="menu-hd">
										<a href="${appPath }/userlogin" target="_top" class="h">亲，请登录</a>
										<a href="${appPath }/userRegister" target="_top">免费注册</a>
									</div>
								</c:if>
								<c:if test="${sessionScope.User!=null}">
									<div class="menu-hd">
										<a href="${appPath }/usercenter/index"></a>欢迎回来，尊敬的${sessionScope.User.userName}用户</a>
										<a href="${appPath }/logout" target="_top">注销</a>
									</div>
								</c:if>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="${appPath }/home" target="_top" class="h">商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="${appPath }/usercenter/index" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="${appPath }/shopcart/select" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="${appPath }/usercenter/collection" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
						</ul>
						</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logoBig">
								<li><a href="${appPath}/home"><img src="${appPath}/images/logobig.png" /></a></li>
							</div>

							<div class="search-bar pr">
								<form method="post" action="${appPath }/shop/search">
									<input id="searchInput" name="name" type="text" placeholder="搜索" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit" >
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
		<div class="nav-table">
			<div class="long-title"><span class="all-goods">全部分类</span></div>
			<div class="nav-cont">
				<ul>
					<li class="index"><a href="${appPath }/home">首页</a></li>
					<li class="qc"><a href="${appPath }/sort">商品分类</a></li>
					<li class="qc"><a href="#">限时抢</a></li>
					<li class="qc"><a href="#">团购</a></li>
					<li class="qc last"><a href="#">大包装</a></li>
				</ul>
				<div class="nav-extra">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
					<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>
		</div>
		