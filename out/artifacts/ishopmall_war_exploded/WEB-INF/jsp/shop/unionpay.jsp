<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>银联支付页面</title>
    <link rel="stylesheet"  type="text/css" href="${appPath }/AmazeUI-2.4.2/assets/css/amazeui.css"/>
    <link href="${appPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${appPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />

    <link href="${appPath }/css/sustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${appPath }/basic/js/jquery-1.7.min.js"></script>

<style type="text/css">
	.successInfo{
		margin-top:40px;
	}
	.successInfo ul li{
	list-style-type:none;
		float:left;
		width:180px;
		margin:20px 10px 16px 0px;
	}
	.successInfo img:hover{
		cursor: pointer;
	}
</style>

</head>

<body>
<%@include file="../../../shop/_head2.jsp"%>

  <c:if test="${sessionScope.User !=null }">
<div class="take-delivery">
	<form action="${appPath }/shop/orderUnionpay.do" method="post">
	    <div class="status">
	        <h2>
	        	订单号： 
				<input class="idinp" name="orderId" value="${sessionScope.orderInfo.id }" readonly="readonly" type="text" style="width:280px">
				支付金额：
				<input class="moneyinp" name="prodMoney" value="${sessionScope.orderInfo.payMoney }" type="text" readonly="readonly" type="text" > 元
				<p style="font-size:20px"><i class="am-icon-cog am-icon-spin"></i> 请选择 您的小金库......</p>
	        </h2>
	        <div class="successInfo">
	            <ul>
	                <li>
	                	<label for="gs">
		                	<input name="pd_FrpId" type="radio" value="ICBC-NET-B2C" id="gs"> 
							<img src="${appPath}/images/pay/01gs.jpg" width="130" height="52" id="gs" >
	                	</label>
					</li>
					<li>
						<label for="zs">
							<input name="pd_FrpId" type="radio" value="CMBCHINA-NET-B2C" id="zs" >
							<img src="${appPath}/images/pay/02zs.jpg" width="130" height="52" id="zs" >
						</label>
					</li>
					<li>
						<label for="js">
							<input name="pd_FrpId" type="radio" value="CCB-NET-B2C" id="js" >
							<img src="${appPath}/images/pay/03js.jpg" width="130" height="52" id="js" >
						</label>
					</li>
					<li>
						<label for="ny">
							<input name="pd_FrpId" type="radio" value="ABC-NET-B2C" id="ny" >
							<img src="${appPath}/images/pay/04ny.jpg" width="130" height="52" id="ny" >
						</label>
					</li>
					<li>
						<label for="zg">
							<input name="pd_FrpId" type="radio" value="BOC-NET-B2C" id="zg" >
							<img src="${appPath}/images/pay/05zg.jpg" width="130" height="52" id="zg" >
						</label>
					</li>
					<li>
						<label for="jt">
							<input name="pd_FrpId" type="radio" value="BOCO-NET-B2C" id="jt" >
							<img src="${appPath}/images/pay/06jt.jpg" width="130" height="52" id="jt" >
						</label>
					</li>
					<li>
						<label for="hx">
							<input name="pd_FrpId" type="radio" value="HXB-NET-B2C" id="hx" >
							<img src="${appPath}/images/pay/07hx.jpg" width="130" height="52" id="hx" >
						</label>
					</li>
					<li>
						<label for="xy">
							<input name="pd_FrpId" type="radio" value="CIB-NET-B2C" id="xy" >
							<img src="${appPath}/images/pay/08xy.jpg" width="130" height="52" id="xy" >
						</label>
					</li>
	
					<li>
						<label for="gd">
							<input name="pd_FrpId" type="radio" value="GDB-NET-B2C" id="gd" >
							<img src="${appPath}/images/pay/09gd.jpg" width="130" height="52" id="gd" >
						</label>
					</li>
	
					<li>
						<label for="sz">
							<input name="pd_FrpId" type="radio" value="SDB-NET-B2C" id="sz" >
							<img src="${appPath}/images/pay/10sz.jpg" width="130" height="52" id="sz" >
						</label>
					</li>
	
					<li>
						<label for="ms">
							<input name="pd_FrpId" type="radio" value="CMBC-NET-B2C" id="ms" >
							<img src="${appPath}/images/pay/11ms.jpg" width="130" height="52" id="ms" >
						</label>
					</li>
	
					<li>
						<label for="sh">
							<input name="pd_FrpId" type="radio" value="SPDB-NET-B2C" id="sh" >
							<img src="${appPath}/images/pay/12sh.jpg" width="130" height="52" id="sh" >
						</label>
					</li>
	
					<li>
						<label for="zx">
							<input name="pd_FrpId" type="radio" value="ECITIC-NET-B2C" id="zx" >
							<img src="${appPath}/images/pay/13zx.jpg" width="130" height="52" id="zx" >
						</label>
					</li>
	
					<li>
						<label for="gd2">
							<input name="pd_FrpId" type="radio" value="CEB-NET-B2C" id="gd2" >
							<img src="${appPath}/images/pay/14gd.jpg" width="130" height="52" id="gd2" >
						</label>
					</li>
	
					<li>
						<label for="cq">
							<input name="pd_FrpId" type="radio" value="" id="cq" >
							<img src="${appPath}/images/pay/15cq.jpg" width="130" height="52" id="cq">
						</label>
					</li>
	
					<li>
						<label for="bh">
							<input name="pd_FrpId" type="radio" value="CBHB-NET-B2C" id="bh" >
							<img src="${appPath}/images/pay/16bh.jpg" width="130" height="52" id="bh" >
						</label>
					</li>
	            </ul>
	        </div>
	        <div class="option">
	        	<input value="确认支付" type="submit" class="am-btn am-btn-warning am-radius" style="width: 80px;height:40px;font-size:13px;margin-left:70%"/>
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

