<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>搜索页面</title>

<link href="${appPath }/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="${appPath }/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css" />

<link href="${appPath }/basic/css/demo.css" rel="stylesheet"
	type="text/css" />

<link href="${appPath }/css/seastyle.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript"
	src="${appPath }/basic/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="${appPath }/js/script.js"></script>
</head>

<body>
	<%@include file="../../../shop/_head2.jsp"%>
	<div class="clear"></div>
	<b class="line"></b>
	<div class="search">
		<div class="search-list">
			<div class="nav-table">
				<div class="long-title">
					<span class="all-goods">全部分类</span>
				</div>
				<div class="nav-cont">
					<ul>
						<li class="index"><a href="${appPath }/home">首页</a>
						</li>
						<li class="qc"><a href="${appPath }/sort">分类</a>
						</li>
						<li class="qc"><a href="#">限时抢</a>
						</li>
						<li class="qc"><a href="#">团购</a>
						</li>
						<li class="qc last"><a href="#">大包装</a>
						</li>
					</ul>
					<div class="nav-extra">
						<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
					</div>
				</div>
			</div>


			<div class="am-g am-g-fixed">
				<div class="am-u-sm-12 am-u-md-12">
					<div class="theme-popover">
						<div class="searchAbout">
							<span class="font-pale">相关搜索：</span>
							<a title="手办" href="${appPath}/shop/search?name=手办">手办</a>
							<a title="电脑" href="${appPath}/shop/search?name=电脑">电脑</a>
							<a title="二次元" href="${appPath}/shop/search?name=二次元">二次元</a>
						</div>

						<div class="clear"></div>
					</div>
					
					<div class="search-content" id="search">
						<div class="sort" id="sort">
							<li class="first"><a title="综合">综合排序</a>
							</li>
							<li><a title="销量">销量排序</a>
							</li>
							<li><a title="价格">价格优先</a>
							</li>
							<li class="big"><a title="评价" href="#">评价为主</a>
							</li>
						</div>
						<div class="clear"></div>

						<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
							<c:if test='${name==null||name.equals("")|| empty produts}' var="flag">
								<div style="margin:0 auto;padding: 180px 350px;">
									<li style="font-size: 18px;color: #404040;">没有找到相关的宝贝</li>
								</div>
							</c:if>
							<c:if test="${!flag }">

								<c:forEach items="${produts }" var="prod">
									<li>
										<div class="i-pic limit">
											<a href="${appPath}/introduction/intro?id=${prod.id}&pageNum=1&minproPageNum=1">${prod.imgurl
												} </a>
											<a href="${appPath}/introduction/intro?id=${prod.id}&pageNum=1&minproPageNum=1"><p class="title fl">${prod.name }</p></a>
											<p class="price fl">
												<b>¥</b> <strong>${prod.salePrice }</strong>
											</p>
											<p class="number fl">
												销量<span>${prod.saleNum }</span>
											</p>
										</div></li>
								</c:forEach>
							</c:if>
						</ul>
					</div>

					<%-- <c:if test='${name!=null && !name.equals("") && !empty produts}'> --%>
						<div class="search-side">
							<div class="side-title">随机推荐</div>

							<li>
								<div class="i-pic check">
									<img src="${appPath }/images/cp.jpg" />
									<p class="check-title">萨拉米 1+1小鸡腿</p>
									<p class="price fl">
										<b>¥</b> <strong>29.90</strong>
									</p>
									<p class="number fl">
										销量<span>1110</span>
									</p>
								</div></li>
							<li>
								<div class="i-pic check">
									<img src="${appPath }/images/cp2.jpg" />
									<p class="check-title">ZEK 原味海苔</p>
									<p class="price fl">
										<b>¥</b> <strong>8.90</strong>
									</p>
									<p class="number fl">
										销量<span>1110</span>
									</p>
								</div></li>
							<li>
								<div class="i-pic check">
									<img src="${appPath }/images/cp.jpg" />
									<p class="check-title">萨拉米 1+1小鸡腿</p>
									<p class="price fl">
										<b>¥</b> <strong>29.90</strong>
									</p>
									<p class="number fl">
										销量<span>1110</span>
									</p>
								</div></li>
						</div>
					<%-- </c:if> --%>
					<div class="clear"></div>
					<!--分页 -->
					<ul class="am-pagination am-pagination-right">
						<li class="am-active"><a href="#">1</a>
						</li>
					</ul>
				</div>
			</div>
			<%@include file="/_foot.jsp"%>
		</div>
	</div>

	</div>
	<!--引导 -->
	<%@include file="/_navigation.jsp"%>

	<!-- 右侧导航栏 -->
	<%@include file="/_rightbtn.jsp"%>
	<!-- ↑引入右侧菜单栏 -->
</body>

</html>
