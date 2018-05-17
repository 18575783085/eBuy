<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/11/10
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

    <title>模板</title>

    <link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

    <link href="${appPath}/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${appPath}/css/stepstyle.css" rel="stylesheet" type="text/css">

    <script src="${appPath}/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
	<script type="text/javascript" src="${appPath}/js/jquery.cookie.js"></script>
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
                <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">确认邮件</strong> / <small>请登录邮箱确认</small></div>
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
            <div style="text-align:center;font-size:30px;line-height:100px">
                <div>邮件已发送成功至${emailAddress}，请登录你的邮箱点击链接进行注册</div>
                <%-- 隐藏域用于重新发送用户注册信息 --%>
                <div>${emailResend}</div>
                <form action="${appPath}/register/resendEmail.do" method="post">
                    <input type="hidden" value="${emailAddress}" name="email" id="email">
                    <input type="hidden" value="${useruid}" name="userid" id="userid">
                    <input type="hidden" value="${code}" name="code" id="code">
                    <div>邮件未收到？点击
                        <button type="submit" class="am-btn am-btn-primary">重新发送</button> 进行发送
                    </div>
                </form>
                <div>已经点击链接？点击<a href="${appPath}/userlogin">
                <input value="这里" class="am-btn am-btn-primary am-round" style="width: 60px"/>
                	</a>
                	前往登录
                </div>
            </div>
        </div>
        <!--底部-->
        <%@include file="../../../_foot.jsp"%>
    </div>
</div>

<script>
	  $(function(){
        /*防刷新：检测是否存在cookie*/
        if($.cookie("reSend")){
        	//创建Cookie
            var count = $.cookie("reSend");
            //获取"发送"按钮
            var btn = $("#reSendEmail");
            btn.val(count+"秒").attr("disabled",true).css("cursor","not-allowed");
            var resend = setInterval(function(){
                count--;
                if (count > 0){
                    btn.val(count+"秒").attr("disabled",true).css("cursor","not-allowed");
                    $.cookie("reSend", count, {path: "/", expires: (1/86400)*count});
                }else {
                    clearInterval(resend);// 停止计时器 
                    // 启用按钮 
                    btn.val("重新发送").removeClass("disabled").removeAttr("disabled").css("cursor","pointer");
                    
                    
                    
                }
            }, 1000);
         }
        /*点击改变按钮状态*/
        $("#reSendEmail").click(function(){
            var btn = $(this);
            var count = 60;//间隔函数，1秒执行
			var resend = setInterval(function(){
                count--;
                if (count > 0){
                    btn.val(count+"秒");
                    $.cookie("reSend", count, {path: "/", expires: (1/86400)*count});
                }else {
                    clearInterval(resend);// 停止计时器 
                    // 启用按钮 
                    btn.val("重新发送").removeAttr("disabled").css("cursor","pointer");
                    <%----%>
                    <%--$("#reSendEmail").load(--%>
                        <%--var email =$("#email");--%>
                        <%--var userid =$("#userid");--%>
                        <%--var code=$("#code");--%>
	                    <%--"${appPath}/register/resendEmail.do",--%>
	                    <%--{"email" : email,"userid" : userid,"code" : code}--%>
               		 <%--);--%>
                }
            }, 1000);
            btn.attr("disabled",true).css("cursor","not-allowed");
       	 });
   	});
</script>


</body>

</html>
