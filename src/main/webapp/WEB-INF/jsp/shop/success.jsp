<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>付款成功页面</title>
    <link rel="stylesheet"  type="text/css" href="${appPath }/AmazeUI-2.4.2/assets/css/amazeui.css"/>
    <link href="${appPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${appPath }/AmazeUI-2.4.2/assets/fonts/fontawesome-webfont.svg" rel="stylesheet" type="text/css">
    <link href="${appPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />

    <link href="${appPath }/css/sustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${appPath }/basic/js/jquery-1.7.min.js"></script>
<style type="text/css">
	.user-info p{
		font-size: 15px;
	}
</style>
</head>

<body>
<%@include file="../../../shop/_head2.jsp"%>

<div class="take-delivery">
    <div class="status">
        <h2 style="font-size:20px">您已成功付款</h2>
        <div class="successInfo">
            <ul>
                <li>付款金额：<em>${sessionScope.orderInfo.payMoney }</em></li>
                <div class="user-info" style="margin-top:20px;">
                    <p><span class="am-icon-male am-icon-sm"></span>&nbsp;收货人：${sessionScope.orderInfo.userReceiver }</p>
                    <p><span class="am-icon-phone am-icon-sm"></span>&nbsp;联系电话：${sessionScope.orderInfo.userPhone }</p>
                    <p><span class="am-icon-home am-icon-sm"></span>&nbsp;收货地址：${sessionScope.orderInfo.userProvince } ${sessionScope.orderInfo.userCity } ${sessionScope.orderInfo.userDistrict } ${sessionScope.orderInfo.userAddress }</p>
                </div>
                <i class="am-icon-refresh am-icon-spin"></i>  请认真核对您的收货信息，如有错误请联系 我们可爱并帅气的[客服]

            </ul>
           <%--  <div class="option">
                <span class="info">您可以</span>
                <a href="${appPath }/userCenter/order.html" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
                <a href="${appPath }/userCenter/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a>
            </div> --%>
        </div>
    </div>
</div>
<%@ include file="/_foot.jsp" %>

</div>
<!--引导 -->
<%@include file="/_navigation.jsp" %>

<!-- 右侧导航栏 -->
<%@include file="/_rightbtn.jsp" %>
<!-- ↑引入右侧菜单栏 -->
</body>
</html>

