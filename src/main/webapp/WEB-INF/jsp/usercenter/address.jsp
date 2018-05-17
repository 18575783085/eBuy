<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>地址管理</title>

		<link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="${appPath}/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    	
		<script src="${appPath}/js/distpicker.data.js"></script>
        <script src="${appPath}/js/distpicker.js"></script>
		<script type="text/javascript">
            $(function() {
                $("#distpicker1").distpicker();
                autoSelect: false
                //$("#province").val('选择省');
                //$("#city").val('选择市');
               // $("#area").val('选择区');
            })
        </script>
        <script type="text/javascript">
            $(function() {
                $("#distpicker2").distpicker();
                autoSelect: false
                //$("#province").val('选择省');
                //$("#city").val('选择市');
               // $("#area").val('选择区');
            })
        </script>
        
<style>
	.theme-popover{display: none;}
	@media only screen and (min-width:640px) 

   {
	   .theme-popover-mask{
		   z-index:10000000;
		   position:fixed;
		   left:0;
		   top:0;
		   width:100%;
		   height:100%;
		   background:#000;
		   opacity:0.5;
		   filter:alpha(opacity=50);-moz-opacity:0.5;display:none;
	   }
		
		.theme-popover{
			z-index:10000009;
			position:fixed;
			bottom:50%;
			left:50%;
			width:500px;
			height:450px;
			margin-bottom:-200px;
			margin-left:-250px;
			display:none;
			background:#fff;
			overflow: hidden;
		}
		
		.theme-popover .am-form-content.address select{
			width:31%;
			margin-right:1.3%;
			float: left;
		}
		.theme-popover .am-form-group {margin-bottom: 20px;}

		.theme-popover .am-u-md-12{
			padding-left:1.5rem;
			padding-right:1.5rem;
			font-size:14px;
			position:relative;
			
		}
		
		.theme-popover .am-form-content.address1 input{
		width:32%;
		margin-right:1.3%;
		float: left;
		}

   
   }

</style>    
    
    
	</head>

	<body>
		<!--头 -->
		<%@include file="/_head.jsp" %>
		<!-- ↑引入头部文件 -->
		
		<b class="line"></b>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-address">
						<c:if test="${sessionScope.User.userAddress !=null }">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small></div>
						</div>
						<hr/>
							<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
								<c:forEach items="${sessionScope.User.userAddress }" var="address">
								   <c:if test="${address.addressId !=null }">
									<li  <c:if test="${address.addressStatus == 1 }">class="user-addresslist defaultAddr"</c:if>
						                 <c:if test="${address.addressStatus == 0 }">class="user-addresslist"</c:if>
						             >
										<span class="new-option-r"><i class="am-icon-check-circle"></i>设为默认</span>
										<input type="hidden" value="${address.addressId }" name="addressId" id="addressId"/>
										<input type="hidden" value="${address.userId }" name="userId" id="userId"/>
										<input type="hidden" value="${address.addressStatus }" name="addressStatus" id="addressStatus"/>
										<p class="new-tit new-p-re">
											<span class="new-txt">${address.userReceiver }</span>
											<span class="new-txt-rd2">${address.userPhone }</span>
										</p>
										<div class="new-mu_l2a new-p-re">
											<p class="new-mu_l2cw">
												<span class="title">地址：</span>
												<span class="province">${address.userProvince}</span>
												<span class="city">${address.userCity}</span>
												<span class="dist">${address.userDistrict}</span>
												<span class="street">${address.userAddress}</span>
											</p>
										</div>
										<div class="new-addr-btn">
											<a href="javascript:void(0);" class="tc-btn createAddr theme-login" onclick="modifyAddress(this)"><i class="am-icon-edit"></i>编辑</a>
											<span class="new-addr-bar">|</span>
											<a href="javascript:void(0);" onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
										</div>
									</li>
								  </c:if>
								</c:forEach>
							</ul>
						</c:if>
						<div class="clear"></div>
						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>

								<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
									<form class="am-form am-form-horizontal" action="${appPath}/usercenter/addAddress.do" method="post">

										<div class="am-form-group">
											<label for="consignee" class="am-form-label">收货人</label>
											<div class="am-form-content">
												<input type="text" id="consignee" name="userReceiver"  placeholder="收货人" maxlength="10" title="不能超过10个字符" required>
											</div>
										</div>

										<div class="am-form-group">
											<label for="consigneePhone" class="am-form-label">手机号码</label>
											<div class="am-form-content">
												<input id="consigneePhone" name="userPhone" placeholder="手机号必填" type="tel" maxlength="11" title="请输入手机号码" required>
											</div>
										</div>
										<div class="am-form-group">
											<label for="userAddress" class="am-form-label">所在地</label>
											<div class="am-form-content address" id="distpicker1">
												<select name="userProvince" id="province" style="color:#999;"></select>
								                <select name="userCity" id="city" style="color:#999;"></select>
								                <select name="userDistrict" id="area" style="color:#999;"></select>
											</div>
										</div>

										<div class="am-form-group">
											<label for="consigneeIntro" class="am-form-label">详细地址</label>
											<div class="am-form-content">
												<textarea class="" rows="3" id="consigneeIntro" placeholder="输入详细地址" name="userAddress" maxlength="100" title="不能超过100个字符" required></textarea>
												<small>100字以内写出你的详细地址...</small>
											</div>
										</div>

										<div class="am-form-group">
											<div class="am-u-sm-9 am-u-sm-push-3">
												<button type="submit" class="am-btn am-btn-danger">保存</button>
												<button type="reset" class="am-btn am-btn-danger">清空</button>
											</div>
										</div>
									</form>
								</div>

							</div>

						</div>

					</div>

					<div class="clear"></div>

				</div>
				<!--底部-->
				<%@include file="/_foot.jsp" %>
				<!-- ↑引入底部文件 -->

<div class="theme-popover-mask"></div>
<div class="theme-popover">

	<!--标题 -->
	<div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">编辑地址</strong> / <small>Add address</small></div>
	</div>
	<hr/>

	<div class="am-u-md-12">
		<form class="am-form am-form-horizontal" method="post" action="${appPath }/usercenter/updateAddress.do">
			<input type="hidden" value="" name="addressId" id="user-addressId"/>
			<input type="hidden" value="" name="userId" id="user-userId"/>
			<input type="hidden" value="" name="addressStatus" id="user-addressStatus"/>
			<div class="am-form-group">
				<label for="user-name" class="am-form-label">收货人</label>
				<div class="am-form-content">
					<input type="text" id="user-name" name="userReceiver" value="" placeholder="收货人" maxlength="10" title="不能超过10个字符" required>
				</div>
			</div>
			
			<div class="am-form-group">
				<label for="user-phone" class="am-form-label">手机号码</label>
				<div class="am-form-content">
					<input id="user-phone" name="userPhone" value="" placeholder="手机号必填" type="tel" maxlength="11" title="不能超过11个字符" required>
				</div>
			</div>
			<div class="am-form-group">
				<label for="user-address" class="am-form-label">所在地区</label>
				<div class="am-form-content address1">
					<input type="text" id="user-province" value="" disabled="disabled"/>
					<input type="text" id="user-city" value="" disabled="disabled"/>
					<input type="text" id="user-area" value="" disabled="disabled"/>
				</div>
			</div>
			
			<div class="am-form-group">
				<label for="user-address" class="am-form-label">所在地 (<font style="color:red">请重选</font>)</label>
				<div class="am-form-content address" id="distpicker2">
					 <select  name="userProvince" id="province" ></select>
					 <select  name="userCity" id="city" ></select>
					 <select  name="userDistrict" id="area" ></select>
				</div>
			</div>

			<div class="am-form-group">
				<label for="user-intro" class="am-form-label">详细地址</label>
				<div class="am-form-content">
					<textarea class="" rows="3" id="user-intro" name="userAddress" placeholder="输入详细地址" maxlength="100" title="不能超过100个字符" required></textarea>
					<small>100字以内写出你的详细地址...</small>
				</div>
			</div>

			<div class="am-form-group theme-poptit">
				<div class="am-u-sm-9 am-u-sm-push-3">
					<button type="submit" class="am-btn am-btn-danger">保存</button>
					<div class="am-btn am-btn-danger close">取消</div>
				</div>
			</div>
		</form>
	</div>

</div>			
			
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

<!-- 点击编辑弹出框 -->
<script type="text/javascript">
	// 弹出地址选择
	$(document).ready(function($) {

		var $ww = $(window).width();

		$('.theme-login').click(function() {
			//禁止遮罩层下面的内容滚动
			$(document.body).css("overflow","hidden");
		
			$(this).addClass("selected");
			$(this).parent().addClass("selected");

							
			$('.theme-popover-mask').show();
			$('.theme-popover-mask').height($(window).height());
			$('.theme-popover').slideDown(200);																		
			
		})
		
		$('.theme-poptit .close,.btn-op .close').click(function() {

			$(document.body).css("overflow","visible");
			$('.theme-login').removeClass("selected");
			$('.item-props-can').removeClass("selected");					
			$('.theme-popover-mask').hide();
			$('.theme-popover').slideUp(200);
		})

		
	}); 
</script>

<!-- 点击选择默认地址 -->
<script type="text/javascript">
	$(document).ready(function() {							
		$(".new-option-r").click(function() {
			$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
			
			//获取用户地址id参数
			var addressId = $(this).next("input[name='addressId']").val().trim();
			var userId = $(this).next("input[name='addressId']").next("input[name='userId']").val().trim();
			//修改地址状态
			$.ajax({
				type:"post",
				dataType:"text",
				url:"${appPath}/usercenter/changeDefalutAddress.do",
				data:{"addressId":addressId,"userId":userId},
				success:function (data){
			      		if(data != ""){
				       		alert("设置成功");
				       		location.href="${appPath}/usercenter/address";
				       	}else{
				       		alert("设置失败");
				       	}
		      	 }
			});
			
		});
		
		var $ww = $(window).width();
		if($ww>640) {
			$("#doc-modal-1").removeClass("am-modal am-modal-no-btn");
			console.log(3);
		}
		
	})
</script>

<!-- 点击删除地址 -->
<script type="text/javascript">
	function delClick(thisobj){
		//获取用户地址id参数
		var addressId = $(thisobj).parent(".new-addr-btn").parent(".user-addresslist").children("input[name='addressId']").val().trim();
		var userId = $(thisobj).parent(".new-addr-btn").parent(".user-addresslist").children("input[name='userId']").val().trim();
		//删除地址
		$.ajax({
			type:"post",
			dataType:"text",
			url:"${appPath}/usercenter/deleteAddress.do",
			data:{"addressId":addressId,"userId":userId},
			success:function (data){
	      	data = parseInt(data,10);
		      		if(data == 1){
			       		alert("删除成功");
			       		/* location.href="${appPath}/usercenter/address"; */
			       		$("#doc-modal-1").removeClass("am-modal am-modal-no-btn");
			       		$(thisobj).parent(".new-addr-btn").parent(".user-addresslist").remove();
			       	}else if(data == 0){
			       		alert("删除失败");
			       	}
	      	 }
		});
	}
</script>

<!-- 点击编辑回显地址数据 -->
<script type="text/javascript">
	function modifyAddress(thisobj){
		//获取用户地址id参数
		var addressId = $(thisobj).parent(".new-addr-btn").parent(".user-addresslist").children("input[name='addressId']").val().trim();
		var userId = $(thisobj).parent(".new-addr-btn").parent(".user-addresslist").children("input[name='userId']").val().trim();
		console.log(addressId);
		console.log(userId);
		//修改地址
        $.ajax({
		    type:"POST",//用post方式传输
		    dataType:"text",//数据格式：json
		   	url:"${appPath}/usercenter/modifyAddress.do",//目标地址
		   	data:{"addressId":addressId,"userId":userId},
		   	success:function (addressList){
		   		console.log(addressList);
		   		//分割地址字符串
		   		var addressArr = addressList.split(",");
		   		console.log(addressArr[0]);
		   		console.log(addressArr[1]);
		   		console.log(addressArr[2]);
		   		console.log(addressArr[3]);
		   		console.log(addressArr[4]);
		   		console.log(addressArr[5]);
		   		console.log(addressArr[6]);
		   		console.log(addressArr[7]);
		   		console.log(addressArr[8]);
		   		
	      		$("#user-addressId").attr("value",addressArr[0]);
	      		$("#user-userId").attr("value",addressArr[1]);
	      		$("#user-name").attr("value",addressArr[2]);
	      		$("#user-phone").attr("value",addressArr[3]);
	      		$("#user-province").attr("value",addressArr[4]);
	      		$("#user-city").attr("value",addressArr[5]);
	      		$("#user-area").attr("value",addressArr[6]);
	      		$("#user-intro").text(addressArr[7]);
	      		$("#user-addressStatus").attr("value",addressArr[8]);
	      	}
		 });
		   
		   
	}
	
</script>



	</body>

</html>