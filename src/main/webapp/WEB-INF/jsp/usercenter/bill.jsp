<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人账单</title>

		<link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${appPath}/css/blstyle.css" rel="stylesheet" type="text/css">
		<script src="${appPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
	</head>

	<body>
		<!--头 -->
		<%@include file="/_head.jsp" %>
		<!-- ↑引入头部文件 -->
		
		<b class="line"></b>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-bill">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账单</strong> / <small>Electronic&nbsp;bill</small></div>
						</div>
						<hr/>

						<div class="ebill-section">
							<div class="ebill-title-section">
								<h2 class="trade-title section-title">
                                                                                                                                     交易
                            <span class="desc">（金额单位：元）</span>
                        </h2>

								<div class=" ng-scope">
									<div class="trade-circle-select  slidedown-">
										<a href="javascript:void(0);" class="current-circle ng-binding">2017/11/01 - 2017/12/01</a>

									</div>
									<span class="title-tag"><i class="num ng-binding">12</i>月</span>
								</div>
							</div>

							<div class="module-income ng-scope">
								<div class="income-slider ">
									<div class="block-income block  fn-left">
										<h3 class="income-title block-title">
                                                                                                          支出
                                      <span class="num ng-binding">
                                              ￥0
                                       </span>
                                    <span class="desc ng-binding">
                                          <%--  <a href="${appPath}/usercenter/billlist">查看支出明细</a> --%>
                                         </span>
                                             </h3>

										<div ng-class="shoppingChart" class="catatory-details  fn-hide shopping">
											<div class="catatory-chart fn-left fn-hide">
												<div class="title">类型</div>
												<ul>

												</ul>
											</div>
											<div class="catatory-detail fn-left">
												<div class="title ng-binding">
													购买商品
												</div>
												<ul>



												</ul>
											</div>
										</div>
									</div>
									<div class="block-expense block  fn-left">
										<div class="slide-button right"></div>
									</div>
									<div class="clear"></div>

									<!--收入-->
									<h3 class="expense income-title block-title">
                                                                                                                       支出                                                              
                                      <span class="num ng-binding">
                                              0.00
                                       </span>
                                    <span class="desc ng-binding">
                                           <a href="${appPath}/usercenter/billlist">查看支出明细</a>
                                    </span>
                                </h3>
								</div>

								<!--消费走势-->
								<div class="module-consumeTrend inner-module">
									<h3 class="module-title">消费走势</h3>
									<div id="consumeTrend-chart" class="consumeTrend-chart">

									</div>
								</div>

								<!--银行卡使用情况-->

								<div class="module-card inner-module">
									<h3 class="module-title">银行卡使用情况</h3>
									<div class="card-chart valid am-slider am-slider-default" data-am-widget="slider" data-am-slider='{"animation":"slide","slideshow":false}'>
										<ul class="am-slides">
											<li>
												<div  class="cards-carousel">
													<div class="mask">

														<div class="bac fn-left"></div>
														<div class="bank ng-binding" style="background-image: url(${appPath}/images/combo.png);">中国农业银行</div>
														<div class="details">
															<a>查看详情</a>
														</div>
													</div>
												</div>
												<div class="cards-details">
													<div class="bank-name">
														<div class="name fn-left" style="background-image: url(${appPath}/images/combo.png);"></div>
														<span class="close fn-right"><a>X</a></span>
													</div>
													<div class="bank-detail">
														<div class="totalin fn-left">
															<span class="fn-left">流入</span>
															<span class="amount fn-right">0.00</span>
														</div>
														<div class="totalout fn-left">
															<span class="fn-left">流出</span>
															<span class="amount fn-right">0.00</span>
														</div>
														<div class="expand fn-left">
															<span class="fn-left">支出</span>
															<span class="amount fn-right">0.00</span>
														</div>
														<div class="withdraw fn-left">
															<span class="fn-left">提现</span>
															<span class="amount fn-right">
							                                0.00
                            						</span>
														</div>
														<div class="recharge fn-left">
															<span class="fn-left">充值</span>
															<span class="amount fn-right">
                                                            0.00
                            						</span>
														</div>

														<div class="refund fn-left">
															<span class="fn-left">银行卡退款</span>
															<span class="amount fn-right ">0.00</span>
														</div>
													</div>
												</div>
											</li>
											<li>
												<div  class="cards-carousel">
													<div class="mask">

														<div class="bac fn-left"></div>
														<div class="bank ng-binding" style="background-image: url(${appPath}/images/combo1.png);">中国建设银行</div>
														<div class="details">
															<a>查看详情</a>
														</div>
													</div>
												</div>
												<div class="cards-details">
													<div class="bank-name">
														<div class="name fn-left" style="background-image: url(${appPath}/images/combo1.png);"></div>
														<span class="close fn-right"><a>X</a></span>
													</div>
													<div class="bank-detail">
														<div class="totalin fn-left">
															<span class="fn-left">流入</span>
															<span class="amount fn-right">0.00</span>
														</div>
														<div class="totalout fn-left">
															<span class="fn-left">流出</span>
															<span class="amount fn-right">0.00</span>
														</div>
														<div class="expand fn-left">
															<span class="fn-left">支出</span>
															<span class="amount fn-right">0.00</span>
														</div>
														<div class="withdraw fn-left">
															<span class="fn-left">提现</span>
															<span class="amount fn-right">
							                                0.00
                            						</span>
														</div>
														<div class="recharge fn-left">
															<span class="fn-left">充值</span>
															<span class="amount fn-right">
                                                            0.00
                            						</span>
														</div>

														<div class="refund fn-left">
															<span class="fn-left">银行卡退款</span>
															<span class="amount fn-right ">0.00</span>
														</div>
													</div>
												</div>
											</li>
											<li>
												<div  class="cards-carousel">
													<div class="mask">

														<div class="bac fn-left"></div>
														<div class="bank ng-binding" style="background-image: url(${appPath}/images/combo2.png);">浦发银行</div>
														<div class="details">
															<a>查看详情</a>
														</div>
													</div>
												</div>
												<div class="cards-details">
													<div class="bank-name">
														<div class="name fn-left" style="background-image: url(${appPath}/images/combo2.png);"></div>
														<span class="close fn-right"><a>X</a></span>
													</div>
													<div class="bank-detail">
														<div class="totalin fn-left">
															<span class="fn-left">流入</span>
															<span class="amount fn-right">0.00</span>
														</div>
														<div class="totalout fn-left">
															<span class="fn-left">流出</span>
															<span class="amount fn-right">0.00</span>
														</div>
														<div class="expand fn-left">
															<span class="fn-left">支出</span>
															<span class="amount fn-right">0.00</span>
														</div>
														<div class="withdraw fn-left">
															<span class="fn-left">提现</span>
															<span class="amount fn-right">
							                                0.00
                            						</span>
														</div>
														<div class="recharge fn-left">
															<span class="fn-left">充值</span>
															<span class="amount fn-right">
                                                            0.00
                            						</span>
														</div>

														<div class="refund fn-left">
															<span class="fn-left">银行卡退款</span>
															<span class="amount fn-right ">0.00</span>
														</div>
													</div>
												</div>
											</li>
											<li>
												<div  class="cards-carousel">
													<div class="mask">

														<div class="bac fn-left"></div>
														<div class="bank ng-binding" style="background-image: url(${appPath}/images/combo3.png);">中国光大银行</div>
														<div class="details">
															<a>查看详情</a>
														</div>
													</div>
												</div>
												<div class="cards-details">
													<div class="bank-name">
														<div class="name fn-left" style="background-image: url(${appPath}/images/combo3.png);"></div>
														<span class="close fn-right"><a>X</a></span>
													</div>
													<div class="bank-detail">
														<div class="totalin fn-left">
															<span class="fn-left">流入</span>
															<span class="amount fn-right">0.00</span>
														</div>
														<div class="totalout fn-left">
															<span class="fn-left">流出</span>
															<span class="amount fn-right">0.00</span>
														</div>
														<div class="expand fn-left">
															<span class="fn-left">支出</span>
															<span class="amount fn-right">0.00</span>
														</div>
														<div class="withdraw fn-left">
															<span class="fn-left">提现</span>
															<span class="amount fn-right">
							                                0.00
                            						</span>
														</div>
														<div class="recharge fn-left">
															<span class="fn-left">充值</span>
															<span class="amount fn-right">
                                                            0.00
                            						</span>
														</div>

														<div class="refund fn-left">
															<span class="fn-left">银行卡退款</span>
															<span class="amount fn-right ">0.00</span>
														</div>
													</div>
												</div>
											</li>											
										</ul>
									</div>
								</div>

								<script>
									$(document).ready(function (ev) {
								
									    $('.cards-carousel .details').on('click', function (ev) {
								             $('.cards-details').css("display","block");
								             $('.cards-carousel').css("display","none");								 
									    });									   									    
								
									    $('.cards-details .close,.am-next,.am-prev,.am-control-nav li a').on('click', function (ev) {
								             $('.cards-details').css("display","none");
								             $('.cards-carousel').css("display","block");								 
									    });									    
									    									   								    
									});
								</script>

							</div>

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