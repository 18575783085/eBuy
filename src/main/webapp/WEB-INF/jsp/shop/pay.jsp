<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>结算页面</title>

    <link href="${appPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />

    <link href="${appPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="${appPath }/css/cartstyle.css" rel="stylesheet" type="text/css" />

    <link href="${appPath }/css/jsstyle.css" rel="stylesheet" type="text/css" />
    <link href="${appPath }/css/jsstyle2.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="${appPath }/js/address.js"></script>
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
          $(function() {
              $("#distpicker2").distpicker();
              autoSelect: false
              //$("#province").val('选择省');
              //$("#city").val('选择市');
             // $("#area").val('选择区');
          })
     </script>

</head>

<body>
<%@include file="../../../shop/_head2.jsp"%>

<div class="concent">
    <!--地址 -->
    <div class="paycont">
    
        <div class="address">
            <h3>确认收货地址 </h3>
            <div class="control">
                <div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
            </div>
            <div class="clear"></div>
            <ul>
            	<c:forEach items="${sessionScope.User.userAddress}" var="address">
	                <div class="per-border"></div>
	              <c:if test="${address.addressId != null }">
	                <li  <c:if test="${address.addressStatus == 1 }">class="user-addresslist defaultAddr"</c:if>
	                	<c:if test="${address.addressStatus == 0 }">class="user-addresslist"</c:if>
	                >
	                	<span class="new-option-r"><i class="am-icon-check-circle"></i>默认</span>
	                	
 						<input type="hidden" value="${address.addressId }" name="addressId" id="addressId"/>
						<input type="hidden" value="${address.userId }" name="userId" id="userId"/>
						<input type="hidden" value="${address.addressStatus }" name="addressStatus" id="addressStatus"/>
	                    <div class="address-left">
	                        <div class="user ">
								<span class="buy-address-detail">   
                 					<span class="buy-user" id="buy-user">${address.userReceiver } </span>
									<span class="buy-phone" id="buy-phone">${address.userPhone }</span>
								</span>
	                        </div>
	                        <div class="default-address ">
	                            <span class="buy-line-title buy-line-title-type" id="buy-line-title-type">收货地址：</span>
	                            <span class="buy--address-detail">
									   <span class="province">${address.userProvince }</span>
										<span class="city" >${address.userCity }</span>
										<span class="dist" >${address.userDistrict }</span>
										<span class="street">${address.userAddress }</span>
								</span>
	                        </div>
	                        
	                    </div>
	                    <div class="address-right">
	                        <a href="${appPath }/usercenter/address">
	                        <span class="am-icon-angle-right am-icon-lg"></span></a>
	                    </div>
	                    <div class="clear"></div>
	
	                    <div class="new-addr-btn">
	                        <span class="new-addr-bar hidden">|</span>
	                        <a href="javascript:void(0);" class="theme-login2" onclick="modifyAddress(this)" ><i class="am-icon-edit"></i>编辑</a>
	                        <span class="new-addr-bar">|</span>
	                        <a href="javascript:void(0);" onclick="delClick(this);"><i class="am-icon-trash"></i>删除</a>
	                    </div>
	
	                </li>
	              </c:if>
              	</c:forEach>

            </ul>

            <div class="clear"></div>
        </div>
        <!--物流 -->
        <div class="logistics">
            <h3>选择物流方式</h3>
            <ul class="op_express_delivery_hot">
                <li data-value="yuantong" class="OP_LOG_BTN  " id="ship1"><i class="c-gap-right" style="background-position:0px -468px"></i>圆通 <span ></span></li>
                <li data-value="shentong" class="OP_LOG_BTN  " id="ship2"><i class="c-gap-right" style="background-position:0px -1008px"></i>申通 <span ></span></li>
                <li data-value="yunda" class="OP_LOG_BTN  " id="ship3"><i class="c-gap-right" style="background-position:0px -576px"></i>韵达 <span ></span></li>
                <li data-value="zhongtong" class="OP_LOG_BTN op_express_delivery_hot_last " id="ship4"><i class="c-gap-right" style="background-position:0px -324px"></i>中通 <span ></span></li>
                <li data-value="shunfeng" class="OP_LOG_BTN  op_express_delivery_hot_bottom" id="ship5"><i class="c-gap-right" style="background-position:0px -180px"></i>顺丰<span ></span></li>
            </ul>
        </div>
        <div class="clear"></div>

        <!--支付方式-->
        <div class="logistics">
            <h3>选择支付方式</h3>
            <ul class="pay-list">
                <li class="pay card" id="pay1"><img src="${appPath }/images/wangyin.jpg" />银联<span></span></li>
                <li class="pay qq" id="pay2"><img src="${appPath }/images/weizhifu.jpg" />微信<span></span></li>
                <li class="pay taobao" id="pay3"><img src="${appPath }/images/zhifubao.jpg" />支付宝<span></span></li>
            </ul>
        </div>
        <div class="clear"></div>

        <!--订单 -->
        <div class="concent">
            <div id="payTable">
                <h3>确认订单信息</h3>
                <div class="cart-table-th">
                    <div class="wp">

                        <div class="th th-item">
                            <div class="td-inner">商品信息</div>
                        </div>
                        <div class="th th-price">
                            <div class="td-inner">单价</div>
                        </div>
                        <div class="th th-amount">
                            <div class="td-inner">数量</div>
                        </div>
                        <div class="th th-sum">
                            <div class="td-inner">金额</div>
                        </div>
                        <div class="th th-oplist">
                            <div class="td-inner">配送方式</div>
                        </div>

                    </div>
                </div>
                <div class="clear"></div>

                <tr class="item-list">
                    <div class="bundle  bundle-last">
							<input type="hidden" value="${sessionScope.product.id }" id="prodId">
                        <div class="bundle-main">
                            <ul class="item-content clearfix">
                                <div class="pay-phone">
                                    <li class="td td-item">
                                        <div class="item-pic">
                                            <a href="#" class="J_MakePoint">
                                                <img src="${sessionScope.product.imgUrl}" class="itempic J_ItemImg" width="100px"></a>
                                                <input type="hidden" value="${sessionScope.product.imgUrl}" id="prodImgurl">
                                        </div>
                                        <div class="item-info">
                                            <div class="item-basic-info">
                                                <a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11" id="prodName" >${sessionScope.product.name }</a>
                                            </div>
                                        </div>
                                    </li>
                                    <%--<li class="td td-info">--%>
                                        <%--<div class="item-props">--%>
                                            <%--<span class="sku-line">产地：中国</span>--%>
                                            <%--<span class="sku-line">版本：典藏版</span>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>
                                    <li class="td td-price">
                                        <div class="item-price price-promo-promo">
                                            <div class="price-content">
                                                <em class="J_Price price-now">${sessionScope.product.promotionPrice }</em>
                                            </div>
                                        </div>
                                    </li>
                                </div>
                                <li class="td td-amount">
                                    <div class="amount-wrapper ">
                                        <div class="item-amount ">
                                            <span class="phone-title">购买数量</span>
                                            <div class="sl">
                                                <!-- <input class="min am-btn" name="" type="button" value="-" /> -->
                                                <input class="text_box" name="prodsNum" id="prodNum" type="text" value="${sessionScope.product.prodsNum }" readonly="readonly" style="width:45px; text-align: center" />
                                                <!-- <input class="add am-btn" name="" type="button" value="+" /> -->
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li class="td td-sum">
                                    <div class="td-inner">
                                        <em tabindex="0" class="J_ItemSum number">${sessionScope.product.prodsNum * sessionScope.product.promotionPrice }</em>
                                    </div>
                                </li>
                                <li class="td td-oplist">
                                    <div class="td-inner">
                                        <span class="phone-title">配送方式</span>
                                        <div class="pay-logis">
                                            快递<b class="sys_item_freprice">10</b>元
                                        </div>
                                    </div>
                                </li>

                            </ul>
                            <div class="clear"></div>

                        </div>
                </tr>
                <div class="clear"></div>
            </div>

        </div>
        <div class="clear"></div>
        <div class="pay-total">
            <!--留言-->
            <div class="order-extra">
                <div class="order-user-info">
                    <div id="holyshit257" class="memo">
                        <label>买家留言：</label>
                        <input type="text" name="buyerNick" id="buyerNick" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" placeholder="选填,建议填写和卖家达成一致的说明" class="memo-input J_MakePoint c2c-text-default memo-close">
                        <div class="msg hidden J-msg">
                            <p class="error">最多输入500个字符</p>
                        </div>
                    </div>
                </div>

            </div>

            <div class="clear"></div>
        </div>
        <!--含运费小计 -->
        <div class="buy-point-discharge ">
            <p class="price g_price ">
                合计（含运费） <span>¥</span><em class="pay-sum">${sessionScope.product.prodsNum * sessionScope.product.promotionPrice + 10}</em>
            </p>
        </div>

        <!--信息 -->
        <div class="order-go clearfix">
            <div class="pay-confirm clearfix">
                <div class="box">
                    <div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
                        <span class="price g_price " >
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">${sessionScope.product.prodsNum * sessionScope.product.promotionPrice + 10}</em>
						</span>
                    </div>

                    <div id="holyshit268" class="pay-address">
						<c:forEach items="${sessionScope.User.userAddress }" var="addressinfo">
							<c:if test="${addressinfo.addressStatus==1 }">
		                        <p class="buy-footer-address">
		                            <span class="buy-line-title buy-line-title-type">寄送至：</span>
		                            <span class="buy--address-detail">
										   <span class="province" id="address-province">${addressinfo.userProvince }</span>
											<span class="city" id="address-city" >${addressinfo.userCity }</span>
											<span class="dist" id="address-dist" >${addressinfo.userDistrict }</span>
											<span class="street" id="address-street" >${addressinfo.userAddress }</span>
									</span>
		                        </p>
		                        <p class="buy-footer-address">
		                            <span class="buy-line-title">收货人：</span>
		                            <span class="buy-address-detail">   
		                                <span class="buy-user" id="address-user">${addressinfo.userReceiver }</span>
										<span class="buy-phone" id="address-phone">${addressinfo.userPhone }</span>
									</span>
		                        </p>
                        	</c:if>
                        </c:forEach>
                        <!-- <p class="buy-footer-address">
                            <span class="buy-line-title buy-line-title-type">寄送至：</span>
                            <span class="buy--address-detail">
								   <span class="province" id="address-province"></span>
									<span class="city" id="address-city" ></span>
									<span class="dist" id="address-dist" ></span>
									<span class="street" id="address-street" ></span>
							</span>
                        </p>
                        <p class="buy-footer-address">
                            <span class="buy-line-title">收货人：</span>
                            <span class="buy-address-detail">   
                                <span class="buy-user" id="address-user"></span>
								<span class="buy-phone" id="address-phone"></span>
							</span>
                        </p> -->
                    </div>
                </div>

                <div id="holyshit269" class="submitOrder">
                    <div class="go-btn-wrap">
                    	<!-- 跳转到一个虚假的扫码支付页面(根据支付方式跳转页面) -->
                        <!-- <a id="J_Go" href="" class="btn-go" tabindex="0" ></a> -->
                        <input type="button" value="提交订单"class="am-btn am-btn-warning am-radius" title="点击此按钮，提交订单" onclick="addOrder()">
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        
    </div>

    <div class="clear"></div>
</div>
</div>
<%@ include file="/_foot.jsp" %>
</div>

<script type="text/javascript">
	function addOrder(){
		//获取物流名称
		var s;
		if($("#ship1").hasClass("selected")){
			s = $("#ship1").text();
		}else if($("#ship2").hasClass("selected")){
			s = $("#ship2").text();
		}else if($("#ship3").hasClass("selected")){
			s = $("#ship3").text();
		}else if($("#ship4").hasClass("selected")){
			s = $("#ship4").text();
		}else if($("#ship5").hasClass("selected")){
			s = $("#ship5").text();
		}
		console.log(s);

		var addressprovince = $("#address-province").text();
		if(addressprovince == "" ){
		    alert("请新增地址或设置默认地址")
            return;
        }


		if(s == null){
			alert("请选择其中一种物流方式");
			return;
		}
		
		//获取支付方式
		var pay;
		if($("#pay1").hasClass("selected")){
			pay = $("#pay1").text();
		}else if($("#pay2").hasClass("selected")){
			pay = $("#pay2").text();
		}else if($("#pay3").hasClass("selected")){
			pay = $("#pay3").text();
		}
		 console.log(pay);
		 
		 if(pay == null){
		 	alert("请选择其中一种支付方式");
		 	return;
		 }
		 
		 //买家留言参数
		 var buyerNick = $("#buyerNick").text();
		 //应付金额参数
		 var prodMoney = $("#J_ActualFee").text();
		//商品id
		var prodId =  $("#prodId").val().trim();
		//商品名称
        var prodName = $("#prodName").text();
		//商品数量
        var prodNum = $("#prodNum").val().trim();
        //商品图片
		var prodImgurl = $("#prodImgurl").val().trim();
		
		
		//判断哪种支付方式
		if(pay == "银联"){
			$.ajax({
				type:"post",
				dataType:"text",
				url:"${appPath}/shop/addOrder.do",
				data:{"prodId":prodId,"prodName":prodName,"prodNum":prodNum,"prodImgurl":prodImgurl,"prodMoney":prodMoney,"shippingName":s,"payMonent":pay,"buyerNick":buyerNick},
				success:function (data){
				data = parseInt(data,10);
			      		if(data == 1){
			      			alert("提交成功！！！");
							location.href = "${appPath}/shop/unionpay";			      			
			      		}else if(data == 2){
			      			alert("不好意思，请麻烦用户您先登录再添加订单!")
			      			location.href = "${appPath}/shop/index";	
			      		}else if(data == 3){
			      			alert("您的购物车为空，请您回到商城尽情扫货吧！！");
			      			location.href = "${appPath}/shop/index";
			      		}else if(data == 4){
			      			alert("提交失败，请您回到购物车再重新结算！！！");
			      			location.href = "${appPath}/shop/shopcart";
			      		}
		      	 }
			});		 
		}else if(pay == "微信" || pay == "支付宝"){
			$.ajax({
					type:"post",
					dataType:"text",
					url:"${appPath}/shop/confirmpay.do",
					data:{"prodId":prodId,"prodName":prodName,"prodNum":prodNum,"prodImgurl":prodImgurl,"prodMoney":prodMoney,"shippingName":s,"payMonent":pay,"buyerNick":buyerNick},
					success:function (data){
					data = parseInt(data,10);
				      		if(data == 1){
				      			alert("提交成功！！！");
								location.href = "${appPath}/shop/Confirmpay";			      			
				      		}else if(data == 2){
				      			alert("不好意思，请麻烦用户您先登录再添加订单!")
				      			location.href = "${appPath}/shop/index";	
				      		}else if(data == 3){
				      			alert("您的购物车为空，请您回到商城尽情扫货吧！！");
				      			location.href = "${appPath}/shop/index";
				      		}else if(data == 4){
				      			alert("提交失败，请您回到购物车再重新结算！！！");
				      			location.href = "${appPath}/shop/shopcart";
				      		}
			      	 }
				});		 
		
		}
		
		
	
	}

</script>



<!-- 新增地址 -->
<div class="theme-popover-mask"></div>
<div class="theme-popover">

    <!--标题 -->
    <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">
        								新增地址
        						 </strong> / <small>Add address</small></div>
    </div>
    <hr/>

    <div class="am-u-md-12">
		<form class="am-form am-form-horizontal" method="post" action="${appPath }/shop/addAddress.do">
		
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
				<label for="user-address" class="am-form-label">所在地</label>
				<div class="am-form-content address" id="distpicker1">
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
					<button type="button" class="am-btn am-btn-danger" onclick="addAddress()">保存</button>
					<div class="am-btn am-btn-danger close">取消</div>
				</div>
			</div>
		</form>
	</div>
</div>

<!-- 新增地址 -->
<script type="text/javascript">
	function addAddress(){
		//获取新增地址面板的地址参数 
		var userreceiver = $("#user-name").val().trim();
		var userphone = $("#user-phone").val().trim();
		var userprovince = $("#province").val().trim();
		var usercity = $("#city").val().trim();
		var userdistrict = $("#area").val().trim();
		var useraddress = $("#user-intro").val().trim();
		
		$.ajax({
			type:"post",
			dataType:"text",
			url:"${appPath}/shop/addAddress.do",
			data:{"userReceiver":userreceiver,"userPhone":userphone,"userProvince":userprovince,"userCity":usercity,"userDistrict":userdistrict,"userAddress":useraddress},
			success:function (data){
	      	data = parseInt(data,10);
		      		if(data == 1){
			       		alert("新增成功");
			       		$(document.body).css("overflow","visible");
						$(".theme-login").removeClass("selected");
						$(".item-props-can").removeClass("selected");					
						$(".theme-popover-mask").hide();
						$(".theme-popover").slideUp(200);
						
						location.href="${appPath}/shop/pay";
						
			       	}else if(data == 0){
			       		alert("新增失败");
			       		$(document.body).css("overflow","visible");
						$(".theme-login").removeClass("selected");
						$(".item-props-can").removeClass("selected");					
						$(".theme-popover-mask").hide();
						$(".theme-popover").slideUp(200);
			       	}
	      	 }
		});
	
	}
	
</script>



<!-- 编辑地址 -->
<div class="theme-popover-mask2"></div>
<div class="theme-popover2">

    <!--标题 -->
    <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">
        								编辑地址
        						 </strong> / <small>Add address</small></div>
    </div>
    <hr/>

    <div class="am-u-md-12">
		<form class="am-form am-form-horizontal" method="post" action="${appPath }/shop/updateAddress.do">
		
			<input type="hidden" value="" name="addressId" id="user-addressId2"/>
			<input type="hidden" value="" name="userId" id="user-userId2"/>
			<input type="hidden" value="" name="addressStatus" id="user-addressStatus2"/>
			<div class="am-form-group">
				<label for="user-name2" class="am-form-label">收货人</label>
				<div class="am-form-content">
					<input type="text" id="user-name2" name="userReceiver" value="" placeholder="收货人" maxlength="10" title="不能超过10个字符" required>
				</div>
			</div>
			
			<div class="am-form-group">
				<label for="user-phone2" class="am-form-label">手机号码</label>
				<div class="am-form-content">
					<input id="user-phone2" name="userPhone" value="" placeholder="手机号必填" type="tel" maxlength="11" title="不能超过11个字符" required>
				</div>
			</div>
			
				<div class="am-form-group">
					<label for="user-address" class="am-form-label">所在地区</label>
					<div class="am-form-content address2">
						<input type="text" id="user-province2" value="" disabled="disabled"/>
						<input type="text" id="user-city2" value="" disabled="disabled"/>
						<input type="text" id="user-area2" value="" disabled="disabled"/>
					</div>
				</div>
			
			<div class="am-form-group">
				<label for="user-address" class="am-form-label">所在地
												(<font style="color:red">请重选</font>)
				</label>
				<div class="am-form-content address" id="distpicker2">
					 <select  name="userProvince" id="province" ></select>
					 <select  name="userCity" id="city" ></select>
					 <select  name="userDistrict" id="area" ></select>
				</div>
			</div>

			<div class="am-form-group">
				<label for="user-intro2" class="am-form-label">详细地址</label>
				<div class="am-form-content">
					<textarea class="" rows="3" id="user-intro2" name="userAddress" placeholder="输入详细地址" maxlength="100" title="不能超过100个字符" required></textarea>
					<small>100字以内写出你的详细地址...</small>
				</div>
			</div>

			<div class="am-form-group theme-poptit2">
				<div class="am-u-sm-9 am-u-sm-push-3">
					<button type="submit" class="am-btn am-btn-danger" onclick="updateAddress()">保存</button>
					<div class="am-btn am-btn-danger close">取消</div>
				</div>
			</div>
		</form>
	</div>
</div>

<div class="clear"></div>
<!--引导 -->
<%@include file="/_navigation.jsp" %>

<!-- 右侧导航栏 -->
<%@include file="/_rightbtn.jsp" %>
<!-- ↑引入右侧菜单栏 -->





<!-- 点击选择默认地址 -->
<script type="text/javascript">
	$(document).ready(function() {							
		$(".new-option-r").click(function() {
			$(this).parent(".user-addresslist").addClass("defaultAddr").siblings().removeClass("defaultAddr");
			
			//获取用户地址id参数
			var addressId = $(this).parent(".user-addresslist").children("input[name='addressId']").val().trim();
			var userId = $(this).parent(".user-addresslist").children("input[name='addressId']").next("input[name='userId']").val().trim();
			
			//修改地址状态
			$.ajax({
				type:"post",
				dataType:"text",
				url:"${appPath}/usercenter/changeDefalutAddress.do",
				data:{"addressId":addressId,"userId":userId},
				success:function (data){
			      		if(data != ""){
				      		alert("设置成功");
							location.href="${appPath}/shop/pay";
				       	}else{
				       		alert("设置失败");
				       	}
		      	 }
			});
			
		});
	})
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
		   		
	      		$("#user-addressId2").attr("value",addressArr[0]);
	      		$("#user-userId2").attr("value",addressArr[1]);
	      		$("#user-name2").attr("value",addressArr[2]);
	      		$("#user-phone2").attr("value",addressArr[3]);
	      		$("#user-province2").attr("value",addressArr[4]);
	      		$("#user-city2").attr("value",addressArr[5]);
	      		$("#user-area2").attr("value",addressArr[6]);
	      		$("#user-intro2").text(addressArr[7]);
	      		$("#user-addressStatus2").attr("value",addressArr[8]);
	      	}
		 });
		   
		   
	}
	
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
			       		$("#doc-modal-1").removeClass("am-modal am-modal-no-btn");
			       		$(thisobj).parent(".new-addr-btn").parent(".user-addresslist").remove();
                        location.href="${appPath}/shop/pay";
			       	}else if(data == 0){
			       		alert("删除失败");
			       	}
	      	 }
		});
	}
</script>




</body>


</html>
