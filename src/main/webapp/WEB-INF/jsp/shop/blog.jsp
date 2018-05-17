<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>新闻页面</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  
   <link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
   <link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
   <link href="${appPath}/css/personal.css" rel="stylesheet" type="text/css">
</head>
<body>
		<!--头 -->
		<%@include file="/_head.jsp" %>
		<!-- ↑引入头部文件 -->
  		
			<b class="line"></b>	
<!--文章 -->
<div class="am-g am-g-fixed blog-g-fixed bloglist">
  <div class="am-u-md-9">
    <article class="blog-main">
      <h3 class="am-article-title blog-title">
        <a href="#">${mallNotice.noticeTitle }</a>
      </h3>
      <h4 class="am-article-meta blog-meta">${mallNotice.noticeTime }</h4>

      <div class="am-g blog-content">
        <div class="am-u-sm-12">
         
          <div>
          	${txt }
          </div>

        </div>
  
      </div>

    </article>


    <hr class="am-article-divider blog-hr">
    <ul class="am-pagination blog-pagination">
    <li class="am-pagination-prev"><a href='${appPath}/shop/laquo?noticeId=${mallNotice.noticeId-1}'>&laquo; 上一页</a></li>
   
    <li class="am-pagination-next"><a href="${appPath }/shop/raquo?noticeId=${mallNotice.noticeId+1}">下一页 &raquo;</a></li>
    	
    </ul>
  </div>

  <div class="am-u-md-3 blog-sidebar">
    <div class="am-panel-group">

      <section class="am-panel am-panel-default">
        <div class="am-panel-hd">热门话题</div>
        <ul class="am-list blog-list">
        	<div class="demo">

                <ul>
                    <c:forEach items="${mallNotices}" var="m">
                    <li style="margin-top: 25px"><a target="_blank" href="${appPath}/shop/blog?noticeId=${m.noticeId}"><span>${m.noticeTitle}</span></a></li>
                    </c:forEach>
                </ul>

            </div>    
        </ul>
      </section>

    </div>
  </div>

</div>

				<!--底部-->
				<%@include file="/_foot.jsp" %>
				<!-- ↑引入底部文件 -->

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="{{assets}}js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${appPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<!--<![endif]-->
<script src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

<!--引导 -->
<%@include file="/_navigation.jsp" %>

<!-- 右侧导航栏 -->
<%@include file="/_rightbtn.jsp" %>
<!-- ↑引入右侧菜单栏 -->
</body>
</html>
