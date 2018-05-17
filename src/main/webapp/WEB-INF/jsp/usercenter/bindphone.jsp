<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>
			<c:if test="${sessionScope.User.userTelphone==null}">
				绑定手机
			</c:if>
			<c:if test="${sessionScope.User.userTelphone!=null}">
				修改手机
			</c:if>
		</title>

		<link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${appPath}/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="${appPath}/js/jquery-1.7.2.min.js"></script>
		<script src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		
		<script type="text/javascript" src="${appPath}/js/jquery.cookie.js"></script>
		<script type="text/javascript" src="${appPath}/js/registerCheck.js"></script>
		<script type="text/javascript" src="${appPath}/js/checkNull.js"></script>


	</head>

	<body>
		<!--头 -->
		<%@include file="/_head.jsp" %>
		<!-- ↑引入头部文件 -->
				
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">
														绑定手机
												</strong> / <small>Bind&nbsp;Phone</small>
						</div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">
										绑定手机
                                </p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<form class="am-form am-form-horizontal" method="post"
							<c:if test="${sessionScope.User.userTelphone == null}"> action="${appPath }/usercenter/addPhone.do"</c:if>
							<c:if test="${sessionScope.User.userTelphone != null}"> action="${appPath }/usercenter/updatePhone.do" </c:if> >
					
						<!-- 如果没绑定手机，那页面只显示绑定新手机和输入短信验证码 -->
					<c:if test="${sessionScope.User.userTelphone!=null}">
						<div class="am-form-group bind">
							<label for="user-phone" class="am-form-label">已绑定手机</label>
							<div class="am-form-content">
								<span id="user-phone" >${sessionScope.User.userTelphone}</span>
							</div>
						</div>
						<%--<div class="am-form-group code">
							<label for="user-code" class="am-form-label">验证码</label>
							<div class="am-form-content">
								<input type="tel" id="user-code" placeholder="请输入短信验证码，进行校验原手机号码" name="smsvalistr" 
										onblur="CheckSmsCode1()" maxlength="6" title="请输入6位验证码" required >
								<span></span>
							</div>
							<input class="am-btn am-btn-danger" type="button" value="验证码" id="sendMobileCode"/>
						</div>--%>
					</c:if>
						
						<div class="am-form-group">
							<label for="user-new-phone" class="am-form-label">验证新手机</label>
							<div class="am-form-content">
								<input type="tel" id="user-new-phone" placeholder="绑定新手机号码" name="newPhone" onblur="checkPhone()" maxlength="11" title="请输入11位手机号码" required >
								<span></span>
							</div>
							
						</div>
						<div class="am-form-group code">
							<label for="user-new-code" class="am-form-label">验证码</label>
							<div class="am-form-content">
								<%--<input type="tel" id="user-new-code" placeholder="请输入短信验证码" name="smsvalistr2"
									    onblur="CheckSmsCode2()"  maxlength="6" title="请输入6位验证码" required >--%>
								<input class="inp" type="tel" name="valistr" id="code" placeholder="请输入图片验证码"
									   value="" maxlength="4" title="请输入4位验证码" required onblur="checkValistr2()"
								>
								<span id="val_msg2"></span>
							</div>
							<img src="${appPath}/register/ValiImage.do" alt="加载失败" width="85px" height="30px" id="verification" title="看不清点击刷新验证码"
								 onclick="refreshCode(this)" />
							<%--<c:if test="${sessionScope.User.userTelphone != null }">
								<input class="am-btn am-btn-danger" type="button" value="验证码" id="sendMobileCode2" disabled="disabled" />
							</c:if>
							<c:if test="${sessionScope.User.userTelphone == null }">
								<input class="am-btn am-btn-danger" type="button" value="验证码" id="sendMobileCode3" />
							</c:if>--%>
						</div>
						<div class="info-btn">
							<!-- <div class="am-btn am-btn-danger">保存修改</div> -->
							<input type="submit"  class="am-btn am-btn-danger" value="保存修改">
						</div>

					</form>

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

<script type="text/javascript">
	/* 点击图片刷新验证码 */
	function refreshCode(thisobj){
		thisobj.src = "${appPath}/register/ValiImage.do?ye="+new Date().getTime();
	}
</script>
	<script>
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
                    }else if(data == 0){
                        $("#val_msg2").html("<font color='red'>× 验证码不正确,请重新获取</font>");
                    }else if(data == 2){
                        $("#val_msg2").html("<font color='red'>× 验证码已失效，请重新获取验证码</font>");
                    }
                }
            });


        }
	</script>
<!-- 校验新手机号码是否已经存在 -->
<script type="text/javascript">
	/* Ajax检验手机号码是否已经存在 */
	function checkPhone(){
		//1.获取手机号码参数
		var phone = $("input[name='newPhone']").val().trim();
		var span = $("input[name='newPhone']").next("span");
		var re= /(^1[3|4|5|7|8][0-9]{9}$)/;
		        
		if(phone == ""){
			$("input[name='newPhone']").next("span").html("<font color='red'>× 手机号码不能为空</font>");
			return false; 
		}else if(phone != ""){
			/* 校验手机号码格式 */
			if(!re.test(phone)){
				$("input[name='newPhone']").next("span").html("<font color='red'>× 请输入有效的手机号码</font>");
				return false;
			}else{
				//$("input[name='user_telphone']").next("span").html("<font color='#339933'>√ 手机号码输入正确</font>");
				setMsg("newPhone","<i class='am-icon-spinner am-icon-pulse'></i> ");
				/* 向后台发送处理数据（在数据库查找是否有存在该手机号码） */
				setTimeout(function(){
					$("input[name='newPhone']").next("span").load(
						"${appPath}/register/checkPhone.do",
						{"newPhone":phone}
					);
			
				},1000);
					
				return true;
			}
		}
	}

</script>

	<%--不要【下面的js暂不可用】--%>
<!-- 旧手机的短信按钮事件
	思路：userTelphone的Session存在，这个按钮才出现，否则被隐藏！
		还有，无论用户是否按顺序输入，只要按钮出现了，都能发送短信 -->
<script>
		/* Ajax发送验证码 ,并且带防刷新验证码页面*/
	  $(function(){
        /*防刷新：检测是否存在cookie*/
        if($.cookie("smscookie2")){
        	//创建Cookie
            var count = $.cookie("smscookie2");
            //获取"发送"按钮
            var btn = $("#sendMobileCode");
            btn.val(count+"秒").attr("disabled",true).css("cursor","not-allowed");
            var resend = setInterval(function(){
                count--;
                if (count > 0){
                    btn.val(count+"秒").attr("disabled",true).css("cursor","not-allowed");
                    $.cookie("smscookie2", count, {path: "/", expires: (1/86400)*count});
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
            
            var phone = $("#user-phone").text();//旧手机号码
            var span = $("input[name='smsvalistr']").next("span").text();//第一个短信文本框后面的span
            
            /* 为防止一些傻逼用户刚新绑定了手机号码后，接着又更换绑手机号码 ，所以对cookie的存在进行判断*/
            if($.cookie("smscookie3")){
            	//存在
            	alert("不好意思，你更换手机号码太频繁了，请在一个小时后再操作吧( • ̀ω•́ )✧");
            	$("input[name='smsvalistr']").next("span").html("<font color='red'>不好意思，你更换手机号码太频繁了，请在一个小时后再操作吧</font>");
            	return;
            }
            
            if(phone != ""){
					//根据旧手机号码的校验来启动按钮
						var resend = setInterval(function(){
		                count--;
		                if (count > 0){
		                    btn.val(count+"秒");
		                    $.cookie("smscookie2", count, {path: "/", expires: (1/86400)*count});
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
							       		$("input[name='smsvalistr']").next("span").html("<font color='#339933'>√ 短信验证码已发到您的绑定手机,请查收</font>");
							       	}else if(data == 0){
							       		$("input[name='smsvalistr']").next("span").html("<font color='red'>×  短信验证码发送失败，请重新获取</font>");
							       	}else if(data == 2){
							       		$("input[name='smsvalistr']").next("span").html("<font color='red'>× 原手机号码今天发送验证码过多</font>");
							       	}
					      	 }
						   });
			}else{  
       			$("input[name='smsvalistr']").next("span").html("<font color='red'>× 手机号码不能为空</font>");
   			} 
       	 });
   	});
</script>

<!-- 新手机号码的短信按钮事件 (换绑)-->
<script>
		/* Ajax发送验证码 ,并且带防刷新验证码页面*/
	  $(function(){
        /*防刷新：检测是否存在cookie*/
        if($.cookie("smscookie4")){
        	//创建Cookie
            var count = $.cookie("smscookie4");
            //获取"发送"按钮
            var btn = $("#sendMobileCode2");
            btn.val(count+"秒").attr("disabled",true).css("cursor","not-allowed");
            var resend = setInterval(function(){
                count--;
                if (count > 0){
                    btn.val(count+"秒").attr("disabled",true).css("cursor","not-allowed");
                    $.cookie("smscookie4", count, {path: "/", expires: (1/86400)*count});
                }else {
                    clearInterval(resend);// 停止计时器 
                    // 启用按钮 
                    btn.val("重发").removeClass("disabled").removeAttr("disabled").css("cursor","pointer");
                    
                }
            }, 1000);
         }
        /*点击改变按钮状态*/
        $("#sendMobileCode2").click(function(){
            var btn = $(this);
            var count = 60;//间隔函数，1秒执行
            
            var phone = $("input[name='newPhone']").val().trim();//新手机号码
            var span2 = $("input[name='newPhone']").next("span").text();//新手机号码后的span
           
            var span1 = $("input[name='smsvalistr']").next("span").text();//第一个短信文本框后面的span
           	//如果有旧手机号码，就判断第一个短信输入框是否已经进行了校验
           	<c:if test="${sessionScope.User.userTelphone != null }">
           		console.log(1);
	           	if(span1 != "√ 验证码正确"){
	           		$("input[name='smsvalistr2']").next("span").html("<font color='red'>不好意思，请用户您先校验原手机，再进行新手机的绑定</font>");
	           		return;
	           	}
           	</c:if>
           	
           	console.log(2);
            if(phone != ""){
					//根据新手机号码的校验来启动按钮
					if(span2 == "√ 该手机号码可以注册，输入正确" || span2 == "√ 短信验证码已发到您的手机,请查收"){
						var resend = setInterval(function(){
		                count--;
		                if (count > 0){
		                    btn.val(count+"秒");
		                    $.cookie("smscookie4", count, {path: "/", expires: (1/86400)*count});
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
						   	url:"${appPath}/usercenter/sendSms2.do",//目标地址
						   	data:{"newPhone":phone},
						   	success:function (data){
					      	data = parseInt(data,10);
						      		if(data == 1){
							       		$("input[name='newPhone']").next("span").html("<font color='#339933'>√ 短信验证码已发到您的手机,请查收</font>");
							       	}else if(data == 0){
							       		$("input[name='newPhone']").next("span").html("<font color='red'>×  短信验证码发送失败，请重新获取</font>");
							       	}else if(data == 2){
							       		$("input[name='newPhone']").next("span").html("<font color='red'>× 该手机号码今天发送验证码过多</font>");
							       	}
					      	 }
						   });
					}
			}else{  
       			$("input[name='newPhone']").next("span").html("<font color='red'>× 手机号码不能为空</font>");
   			} 
       	 });
   	});
</script>

<!-- 新手机号码的短信按钮事件 (新增)-->
<script>
		/* Ajax发送验证码 ,并且带防刷新验证码页面*/
	  $(function(){
        /*防刷新：检测是否存在cookie*/
        if($.cookie("smscookie3")){
        	//创建Cookie
            var count = $.cookie("smscookie3");
            //获取"发送"按钮
            var btn = $("#sendMobileCode3");
            btn.val(count+"秒").attr("disabled",true).css("cursor","not-allowed");
            var resend = setInterval(function(){
                count--;
                if (count > 0){
                    btn.val(count+"秒").attr("disabled",true).css("cursor","not-allowed");
                    $.cookie("smscookie3", count, {path: "/", expires: (1/86400)*count});
                }else {
                    clearInterval(resend);// 停止计时器 
                    // 启用按钮 
                    btn.val("重发").removeClass("disabled").removeAttr("disabled").css("cursor","pointer");
                    
                }
            }, 1000);
         }
        /*点击改变按钮状态*/
        $("#sendMobileCode3").click(function(){
            var btn = $(this);
            var count = 60;//间隔函数，1秒执行
            
            var phone = $("input[name='newPhone']").val().trim();//新手机号码
            var span2 = $("input[name='newPhone']").next("span").text();//新手机号码后的span
           
           	console.log(2);
            if(phone != ""){
					//根据新手机号码的校验来启动按钮
					if(span2 == "√ 该手机号码可以注册，输入正确" || span2 == "√ 短信验证码已发到您的手机,请查收"){
						var resend = setInterval(function(){
		                count--;
		                if (count > 0){
		                    btn.val(count+"秒");
		                    $.cookie("smscookie3", count, {path: "/", expires: (1/86400)*count});
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
						   	url:"${appPath}/usercenter/sendSms2.do",//目标地址
						   	data:{"newPhone":phone},
						   	success:function (data){
					      	data = parseInt(data,10);
						      		if(data == 1){
							       		$("input[name='newPhone']").next("span").html("<font color='#339933'>√ 短信验证码已发到您的手机,请查收</font>");
							       	}else if(data == 0){
							       		$("input[name='newPhone']").next("span").html("<font color='red'>×  短信验证码发送失败，请重新获取</font>");
							       	}else if(data == 2){
							       		$("input[name='newPhone']").next("span").html("<font color='red'>× 该手机号码今天发送验证码过多</font>");
							       	}
					      	 }
						   });
					}
			}else{  
       			$("input[name='newPhone']").next("span").html("<font color='red'>× 手机号码不能为空</font>");
   			} 
       	 });
   	});
</script>

<!-- 下面两个是校验事件 -->
<!-- 短信文本框1 -->
<script>
	/* 校验短信验证码 */
	function CheckSmsCode1(){
		//获取短信验证码参数
		var smsvalistr = $("input[name='smsvalistr']").val().trim();
		//获取旧手机号码参数
		var oldPhone = $("#user-phone").text();
		//第一个短信文本框后面的span
		var span1 = $("input[name='smsvalistr']").next("span").text();
		
		console.log(smsvalistr);
		console.log(oldPhone);
		
		
		//2.检查短信验证码输入框是否为空
		if($.trim(smsvalistr) == ""){//去空格
			/* setMsg("smsvalistr","验证码不能为空"); */
			$("input[name='smsvalistr']").next("span").html("<font color='red'>× 短信验证码不能为空</font>");
			$("#sendMobileCode2").attr("disabled",true).css("cursor","not-allowed");
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
			    data:{"smsvalistr":smsvalistr,"userTelphone":oldPhone},
			    success:function (data){
			    data = parseInt(data,10);
				    if(data == 1){
				        $("input[name='smsvalistr']").next("span").html("<font color='#339933'>√ 验证码正确</font>");
						/* 启动按钮2 */
				       	//if(span1 == "√ 验证码正确"){
				       	$("#sendMobileCode2").removeAttr("disabled").css("cursor","pointer");
			           	//}
				    }else if(data == 0){
				        $("input[name='smsvalistr']").next("span").html("<font color='red'>× 验证码不正确,请重新获取</font>");
				        $("#sendMobileCode2").attr("disabled",true).css("cursor","not-allowed");
				    }else if(data == 2){
				        $("input[name='smsvalistr']").next("span").html("<font color='red'>× 验证码已失效请重新获取验证码</font>");
				        $("#sendMobileCode2").attr("disabled",true).css("cursor","not-allowed");
				        
				    }
			     }
		     });
	}
</script>
<!-- 短信文本框2 -->
<script>
	/* 校验短信验证码 */
	function CheckSmsCode2(){
		//获取短信验证码参数
		var smsvalistr = $("input[name='smsvalistr2']").val().trim();
		//获取旧手机号码参数
		//var oldPhone = $("#user-phone").text();
		//获取新手机号码参数
		var newPhone = $("input[name='newPhone']").val().trim();
		
		console.log(smsvalistr);
		console.log(newPhone);
		
		
		//2.检查短信验证码输入框是否为空
		if($.trim(smsvalistr) == ""){//去空格
			/* setMsg("smsvalistr","验证码不能为空"); */
			$("input[name='smsvalistr2']").next("span").html("<font color='red'>× 短信验证码不能为空</font>");
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
			    data:{"smsvalistr":smsvalistr,"newPhone":newPhone},
			    success:function (data){
			    data = parseInt(data,10);
				    if(data == 1){
				        $("input[name='smsvalistr2']").next("span").html("<font color='#339933'>√ 验证码正确</font>");
				    }else if(data == 0){
				        $("input[name='smsvalistr2']").next("span").html("<font color='red'>× 验证码不正确,请重新获取</font>");
				    }else if(data == 2){
				        $("input[name='smsvalistr2']").next("span").html("<font color='red'>× 验证码已失效请重新获取验证码</font>");
				    }
			     }
		     });
	}
</script>


</html>