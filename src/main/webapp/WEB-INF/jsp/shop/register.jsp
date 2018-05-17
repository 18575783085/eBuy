<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>

	<head lang="en">
		<meta charset="UTF-8">
		<title>用户注册</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
		<link href="${appPath}/css/dlstyle.css" rel="stylesheet" type="text/css">
		<script src="${appPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
		<script type="text/javascript" src="${appPath}/js/jquery.cookie.js"></script>
		<script type="text/javascript" src="${appPath}/js/registerCheck.js"></script>
		<script type="text/javascript" src="${appPath}/js/checkNull.js"></script>
	</head>

	<body>

		<div class="login-boxtitle">
			<a href="${appPath}/home"><img alt="" src="${appPath}/images/logobig.png" /></a>
		</div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<span></span><img src="${appPath}/images/big.jpg" />
			</div>
			<div class="login-box">

				<div class="am-tabs" id="doc-my-tabs">
					<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
						<li class="am-active"><a href="">邮箱注册</a>
						</li>
						<li><a href="">手机号注册</a>
						</li>
					</ul>

					<div class="am-tabs-bd">
						<div class="am-tab-panel am-active">
							<form action="${appPath }/register/register.do" method="post">

								<div class="user-username">
									<label class="lab" for="user_name1"><i class="am-icon-user"></i>
									</label> <input class="inp" type="text" name="userName" id="user_name1" placeholder="请输入用户名"
										value="" onblur="checkUser1()" maxlength="10" title="不能超过10个字符" required 
										>
										<span></span>

								</div>
								<div class="user-email">
									<label class="lab" for="email"><i class="am-icon-envelope-o"></i>
									</label> <input class="inp" type="email" name="userEmail" id="email" placeholder="请输入邮箱账号"
										value="${param.userEmail }" onblur="checkUserEmail()" required
										>
									<span id="userEmail_msg"></span>
								</div>
								<div class="verification">
									<label class="lab" for="code2"><i class="am-icon-code-fork"></i>
									</label> <input class="inp" type="tel" name="valistr" id="code2" placeholder="请输入图片验证码"
										value="" maxlength="4" title="请输入4位验证码" required onblur="checkValistr()" 
										>
									<img src="${appPath}/register/ValiImage.do" alt="加载失败" width="85px" height="39px" id="verification" title="看不清点击刷新验证码"
									onclick="refreshCode(this)" />
									<span id="val_msg"></span>
								</div>
								<div class="user-pass">
									<label class="lab" for="password1"><i class="am-icon-lock"></i>
									</label> <input class="inp" type="password" name="userPassword" id="password1"
										placeholder="设置密码"  required maxlength="15" title="不能超过15个字符" onblur="checkPassword1()"
										value="" 
										>
										<span></span>
								</div>
								<div class="user-pass">
									<label class="lab" for="passwordRepeat1"><i class="am-icon-lock"></i>
									</label> <input class="inp" type="password" name="userPassword2" id="passwordRepeat1"
										placeholder="确认密码" required maxlength="15" title="不能超过15个字符" onblur="checkConfirmPassword1()"
										value=""
										>
										<span></span>
								</div>

							<div class="login-links">
								<label for="reader-me"> <input id="reader-me"
									onclick="if (this.checked) {enable1()} else {disable1()}"
									type="checkbox"> 点击表示您同意商城《服务协议》 </label>
							</div>
							<div class="am-cf">
								<input type="submit" name="" value="注册" id ="accept1"
									class="am-btn am-btn-primary am-btn-sm am-fl"  disabled="true" >
							</div>
							
							</form>


						</div>

						<div class="am-tab-panel">
							<form action="${appPath}/register/registerPhone.do" method="post">
							
								<div class="user-username">
									<label class="lab" for="user_name2"><i class="am-icon-user"></i>
									</label> <input class="inp" type="text" name="userName" id="user_name2" placeholder="请输入用户名"
										value="" onblur="checkUser2()" maxlength="10" title="不能超过10个字符" required
										>
									<span></span>
								</div>
								<div class="user-phone">
									<label class="lab" for="phone"><i
										class="am-icon-mobile-phone am-icon-md"></i>
									</label> <input class="inp" type="tel" name="userTelphone" id="phone" placeholder="请输入手机号"
											value="${param.userTelphone }" onblur="checkPhone()" required
											>
									<span></span>
								</div>
								<div class="verification">
									<label class="lab" for="code"><i class="am-icon-code-fork"></i>
									</label>

									<input class="inp" type="tel" name="valistr" id="code" placeholder="请输入图片验证码"
													value="" maxlength="4" title="请输入4位验证码" required onblur="checkValistr2()"
								>
									<img src="${appPath}/register/ValiImage.do" alt="加载失败" width="85px" height="39px" id="verification2" title="看不清点击刷新验证码"
										 onclick="refreshCode(this)" />
									<span id="val_msg2"></span>

									<%--<input class="inp" type="tel" name="smsvalistr" id="code" placeholder="请输入短信验证码"
											value="${param.smsvalistr }" onblur="CheckSmsCode()" maxlength="6" title="请输入6位验证码" required 
											>
									<input class="am-btn am-btn-secondary btn-loading-example " type="button" value="获取" id="sendMobileCode"/>--%>
									<!-- <a class="btn" href="javascript:void(0);"
										onclick="sendMobileCode();" id="sendMobileCode"> <span
										id="dyMobileButton">获取</span>
									</a>
									<span id="sms_msg"></span>-->
								</div>
								<div class="user-pass">
									<label class="lab" for="password2"><i class="am-icon-lock"></i>
									</label> <input class="inp" type="password" name="userPassword" id="password2"
										placeholder="设置密码" maxlength="15" title="不能超过15个字符" required onblur="checkPassword2()"
										value="${param.userPassword }"
										>
										<span></span>
								</div>
								<div class="user-pass">
									<label class="lab" for="passwordRepeat2"><i class="am-icon-lock"></i>
									</label> <input class="inp" type="password" name="userPassword2" id="passwordRepeat2"
										placeholder="确认密码" maxlength="15" title="不能超过15个字符" required onblur="checkConfirmPassword2()"
										value="${param.userPassword2 }"
										>
										<span></span>
								</div>
							<div class="login-links">
								<label for="reader-me1"> <input id="reader-me1" 
									onclick="if (this.checked) {enable2()} else {disable2()}"
									type="checkbox"> 点击表示您同意商城《服务协议》 </label>
							</div>
							<div class="am-cf">
								<input type="submit" name="" value="注册" id ="accept2"
									class="am-btn am-btn-primary am-btn-sm am-fl"  disabled="true" >
									
							</div>
							
							</form>

						</div>

						<script>
							$(function() {
								$('#doc-my-tabs').tabs();
							})
						</script>


<script type="text/javascript">
	
</script>


<!-- 触发提交按钮 -->
<script>
function disable1()
  {
  document.getElementById("accept1").disabled=true
  }
function enable1()
  {
  document.getElementById("accept1").disabled=false
  }
</script>						
<script>
function disable2()
  {
  document.getElementById("accept2").disabled=true
  }
function enable2()
  {
  document.getElementById("accept2").disabled=false
  }
</script>						
						
<!-- 邮箱校验 -->					
<script type="text/javascript">
	function checkUserEmail() {
		//Ajax校验邮箱是否已经存在
		var userEmail = $("input[name='userEmail']").val().trim();
		var span = $("input[name='userEmail']").next("span");
		var re = /^\w+@\w+(\.[a-z]+)+$/;
          if(userEmail == ""){
			$("input[name='userEmail']").next("span").html("<font color='red'>× 邮箱地址不能为空</font>");
			return false; 
		}else if(userEmail != ""){
			/* 校验邮箱格式 */
			if(!re.test(userEmail)){
				$("input[name='userEmail']").next("span").html("<font color='red'>× 请输入有效的邮箱地址</font>");
				return false;
			}else{
				setMsg("userEmail","<i class='am-icon-spinner am-icon-pulse'></i> ");
				/* 向后台发送处理数据（在数据库查找是否有存在该邮箱） */
				setTimeout(function(){
		             $("#userEmail_msg").load(
	                    "${appPath}/register/selectEmail.do",
	                    {"userEmail" : userEmail}
	                 );
				},1000);
				return true;
			}
		}
     }
</script>


<!-- 图片验证码校验 -->
<script type="text/javascript">
	function checkValistr(){
		//获取图片验证码输入框参数
		var inputCode = $("input[name='valistr']").val().trim();
		
		//判断是否为空
		if(inputCode == ""){
		    $("#val_msg").html("<font color='red'>× 图片验证码不能为空</font>"); 
			return;
		} 
		
		//校验图片验证码
		$.ajax({
		    type:"POST",//用post方式传输
		    dataType:"text",//数据格式：json
		    url:"${appPath}/register/checkCode.do",//目标地址
		    data:{"valistr":inputCode},
		    success:function (data){
		    data = parseInt(data,10);
			    if(data == 1){
			        $("#val_msg").html("<font color='#339933'>√ 验证码正确</font>");
			        $("#reader-me").removeAttr("disabled");
			        $("label[for='reader-me']").css("cursor","pointer");
			    }else if(data == 0){
			        $("#val_msg").html("<font color='red'>× 验证码不正确,请重新获取</font>");
			        $("#reader-me").attr("disabled",true);
			        $("label[for='reader-me']").css("cursor","not-allowed");
			    }else if(data == 2){
			        $("#sms_msg").html("<font color='red'>× 验证码已失效，请重新获取验证码</font>");
			        $("#reader-me").attr("disabled",true);
			        $("label[for='reader-me']").css("cursor","not-allowed");
			    }
		     }
	     });
	}

    function checkValistr2(){
        //获取图片验证码输入框参数
        var inputCode = $("#code").val().trim();

        //判断是否为空
        if(inputCode == ""){
            $("#val_msg2").html("<font color='red'>× 图片验证码不能为空</font>");
            return;
        }

        //校验图片验证码
        $.ajax({
            type:"POST",//用post方式传输
            dataType:"text",//数据格式：json
            url:"${appPath}/register/checkCode.do",//目标地址
            data:{"valistr":inputCode},
            success:function (data){
                data = parseInt(data,10);
                if(data == 1){
                    $("#val_msg2").html("<font color='#339933'>√ 验证码正确</font>");
                    $("#reader-me").removeAttr("disabled");
                    $("label[for='reader-me']").css("cursor","pointer");
                }else if(data == 0){
                    $("#val_msg2").html("<font color='red'>× 验证码不正确,请重新获取</font>");
                    $("#reader-me").attr("disabled",true);
                    $("label[for='reader-me']").css("cursor","not-allowed");
                }else if(data == 2){
                    $("#val_msg2").html("<font color='red'>× 验证码已失效，请重新获取验证码</font>");
                    $("#reader-me").attr("disabled",true);
                    $("label[for='reader-me']").css("cursor","not-allowed");
                }
            }
        });


    }
</script>

<!-- 手机注册的ajax -->
<script type="text/javascript">
	/* Ajax检验手机号码是否已经存在 */
	function checkPhone(){
		//1.获取手机号码参数
		var phone = $("input[name='userTelphone']").val().trim();
		var span = $("input[name='userTelphone']").next("span");
		var re= /(^1[3|4|5|7|8][0-9]{9}$)/;
		        
		if(phone == ""){
			$("input[name='userTelphone']").next("span").html("<font color='red'>× 手机号码不能为空</font>");
			return false; 
		}else if(phone != ""){
			/* 校验手机号码格式 */
			if(!re.test(phone)){
				$("input[name='userTelphone']").next("span").html("<font color='red'>× 请输入有效的手机号码</font>");
				return false;
			}else{
				//$("input[name='user_telphone']").next("span").html("<font color='#339933'>√ 手机号码输入正确</font>");
				setMsg("userTelphone","<i class='am-icon-spinner am-icon-pulse'></i> ");
				/* 向后台发送处理数据（在数据库查找是否有存在该手机号码） */
				setTimeout(function(){
					$("input[name='userTelphone']").next("span").load(
						"${appPath}/register/checkPhone.do",
						{"userTelphone":phone}
					);
			
				},1000);
					
				<%-- $.ajax({
					url:"<%= request.getContextPath()%>/servlet/AjaxCheckPhoneServlet",//目标地址
					data:{"phonenumber":phone},
					type:"POST",//用post方式传输
					dataType:"text",//数据格式：text
					success:function(data){
						 data = parseInt(data, 10);  
		                 if (data != 0) {  
							  $("input[name='phonenumber']").next("span").html("<font color='red'>× 该手机号码已经被注册，请重新输入</font>");
		                  } else {  
		                       $("input[name='phonenumber']").next("span").html("<font color='#339933'>√ 该手机号码可以注册，输入正确</font>");  
		                  }  
					}
					
				}); --%>
				return true;
			}
		}
	}

</script>






<script>/*不要*/
		/* Ajax发送验证码 ,并且带防刷新验证码页面*/
	  $(function(){
        /*防刷新：检测是否存在cookie*/
        if($.cookie("smscookie")){
        	//创建Cookie
            var count = $.cookie("smscookie");
            //获取"发送"按钮
            var btn = $("#sendMobileCode");
            btn.val(count+"秒").attr("disabled",true).css("cursor","not-allowed");
            var resend = setInterval(function(){
                count--;
                if (count > 0){
                    btn.val(count+"秒").attr("disabled",true).css("cursor","not-allowed");
                    $.cookie("smscookie", count, {path: "/", expires: (1/86400)*count});
                }else {
                    clearInterval(resend);// 停止计时器 
                    // 启用按钮 
                    btn.val("重发").removeClass("disabled").removeAttr("disabled").css("cursor","pointer");
                    
                }
            }, 1000);
         }
        /*点击改变按钮状态*/
        $("#sendMobileCode").click(function(){
            var btn = $(this);
            var count = 60;//间隔函数，1秒执行
            
            var phone = $("input[name='userTelphone']").val().trim();//手机号码
            var span = $("input[name='userTelphone']").next("span").text();//手机号码后的span
            if(phone != ""){
					//根据手机号码的校验来启动按钮
					if(span == "√ 该手机号码可以注册，输入正确" || span == "√ 短信验证码已发到您的手机,请查收"){
						var resend = setInterval(function(){
		                count--;
		                if (count > 0){
		                    btn.val(count+"秒");
		                    $.cookie("smscookie", count, {path: "/", expires: (1/86400)*count});
		                }else {
		                    clearInterval(resend);// 停止计时器 
		                    // 启用按钮 
		                    btn.val("重发").removeAttr("disabled").css("cursor","pointer");
		                }
		            }, 1000);
		            btn.attr("disabled",true).css("cursor","not-allowed");
		    
		            
		            /* Ajax发送验证码 */
		            /* 调用后台短信servlet */
					$.ajax({
						    type:"POST",//用post方式传输
						    dataType:"text",//数据格式：json
						   	url:"${appPath}/register/sendSms.do",//目标地址
						   	data:{"userTelphone":phone},
						   	success:function (data){
					      	data = parseInt(data,10);
						      		if(data == 1){
							       		$("input[name='userTelphone']").next("span").html("<font color='#339933'>√ 短信验证码已发到您的手机,请查收</font>");
							       	}else if(data == 0){
							       		$("input[name='userTelphone']").next("span").html("<font color='red'>×  短信验证码发送失败，请重新获取</font>");
							       	}else if(data == 2){
							       		$("input[name='userTelphone']").next("span").html("<font color='red'>× 该手机号码今天发送验证码过多</font>");
							       	}
					      	 }
						   });
					}
			}else{  
       			$("input[name='userTelphone']").next("span").html("<font color='red'>× 手机号码不能为空</font>");
   			} 
       	 });
   	});
</script>

<script>/*不要*/
	/* 校验短信验证码 */
	function CheckSmsCode(){
		//获取短信验证码参数
		var smsvalistr = $("input[name='smsvalistr']").val().trim();
		//获取手机号码参数
		var phone = $("input[name='userTelphone']").val().trim();
		
		//2.检查短信验证码输入框是否为空
		if($.trim(smsvalistr) == ""){//去空格
			/* setMsg("smsvalistr","验证码不能为空"); */
			 $("#sms_msg").html("<font color='red'>× 短信验证码不能为空</font>"); 
			return;
		}
		
		//3.判断是否匹配
		/* 调用后台校验短信servlet */
		<%-- $("#sms_msg").load(
			"<%= request.getContextPath()%>/servlet/AjaxCheckSmsCodeServlet",
				{"smsvalistr":smsvalistr}
			); --%>
			
			$.ajax({
			    type:"POST",//用post方式传输
			    dataType:"text",//数据格式：json
			    url:"${appPath}/register/checkSmsCode.do",//目标地址
			    data:{"smsvalistr":smsvalistr,"userTelphone":phone},
			    success:function (data){
			    data = parseInt(data,10);
				    if(data == 1){
				        $("#sms_msg").html("<font color='#339933'>√ 验证码正确</font>");
				        $("#reader-me1").removeAttr("disabled");
			        	$("label[for='reader-me1']").css("cursor","pointer");  
				    }else if(data == 0){
				        $("#sms_msg").html("<font color='red'>× 验证码不正确,请重新获取</font>");
				        $("#reader-me1").attr("disabled",true);
			        	$("label[for='reader-me1']").css("cursor","not-allowed");    
				    }else if(data == 2){
				        $("#sms_msg").html("<font color='red'>× 验证码已失效请重新获取验证码</font>");
				        $("#reader-me1").attr("disabled",true);
			        	$("label[for='reader-me1']").css("cursor","not-allowed");  
				    }
			     }
		     });
	}
</script>
<script type="text/javascript">
		/* 点击图片刷新验证码 */
		function refreshCode(thisobj){
			thisobj.src = "${appPath}/register/ValiImage.do?ye="+new Date().getTime();
		}
</script>

					</div>
				</div>

			</div>
		</div>
	</div>

<%@ include file="/_foot.jsp" %>

	</body>


</html>