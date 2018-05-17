<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>订单支付确认</title>
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
</style>

</head>

<body>
<%@include file="../../../shop/_head2.jsp"%>

	<c:if test="${sessionScope.User !=null }">
<div class="take-delivery">
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
				<input class="moneyinp" name="" value="银行卡" type="text" readonly="readonly" type="text" >
				<p style="font-size:20px"><i class="am-icon-spinner am-icon-spin"></i> 请点击 [确认提交]......</p>
	        </h2>
	        <div class="successInfo">
	        	<form action="https://www.yeepay.com/app-merchant-proxy/node" method="post" >
		            <input type="hidden" name="pd_FrpId" value="${pd_FrpId }" />
					<input type="hidden" name="p0_Cmd" value="${p0_Cmd }" />
					<input type="hidden" name="p1_MerId" value="${p1_MerId }" />
					<input type="hidden" name="p2_Order" value="${p2_Order }" />
					<input type="hidden" name="p3_Amt" value="${p3_Amt }" />
					<input type="hidden" name="p4_Cur" value="${p4_Cur }" />
					<input type="hidden" name="p5_Pid" value="${p5_Pid }" />
					<input type="hidden" name="p6_Pcat" value="${p6_Pcat }" />
					<input type="hidden" name="p7_Pdesc" value="${p7_Pdesc }" />
					<input type="hidden" name="p8_Url" value="${p8_Url }" />
					<input type="hidden" name="p9_SAF" value="${p9_SAF }" />
					<input type="hidden" name="pa_MP" value="${pa_MP }" />
					<input type="hidden" name="pr_NeedResponse" value="${pr_NeedResponse }" />
					<input type="hidden" name="hmac" value="${hmac }" />
	               	<input value="确认提交" type="submit"  class="am-btn am-btn-warning am-radius" style="width: 80px;height:40px;font-size:13px;margin-left:200px;margin-top:100px;"/>
	            </form>
	            <div class="option">
	            </div>
	        </div>
	    </div>
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

