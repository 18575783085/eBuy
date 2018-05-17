<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>

	<head lang="en">
		<meta charset="UTF-8">
		<title>登录</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" />
		<link href="${appPath}/css/dlstyle.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${appPath }/js/jquery-1.4.2.js"></script>
		
		<script type="text/javascript" src="${appPath }/js/gt.js"></script>
		
		
<style>
        #embed-captcha {
            width: 300px;
            margin: 0 auto;
        }
        .show {
        	text-align:center;
            display: block;
        }
        .hide {
        	text-align:center;
            display: none;
        }
        #notice {
            color: red;
        }
</style>
    
	</head>

	<body>

		<div class="login-boxtitle">
			<a href="${appPath}/home"><img alt="logo" src="${appPath}/images/logobig.png" /></a>
		</div>

		<div class="login-banner">
			<div class="login-main">
				<div class="login-banner-bg"><span></span><img src="${appPath}/images/big.jpg" /></div>
				<div class="login-box">

							<h3 class="title">登录商城</h3>

							<div class="clear"></div>
						
						<div class="login-form">
						  <form action="${appPath}/logining" method="post">
							   <div class="user-name">
								    <label class="lab" for="username"><i class="am-icon-user"></i></label>
								    <input class="inp" type="text" name="username" value="${cookie.remname.value }" id="username" placeholder="邮箱/手机" required>
                 </div>
                 <div class="user-pass">
								    <label class="lab" for="password"><i class="am-icon-lock"></i></label>
								    <input class="inp" type="password" name="password" id="password" placeholder="请输入密码" required>
                 </div>
              
           </div>
            
            <!-- 加入滑动验证 -->
             <div id="embed-captcha"></div>
			 <p id="wait" class="show">正在加载验证码......</p>
			 <p id="notice" class="hide">请先拖动验证码到相应位置</p>
			
            <div class="login-links">
                <label for="remember-me"><input id="remember-me" name="remname" value="true" type="checkbox" ${empty cookie.remname ? "":"checked='checked'" }>记住用户名</label>
								<a href="${appPath}/home" class="am-fr">忘记密码</a>
								<a href="${appPath }/userRegister" class="zcnext am-fr am-btn-default ">注册</a>
								<br />
            </div>
								<div class="am-cf">
									<input id="embed-submit" type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm">
								</div>
					</form>			
				
						<div class="partner">		
								<h3>合作账号</h3>
							<div class="am-btn-group">
								<li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
								<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span> </a></li>
								<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span> </a></li>
							</div>
						</div>	

				</div>
			</div>
		</div>

<!-- 底部 -->
					<%@ include file="/_foot.jsp" %>
					
	</body>
<script>
    var handlerEmbed = function (captchaObj) {
        $("#embed-submit").click(function (e) {
            var validate = captchaObj.getValidate();
            if (!validate) {
                $("#notice")[0].className = "show";
                setTimeout(function () {
                    $("#notice")[0].className = "hide";
                }, 2000);
                e.preventDefault();
            }
        });
        // 将验证码加到id为captcha的元素里，同时会有三个input的值：geetest_challenge, geetest_validate, geetest_seccode
        captchaObj.appendTo("#embed-captcha");
        captchaObj.onReady(function () {
            $("#wait")[0].className = "hide";
        });
    };
    $.ajax({
        // 获取id，challenge，success（是否启用failback）
        url: "${appPath}/loginValistr/StartCaptcha.do", // 加随机数防止缓存
        type: "get",
        dataType: "json",
        success: function (data) {
            // 使用initGeetest接口
            // 参数1：配置参数
            // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它做appendTo之类的事件
            initGeetest({
                gt: data.gt,
                challenge: data.challenge,
                product: "popup", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
                offline: !data.success // 表示用户后台检测极验服务器是否宕机，一般不需要关注
            }, handlerEmbed);
        }
    });
</script>

</html>