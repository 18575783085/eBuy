<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>评价管理</title>

		<link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${appPath}/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/css/cmstyle.css" rel="stylesheet" type="text/css">

		<script src="${appPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	</head>

	<body>
		<!--头 -->
		<%@include file="/_head.jsp" %>
		<!-- ↑引入头部文件 -->
		
		<b class="line"></b>
		<form name="comment" method="post">
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">评价管理</strong> / <small>Manage&nbsp;Comment</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有评价</a></li>
								<li><a href="#tab2">有图评价</a></li>

							</ul>
							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">

									<div class="comment-main">
										<div class="comment-list">
											<ul class="item-list">

												
												<div class="comment-top">
												
													<div class="th th-price">
														<td class="td-inner">评价	</td>
													</div>
													<div class="th th-item">
														<td class="td-inner">商品</td>
													</div>													
												</div>
												
												<c:forEach items="${commentList}" var="c" varStatus="status">
											
													<li class="td td-item">
														<div class="item-pic">
															<a href="#" class="J_MakePoint">
															${c.prodsInfo.imgurl.substring(0,c.prodsInfo.imgurl.indexOf(","))}
															</a>
														</div>
													</li>
													<li class="td td-comment">
														<div class="item-title">
															<div class="item-opinion">好评</div>
														</div>
														<div class="item-comment">
															${c.content}
														</div>
														<div class="item-info">
															<div class="item-name">
																<a href="#">
																	<p class="item-basic-info">${c.prodsInfo.name}</p>
																</a>
															</div>
															<div>
																<p class="info-little"><span>颜色：12#玛瑙</span> <span>包装：裸装</span> </p>
																<p class="info-time"><fmt:formatDate value="${c.contentTime}" pattern="yyyy-MM-dd"/></p>
	
															</div>
													</div>
												</li>
												</c:forEach>
												<div align="right">
							                        	共<i class="blue">${page.total}</i>条记录，当前显示第&nbsp;
							                        	<i class="blue">${page.pageNum}/${page.pages}</i>&nbsp;页
									                    <a href="${appPath}/usercenter/comment?page=${page.firstPage}">首页</a>
												        <a href="${appPath}/usercenter/comment?page=${page.nextPage}">下一页</a>
												        <a href="${appPath}/usercenter/comment?page=${page.prePage}">上一页</a>
												        <a href="${appPath}/usercenter/comment?page=${page.lastPage}">最后页</a>
							                    </div>
											</ul>
												
										</div>
									</div>									
								</div>
							</div>
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
		</form>

<!--引导 -->
<%@include file="/_navigation.jsp" %>

<!-- 右侧导航栏 -->
<%@include file="/_rightbtn.jsp" %>
<!-- ↑引入右侧菜单栏 -->
	</body>

</html>