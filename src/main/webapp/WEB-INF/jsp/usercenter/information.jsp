<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>个人资料</title>

		<link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="${appPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" >
			function DateSelector(selYear, selMonth, selDay) { 
				this.selYear = selYear; 
				this.selMonth = selMonth; 
				this.selDay = selDay; 
				this.selYear.Group = this; 
				this.selMonth.Group = this; 
				// 给年份、月份下拉菜单添加处理onchange事件的函数 
				if (window.document.all != null) // IE 
				{ 
				this.selYear.attachEvent("onchange", DateSelector.Onchange); 
				this.selMonth.attachEvent("onchange", DateSelector.Onchange); 
				} 
				else // Firefox 
				{ 
				this.selYear.addEventListener("change", DateSelector.Onchange, false); 
				this.selMonth.addEventListener("change", DateSelector.Onchange, false); 
				} 
				if (arguments.length == 4) // 如果传入参数个数为4，最后一个参数必须为Date对象 
				this.InitSelector(arguments[3].getFullYear(), arguments[3].getMonth() + 1, arguments[3].getDate()); 
				else if (arguments.length == 6) // 如果传入参数个数为6，最后三个参数必须为初始的年月日数值 
				this.InitSelector(arguments[3], arguments[4], arguments[5]); 
				else // 默认使用当前日期 
				{ 
				var dt = new Date(); 
				this.InitSelector(dt.getFullYear(), dt.getMonth() + 1, dt.getDate()); 
				} 
				} 
				// 增加一个最大年份的属性 
				DateSelector.prototype.MinYear = 1900; 
				// 增加一个最大年份的属性 
				DateSelector.prototype.MaxYear = (new Date()).getFullYear(); 
				// 初始化年份 
				DateSelector.prototype.InitYearSelect = function () { 
				// 循环添加OPION元素到年份select对象中 
				for (var i = this.MaxYear; i >= this.MinYear; i--) { 
				// 新建一个OPTION对象 
				var op = window.document.createElement("OPTION"); 
				// 设置OPTION对象的值 
				op.value = i; 
				// 设置OPTION对象的内容 
				op.innerHTML = i; 
				// 添加到年份select对象 
				this.selYear.appendChild(op); 
				} 
				} 
				// 初始化月份 
				DateSelector.prototype.InitMonthSelect = function () { 
				// 循环添加OPION元素到月份select对象中 
				for (var i = 1; i < 13; i++) { 
				// 新建一个OPTION对象 
				var op = window.document.createElement("OPTION"); 
				// 设置OPTION对象的值 
				op.value = i; 
				// 设置OPTION对象的内容 
				op.innerHTML = i; 
				// 添加到月份select对象 
				this.selMonth.appendChild(op); 
				} 
				} 
				// 根据年份与月份获取当月的天数 
				DateSelector.DaysInMonth = function (year, month) { 
				var date = new Date(year, month, 0); 
				return date.getDate(); 
				} 
				// 初始化天数 
				DateSelector.prototype.InitDaySelect = function () { 
				// 使用parseInt函数获取当前的年份和月份 
				var year = parseInt(this.selYear.value); 
				var month = parseInt(this.selMonth.value); 
				// 获取当月的天数 
				var daysInMonth = DateSelector.DaysInMonth(year, month); 
				// 清空原有的选项 
				this.selDay.options.length = 0; 
				// 循环添加OPION元素到天数select对象中 
				for (var i = 1; i <= daysInMonth; i++) { 
				// 新建一个OPTION对象 
				var op = window.document.createElement("OPTION"); 
				// 设置OPTION对象的值 
				op.value = i; 
				// 设置OPTION对象的内容 
				op.innerHTML = i; 
				// 添加到天数select对象 
				this.selDay.appendChild(op); 
				} 
				} 
				// 处理年份和月份onchange事件的方法，它获取事件来源对象（即selYear或selMonth） 
				// 并调用它的Group对象（即DateSelector实例，请见构造函数）提供的InitDaySelect方法重新初始化天数 
				// 参数e为event对象 
				DateSelector.Onchange = function (e) { 
				var selector = window.document.all != null ? e.srcElement : e.target; 
				selector.Group.InitDaySelect(); 
				} 
				// 根据参数初始化下拉菜单选项 
				DateSelector.prototype.InitSelector = function (year, month, day) { 
				// 由于外部是可以调用这个方法，因此我们在这里也要将selYear和selMonth的选项清空掉 
				// 另外因为InitDaySelect方法已经有清空天数下拉菜单，因此这里就不用重复工作了 
				this.selYear.options.length = 0; 
				this.selMonth.options.length = 0; 
				// 初始化年、月 
				this.InitYearSelect(); 
				this.InitMonthSelect(); 
				// 设置年、月初始值 
				this.selYear.selectedIndex = this.MaxYear - year; 
				this.selMonth.selectedIndex = month - 1; 
				// 初始化天数 
				this.InitDaySelect(); 
				// 设置天数初始值 
				this.selDay.selectedIndex = day - 1; 
				}
		</script> 
		
	</head>

	<body>
		<!--头 -->
		<%@include file="/_head.jsp" %>
		<!-- ↑引入头部文件 -->
		
		

			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">
								<input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
								<img class="am-circle am-img-thumbnail" src="${appPath}/images/getAvatar.do.jpg" alt="" />
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>${sessionScope.User.userName}</i></b></div>
								<div class="vip">
                                      <span></span><a href="#">会员专享</a>
								</div>
							</div>
						</div>

						<!--个人信息 -->
						<div class="info-main">
							<form  id="myForm" class="am-form am-form-horizontal" action="${appPath }/usercenter/info">
							

								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">昵称</label>
									<div class="am-form-content">
										<input type="text"  name="userName" id="user-name2" placeholder="nickname" value="${User.userName}">
                                          <small>昵称长度不能超过40个汉字</small>
									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
										<label class="am-radio-inline">
											<input type="radio" name="userInfo.userGender" value="1"  <c:if test="${User.userInfo.userGender==1 }">checked="checked"</c:if> /> 男
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="userInfo.userGender" value="0"  <c:if test="${User.userInfo.userGender==0 }">checked="checked"</c:if> /> 女
										</label>
									</div>
								</div>

								<div class="am-form-group">
								
									<label for="user-birth" class="am-form-label" >生日</label>
									<input type="hidden" name="userId" value="${sessionScope.User.userId }">
									<input type="hidden" id="year" value="${birthStr[0] }" >
									<input type="hidden" id="month" value="${birthStr[1] }" >
									<input type="hidden" id="day" value="${birthStr[2] }" >
									<div class="am-form-content birth">
										<div class="birth-select">
											<select id="selYear" name="year" value="1990">
											</select>
											<em>年</em>
										</div>
										<div class="birth-select2">
											<select id="selMonth" name="month" value="00">
											</select>
											<em>月</em></div>
										<div class="birth-select2">
											<select id="selDay" name="day" value="00">
											</select>
											<em>日</em></div> 
									</div> 
							
								</div>
								
								<script type="text/javascript"> 
								var year = window.document.getElementById("year").value;
								var month = window.document.getElementById("month").value;
								var day = window.document.getElementById("day").value;
							    var selYear = window.document.getElementById("selYear"); 
								var selMonth = window.document.getElementById("selMonth"); 
								var selDay = window.document.getElementById("selDay"); 
								// 新建一个DateSelector类的实例，将三个select对象传进去 
								new DateSelector(selYear, selMonth, selDay,year,month,day); 
								// 也可以试试下边的代码 
								// var dt = new Date(2004, 1, 29); 
								// new DateSelector(selYear, selMonth ,selDay, dt); 
								function formSubmit(){
								    alert("修改成功");
								    document.getElementById("myForm").submit();
								    
								}
								</script> 
								
								<div style="margin-top: 200px"></div>

								<div class="info-btn">
									<div class="" >
										<input  type="submit" value="保存修改" onclick="formSubmit()" class="am-btn am-btn-primary am-round" /></div>
								</div>

							</form>
							
						</div>

					</div>

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

</html>