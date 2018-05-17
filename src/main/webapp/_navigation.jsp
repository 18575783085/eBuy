<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<style>
/*导航----引导栏*/
.navCir{position: fixed;bottom:0px ;width: 100%;z-index: 999;background:#fff ;}
.navCir li{width: 25%;padding:5px ;background:#fff ;border-top:1px solid #f5f5f5 ;float: left;text-align: center;font-size: 14px;}
.navCir li i{display: block;font-size: 18px;}
.navCir li.active a{color:#F03726 ;}
</style>
<!--引导 -->
<div class="navCir">
	<li><a href="${appPath}/home"><i class="am-icon-home "></i>首页</a></li>
	<li><a href="${appPath}/sort"><i class="am-icon-list"></i>分类</a></li>
	<li><a href="${appPath}/shop/shopcart"><i class="am-icon-shopping-basket"></i>购物车</a></li>
	<li class="active"><a href="${appPath}/usercenter/index"><i class="am-icon-user"></i>我的</a></li>
</div>


