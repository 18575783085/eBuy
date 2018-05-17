<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/10
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="refresh" content="3;url=${appPath}/userlogin">
    <title>登录错误</title>
    <link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="${appPath}/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${appPath}/css/stepstyle.css" rel="stylesheet" type="text/css">

    <script src="${appPath}/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

</head>

<body>
<!--头 -->
<header>
    <article>
        <div class="mt-logo">
        <%@include file="../../../_head.jsp"%>

<div class="center">
    <div class="col-main">
        <div>

            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">登录</strong> / <small>登录出错了</small></div>
            </div>
            <hr/>

            <div style="text-align:center">
            	<c:if test="${checkError == null }">
                    <div style="font-size:20px;line-height:100px">你输入的用户名或者密码错误，请重试</div>
                    <div style="font-size:20px;line-height:100px">3秒后即将跳转回登录页面...</div>
                    <div style="font-size:20px;line-height:100px">没有反应？点击
                    <a href="${appPath}/userlogin">
			          <input value="这里" class="am-btn am-btn-primary am-round" style="width: 60px"/>
			        </a>
			                    跳转</div>
			     </c:if>
			     <c:if test="${checkError != null }">
                    <div style="font-size:20px;line-height:100px">${checkError }</div>
                    <div style="font-size:20px;line-height:100px">3秒后即将跳转回登录页面...</div>
                    <div style="font-size:20px;line-height:100px">没有反应？点击
                    <a href="${appPath}/userlogin">
			          <input value="这里" class="am-btn am-btn-primary am-round" style="width: 60px"/>
			        </a>
			                    跳转</div>
			     </c:if>
            </div>
        </div>
        <!--底部-->
        <%@include file="../../../_foot.jsp"%>
    </div>
</div>

</body>

</html>
