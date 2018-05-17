<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>支付宝支付</title>
    <link rel="stylesheet"  type="text/css" href="${appPath }/AmazeUI-2.4.2/assets/css/amazeui.css"/>
    <link href="${appPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${appPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />

    <link href="${appPath }/css/sustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${appPath }/basic/js/jquery-1.7.min.js"></script>
	
<style type="text/css">
	.successInfo{
		margin-left:150px;
		
	}
	.successInfo .user-info{
		border: 0px;
	}
	.successInfo img{
		margin-top:30px;
		margin-left:20px;
		width:300px;
		height: 300px;
	}
</style>

</head>

<body>
<%@include file="../../../shop/_head2.jsp"%>

	<c:if test="${sessionScope.User !=null }">
<div class="take-delivery">
	<form action="${appPath }/shop/successpay.do" method="post" >
	    <div class="status">
	        <h2>
	        	订单号： 
				<input class="idinp" name="orderId" value="${sessionScope.orderInfo.id }" readonly="readonly" type="text" style="width:280px">
				支付金额：
				<input class="moneyinp" name="prodMoney" value="${sessionScope.orderInfo.payMoney }" type="text" readonly="readonly" type="text" > 元
	        </h2>
	        <h2>
	        	付款人： 
				<input class="idinp" name="" value="${sessionScope.User.userName }" readonly="readonly" type="text" >
				付款方式：
				<input class="moneyinp" name="" value="${sessionScope.orderInfo.payMonent }" type="text" readonly="readonly" type="text" >
				<p style="font-size:20px"><i class="am-icon-spinner am-icon-spin"></i> 扫码支付成功完成后，<font style="color:red">请务必点击 [确认已支付]......</font></p>
	        </h2>
	        <div class="successInfo">

				<c:if test="${sessionScope.orderInfo.payMonent == '支付宝' }">
					<img alt="请扫码支付" src="${appPath }/images/error/zhifubao.png">

					<input value="确认已支付" type="submit"  class="am-btn am-btn-secondary am-round" style="width: 100px;height:60px;font-size:15px;margin-left:200px;margin-top:100px;"/>
				</c:if>
				<c:if test="${sessionScope.orderInfo.payMonent == '微信' }">
					<img alt="请扫码支付" src="${appPath }/images/error/weixin.jpg">

					<input value="确认已支付" type="submit"  class="am-btn am-btn-success am-round" style="width: 100px;height:60px;font-size:15px;margin-left:200px;margin-top:100px;"/>
				</c:if>

				<div class="option">
	            </div>
	        </div>
	    </div>
	</form>
</div>
    </c:if>
<%@ include file="/_foot.jsp" %>

</div>
<!--引导 -->
<%@include file="/_navigation.jsp" %>

<!-- 右侧导航栏 -->
<%@include file="/_rightbtn.jsp" %>
<!-- ↑引入右侧菜单栏 -->
</body>
</html>

