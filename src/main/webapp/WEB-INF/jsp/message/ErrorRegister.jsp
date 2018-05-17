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
    <meta http-equiv="refresh" content="3;url=${appPath}/userRegister">
    <title>模板</title>

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
                <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">错误</strong> / <small>你的操作有误</small></div>
            </div>
            <hr/>
            <!--进度条-->
            <div class="m-progress">
                <div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">确认邮件</p>
                            </span>
                    <span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成注册</p>
                            </span>
                    <span class="u-progress-placeholder"></span>
                </div>
                <div class="u-progress-bar total-steps-2">
                    <div class="u-progress-bar-inner"></div>
                </div>

            </div>
            <div style="text-align:center">
                <c:if test="${checkError==null}">
                    <div style="font-size:20px;line-height:100px">无法确认你的身份信息，可能你的验证码或者用户信息不存在</div>
                    <div style="font-size:20px;line-height:100px">3秒后即将跳转注册页面...</div>
                    <div style="font-size:20px;line-height:100px">没有反应？点击
                    <a href="${appPath}/userRegister">
                    	<input value="这里" class="am-btn am-btn-primary am-round" style="width: 60px"/>
                    </a>
                    	跳转</div>
                </c:if>
                <c:if test="${checkError!=null}">
                    <div style="font-size:20px;line-height:100px">${checkError}</div>
                    <div style="font-size:20px;line-height:100px">3秒后即将跳转回注册页面...</div>
                    <div style="font-size:20px;line-height:100px">没有反应？点击
                    <a href="${appPath}/userRegister">
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
