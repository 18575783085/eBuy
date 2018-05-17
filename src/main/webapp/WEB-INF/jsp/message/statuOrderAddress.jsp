<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>用户地址</title>
    <link rel="stylesheet"  type="text/css" href="${appPath }/AmazeUI-2.4.2/assets/css/amazeui.css"/>
    <link href="${appPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${appPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />

    <link href="${appPath }/css/sustyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${appPath }/basic/js/jquery-1.7.min.js"></script>
	
	<meta http-equiv="refresh" content="2;url=${appPath}/shop/pay">
	
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

<div class="take-delivery">
    <div class="status">
        <h2></h2>
        <div class="successInfo">
            <c:if test="${checkError==null }">
	            <ul>
	                <div class="user-info">
	                    <p style="font-size:30px">${addressMsg}</p>
	                    <p></p>
	                    <p style="font-size:20px"><i class="am-icon-spinner am-icon-spin"></i> 3秒后即将跳转回您的结算页面......</p>
	                    <p></p>
	                    <p style="font-size:20px;text-align: center;">没有反应？点击
	                    	<a href="${appPath}/shop/pay">
			                	<input value="这里" class="am-btn am-btn-warning am-radius" style="width: 80px;height:30px;font-size:13px;margin-bottom:4px;"/>
			                </a>
			             </p>
	                </div>
	            </ul>
            </c:if>
            <c:if test="${checkError!=null }">
	            <ul>
	                <div class="user-info">
	                    <p style="font-size:30px;color:red">${checkError}</p>
	                    <p></p>
	                    <p style="font-size:20px"><i class="am-icon-spinner am-icon-spin"></i> 3秒后即将跳转回您的结算页面......</p>
	                    <p></p>
	                    <p style="font-size:20px;text-align: center;">没有反应？点击
	                    	<a href="${appPath}/shop/pay">
			                	<input value="这里" class="am-btn am-btn-danger am-radius" style="width: 80px;height:30px;font-size:13px;margin-bottom:4px;"/>
			                </a>
			             </p>
	                </div>
	            </ul>
            </c:if>
            
            <div class="option">
            </div>
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

