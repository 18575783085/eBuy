<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>

<aside class="menu">
			<ul>
				<li class="person active">
					<a href="${appPath }/usercenter/index"><i class="am-icon-user"></i>个人中心</a>
				</li>
				<li class="person">
					<p><i class="am-icon-newspaper-o"></i>个人资料</p>
					<ul>
						<li> <a href="${appPath }/usercenter/information?userId=${sessionScope.User.userId}">个人信息</a></li>
						<li> <a href="${appPath }/usercenter/safety">安全设置</a></li>
						<li> <a href="${appPath }/usercenter/address">地址管理</a></li>
					</ul>
				</li>
				<li class="person">
					<p><i class="am-icon-balance-scale"></i>我的交易</p>
					<ul>
						<li><a href="${appPath }/usercenter/order">订单管理</a></li>
						<li> <a href="${appPath }/usercenter/comment">评价商品</a></li>
					</ul>
				</li>
				<li class="person">
					<p><i class="am-icon-dollar"></i>我的资产</p>
					<ul>
						<li> <a href="${appPath }/usercenter/wallet">账户余额</a></li>
						<li> <a href="${appPath }/usercenter/bill">账单明细</a></li>
					</ul>
				</li>

				<li class="person">
					<p><i class="am-icon-tags"></i>我的收藏</p>
					<ul>
						<li> <a href="${appPath }/usercenter/collection">收藏</a></li>
					</ul>
				</li>

				<li class="person">
					<p><i class="am-icon-qq"></i>在线客服</p>
					<ul>
						<li> <a href="${appPath }/usercenter/suggest">意见反馈</a></li>
						<li> <a href="${appPath }/usercenter/news">我的消息</a></li>
					</ul>
				</li>
			</ul>

</aside>