<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>首页</title>

    <link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

    <link href="${appPath}/basic/css/demo.css" rel="stylesheet" type="text/css" />

    <link href="${appPath}/css/hmstyle.css" rel="stylesheet" type="text/css" />
    <script src="${appPath}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	<link rel="shortcut icon" href="${appPath }/favicon.ico"/>
	<link rel="bookmark" href="${appPath }/favicon.ico"/>
    <%-- 鼠标移动事件，触发移动事件提交请求并返回二级 --%>
    <%--<script type="text/javascript">--%>
        <%--function selectChildItem(id) {--%>
            <%--var parentId = id;--%>
            <%--//AJAX请求--%>
            <%--$("#ChildItem").load(--%>
                <%--"${appPath}/selectShopItemIndex",--%>
                <%--{"parentId" : parentId}--%>
            <%--);--%>
        <%--}--%>
    <%--</script>--%>

<!-- 动态icon -->
<!-- <link rel="icon" href="/favicon.gif" type="image/gif" /> -->
</head>

<body>
<%@include file="../../../shop/_head2.jsp"%>
			
        <b class="line"></b>
        <div class="shopNav">
            <div class="slideall" style="height: auto;">

                <div class="long-title"><span class="all-goods">全部分类</span></div>
                <div class="nav-cont">
                    <ul>
                        <li class="index" ><a href="${appPath}/home">首页</a></li>
                        <li class="qc"><a href="${appPath}/sort">商品分类</a></li>
                        <li class="qc"><a href="#">限时抢</a></li>
                        <li class="qc"><a href="#">团购</a></li>
                        <li class="qc last"><a href="#">大包装</a></li>
                    </ul>
                    <div class="nav-extra">
                        <i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
                        <i class="am-icon-angle-right" style="padding-left: 10px;"></i>
                    </div>
                </div>
        <div class="bannerTwo">
            <!--轮播 -->
            <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
                <ul class="am-slides">
                    <li class="banner1"><a><img src="${appPath }/images/ad5.jpg" /></a></li>
                    <li class="banner2"><a><img src="${appPath}/images/ad6.jpg" /></a></li>
                    <li class="banner3"><a><img src="${appPath}/images/ad7.jpg" /></a></li>
                    <li class="banner4"><a><img src="${appPath}/images/ad8.jpg" /></a></li>
                </ul>
            </div>
            <div class="clear"></div>
        </div>

        <!--侧边导航 -->
                <div id="nav" class="navfull" style="position: static;">
                    <div class="area clearfix">
                        <div class="category-content" id="guide_2">

                            <div class="category" style="box-shadow:none ;margin-top: 2px;">
                                <ul class="category-list navTwo" id="js_climit_li">

                                    <%-- 最外层大标签 --%>
                                    <c:forEach items="${ParentInfo}" var="p">
                                        <li>
                                        <%--<li onmouseover="selectChildItem(${p.id})">--%>
                                            <div class="category-info">
                                                <h3 class="category-name b-category-name"><i><img src="${appPath}/images/cake.png"></i><a href="${appPath}/sort/selectSingle?id=${p.id}" class="ml-22" title="${p.name}">${p.name}</a></h3>
                                                <em>&gt;</em></div>
                                            <%--<div class="menu-item menu-in top">--%>
                                                <%--<div class="area-in">--%>
                                                    <%--<div class="area-bg">--%>
                                                        <%--<div class="menu-srot">--%>
                                                            <%--<div class="sort-side">--%>
                                                                <%--<dl class="dl-sort" id="ChildItem">--%>
                                                                <%--</dl>--%>
                                                            <%--</div>--%>
                                                        <%--</div>--%>
                                                    <%--</div>--%>
                                                <%--</div>--%>
                                                <%--<b class="arrow"></b>--%>
                                                <%--<div class="clear"></div>--%>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

        <!--导航 -->
        <script type="text/javascript">
            (function() {
                $('.am-slider').flexslider();
            });
            $(document).ready(function() {
                $("li").hover(function() {
                    $(".category-content .category-list li.first .menu-in").css("display", "none");
                    $(".category-content .category-list li.first").removeClass("hover");
                    $(this).addClass("hover");
                    $(this).children("div.menu-in").css("display", "block")
                }, function() {
                    $(this).removeClass("hover")
                    $(this).children("div.menu-in").css("display", "none")
                });
            })
        </script>


        <!--小导航 -->
        <div class="am-g am-g-fixed smallnav">
            <div class="am-u-sm-3">
                <a href="sort.html"><img src="${appPath}/images/navsmall.jpg" />
                    <div class="title">商品分类</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="${appPath}/images/huismall.jpg" />
                    <div class="title">大聚惠</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="${appPath }/userCenter/index.jsp"><img src="${appPath}/images/mansmall.jpg" />
                    <div class="title">个人中心</div>
                </a>
            </div>
            <div class="am-u-sm-3">
                <a href="#"><img src="${appPath}/images/moneysmall.jpg" />
                    <div class="title">投资理财</div>
                </a>
            </div>
        </div>


        <!--各类活动-->
        <div class="row">
            <li><a><img src="${appPath}/images/row1.jpg"/></a></li>
            <li><a><img src="${appPath}/images/row2.jpg"/></a></li>
            <li><a><img src="${appPath}/images/row3.jpg"/></a></li>
            <li><a><img src="${appPath}/images/row4.jpg"/></a></li>
        </div>
        <div class="clear"></div>
        <!--走马灯 -->

        <div class="marqueenTwo">
            <span class="marqueen-title"><i class="am-icon-volume-up am-icon-fw"></i>商城头条<em class="am-icon-angle-double-right"></em></span>
            <div class="demo">

                <ul>
                    <c:forEach items="${mallNotices}" var="m">
                    <li><a target="_blank" href="${appPath}/shop/blog?noticeId=${m.noticeId}"><span>${m.noticeTitle}</span></a></li>
                    </c:forEach>
                </ul>

            </div>
        </div>
        <div class="clear"></div>

    </div>



    <script type="text/javascript">
        if ($(window).width() < 640) {
            function autoScroll(obj) {
                $(obj).find("ul").animate({
                    marginTop: "-39px"
                }, 500, function() {
                    $(this).css({
                        marginTop: "0px"
                    }).find("li:first").appendTo(this);
                })
            }
            $(function() {
                setInterval('autoScroll(".demo")', 3000);
            })
        }
    </script>
</div>
<div class="shopMainbg">
    <c:forEach items="${ParentInfo}" begin="0" end="5" var="x">
    <div class="shopMain" id="shopmain">
        <!--手机-->
        <div class="am-container " >
            <div class="shopTitle ">
                <h4 class="floor-title">${x.name}</h4>
                <div class=""><h3>追上科技潮流</h3></div>
                <div class="today-brands " style="right:0px ;top:13px;">
                    <a href="# ">VR</a>|
                    <a href="# ">3D投影</a>|
                    <a href="# ">栗子糕 </a>|
                    <a href="# ">马卡龙</a>|
                    <a href="# ">铜锣烧</a>|
                    <a href="# ">豌豆黄</a>
                </div>

            </div>
        </div>

        <div class="am-g am-g-fixed floodSix ">

            <div class="am-u-sm-5 am-u-md-3 text-one list">
                <div class="word">
                    <c:forEach items="${ParentInfoChild}" var="v">
                    <a class="outer" href="#"><span class="inner"><b class="text">${v.name}</b></span></a>
                    </c:forEach>
                </div>
                <a href="# ">
                    <img src="${appPath}/images/5.jpg" />
                    <div class="outer-con ">
                        <div class="title ">
                            零食大礼包开抢啦
                        </div>
                        <div class="sub-title ">
                            当小鱼儿恋上软豆腐
                        </div>
                    </div>
                </a>
                <div class="triangle-topright"></div>
            </div>

            <div class="am-u-sm-7 am-u-md-5 am-u-lg-2 text-two big">

                <div class="outer-con ">
                    <div class="title ">
                        雪之恋和风大福
                    </div>
                    <div class="sub-title ">
                        ¥13.8
                    </div>

                </div>
                <a href="# "><img src="${appPath}/images/act1.png" /></a>
            </div>

            <li>
                <div class="am-u-md-2 am-u-lg-2 text-three">
                    <div class="boxLi"></div>
                    <div class="outer-con ">
                        <div class="title ">
                            小优布丁
                        </div>
                        <div class="sub-title ">
                            ¥4.8
                        </div>

                    </div>
                    <a href="# "><img src="${appPath}/images/1.jpg " /></a>
                </div>
            </li>
            <li>
                <div class="am-u-md-2 am-u-lg-2 text-three sug">
                    <div class="boxLi"></div>
                    <div class="outer-con ">
                        <div class="title ">
                            小优布丁
                        </div>
                        <div class="sub-title ">
                            ¥4.8
                        </div>

                    </div>
                    <a href="# "><img src="${appPath}/images/2.jpg " /></a>
                </div>
            </li>
            <li>
                <div class="am-u-sm-4 am-u-md-5 am-u-lg-4 text-five">
                    <div class="boxLi"></div>
                    <div class="outer-con ">
                        <div class="title ">
                            小优布丁
                        </div>
                        <div class="sub-title ">
                            ¥4.8
                        </div>

                    </div>
                    <a href="# "><img src="${appPath}/images/5.jpg" /></a>
                </div>
            </li>
            <li>
                <div class="am-u-sm-4 am-u-md-2 am-u-lg-2 text-six">
                    <div class="boxLi"></div>
                    <div class="outer-con ">
                        <div class="title ">
                            小优布丁
                        </div>
                        <div class="sub-title ">
                            ¥4.8
                        </div>

                    </div>
                    <a href="# "><img src="${appPath}/images/3.jpg" /></a>
                </div>
            </li>
            <li>
                <div class="am-u-sm-4 am-u-md-2 am-u-lg-4 text-six">
                    <div class="boxLi"></div>
                    <div class="outer-con ">
                        <div class="title ">
                            小优布丁
                        </div>
                        <div class="sub-title ">
                            ¥4.8
                        </div>

                    </div>
                    <a href="# "><img src="${appPath}/images/4.jpg" /></a>
                </div>
            </li>
        </div>
        <div class="clear "></div>
    </div>
    <div class="f8">
    </c:forEach>
        <div class="clear "></div>
    </div>
    <%@ include file="/_foot.jsp" %>
    
<!--引导 -->
<%@include file="/_navigation.jsp" %>

<!-- 右侧导航栏 -->
<%@include file="/_rightbtn.jsp" %>
<!-- ↑引入右侧菜单栏 -->
</body>
</html>