<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>商品页面</title>

    <link href="${appPath}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>
    <link href="${appPath}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="${appPath}/basic/css/demo.css" rel="stylesheet" type="text/css"/>
    <link type="text/css" href="${appPath}/css/optstyle.css" rel="stylesheet"/>
    <link type="text/css" href="${appPath}/css/style.css" rel="stylesheet"/>

    <script type="text/javascript" src="${appPath}/basic/js/jquery-1.7.min.js"></script>
    <script type="text/javascript" src="${appPath}/basic/js/quick_links.js"></script>

    <script type="text/javascript" src="${appPath}/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="${appPath}/js/jquery.imagezoom.min.js"></script>
    <script type="text/javascript" src="${appPath}/js/jquery.flexslider.js"></script>
    <script type="text/javascript" src="${appPath}/js/list.js"></script>
    <script type="text/javascript">
        $(function () {
            //输入框移开检查数据合法性
            $("#text_box").blur(function () {
                var prodsNum = $("#prodsNum").val();
                var buynum= parseInt($(this).val());
                    if (/^[1-9][0-9]*$/.test(buynum)) {
                        if (buynum>prodsNum){
                            alert("你购买数量超出当前商品数量，请修改后重试");
                            $(this).val(1);
                            return;
                        }
                    } else {
                        alert("请输入一个正整数");
                        $(this).val(1);
                        return;
                    }
            });
            //提交加入购物车请求到后台
            $(".addCart").click(function () {
                //获取购买的数量
                var buynum= parseInt($("#text_box").val());
                location.href = "${appPath}/shopcart/add?prodId=${Product_Info.id}&buyNum="+buynum;
            });
            //检查+号是否超出数量以及按钮效果
            $("#btn-add").click(function () {
                var prodsNum = $("#prodsNum").val();
                var buynum= parseInt($("#text_box").val());
                if (buynum>=prodsNum){
                    alert("你购买数量超出当前商品数量，请修改后重试");
                    $("#text_box").val(1);
                    return;
                }
                var newbuynum = buynum+1;
                $("#text_box").val(newbuynum)
            });
            //检查-号禁止提交负数
            $("#btn-reduce").click(function () {
                var prodsNum = $("#prodsNum").val();
                var buynum= parseInt($("#text_box").val());
                if (buynum<=1){
                    alert("请输入正确的购买数量");
                    $("#text_box").val(1);
                    return;
                }
                var newbuynum = buynum-1;
                $("#text_box").val(newbuynum)
            });
        })
    </script>

    <script type="text/javascript">
        function orderpay(){
            //商品id
            var prodId = $("#prodId").val().trim();
            //商品名称
            var prodName = $("#prodName").text();
            //商品图片
            var prodUrl = $("#prodImgUrl").val();
            //商品数量
            var prodNum = $("#text_box").val().trim();
            //商品单价
            var promotionPrice = $("#promotionPrice").text();

            $.ajax({
                type:"post",
                dataType:"text",
                url:"${appPath}/shop/orderCart.do",
                data:{"prodId":prodId,"prodName":prodName,"prodUrl":prodUrl,"prodNum":prodNum,"promotionPrice":promotionPrice},
                success:function (data){
                    if(data == "1"){
                        location.href = "${appPath}/shop/pay";
                    }
                }
            });
        }
    </script>

</head>

<body>
<%@include file="../../../shop/_head2.jsp" %>

<b class="line"></b>
<div class="listMain">

    <!--分类-->
    <div class="nav-table">
        <div class="long-title"><span class="all-goods">全部分类</span></div>
        <div class="nav-cont">
            <ul>
                <li class="index"><a href="${appPath}/home">首页</a></li>
                <li class="qc"><a href="#">闪购</a></li>
                <li class="qc"><a href="#">限时抢</a></li>
                <li class="qc"><a href="#">团购</a></li>
                <li class="qc last"><a href="#">大包装</a></li>
            </ul>
            <div class="nav-extra">
                <i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
                <i class="am-icon-angle-right" style="padding-left: 10px;"></i>
            </div>
        </div>
    </div>
    <ol class="am-breadcrumb am-breadcrumb-slash" style="margin:30px auto">
        <li><a href="${appPath}/home">首页</a></li>
        <c:if test="${Product_Item.parentItemCat!=null}">
            <li>
                <a href="${appPath}/sort/selectSingle?id=${Product_Item.parentItemCat.id}">${Product_Item.parentItemCat.name}</a>
            </li>
        </c:if>
        <li>${Product_Item.name}</li>
    </ol>
    <script type="text/javascript">
        $(function () {
        });
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                start: function (slider) {
                    $('body').removeClass('loading');
                }
            });
        });
    </script>
    <div class="scoll">
        <section class="slider">
            <div class="flexslider">
                <%-- 手机显示前3张图，测试无问题 --%>
                <ul class="slides">
                    <li>
                        <img src="${splitSrcImgUrl[0]}" title="pic"/>
                    </li>
                    <li>
                        <img src="${splitSrcImgUrl[1]}"/>
                    </li>
                    <li>
                        <img src="${splitSrcImgUrl[2]}"/>
                    </li>
                </ul>
            </div>
        </section>
    </div>

    <!--放大镜-->

    <div class="item-inform">
        <div class="clearfixLeft" id="clearcontent">

            <div class="box">
                <script type="text/javascript">
                    $(document).ready(function () {
                        $(".jqzoom").imagezoom();
                        $("#thumblist li a").click(function () {
                            $(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
                            $(".jqzoom").attr('src', $(this).find("img").attr("mid"));
                            $(".jqzoom").attr('rel', $(this).find("img").attr("big"));
                        });
                    });
                </script>

                <div class="tb-booth tb-pic tb-s310">
                    <a href="${splitSrcImgUrl[0]}"><img src="${splitSrcImgUrl[0]}" alt="细节展示放大镜特效"
                                                        rel="${splitSrcImgUrl[0]}" class="jqzoom"/></a>
                    <input type="hidden" id="prodImgUrl" value="${splitSrcImgUrl[0]}" />
                </div>
                <ul class="tb-thumb" id="thumblist">
                    <li class="tb-selected">
                        <div class="tb-pic tb-s40">
                            <a href="#"><img src="${splitSrcImgUrl[0]}" mid="${splitSrcImgUrl[0]}"
                                             big="${splitSrcImgUrl[0]}"></a>
                        </div>
                    </li>
                    <li>
                        <div class="tb-pic tb-s40">
                            <a href="#"><img src="${splitSrcImgUrl[1]}" mid="${splitSrcImgUrl[1]}"
                                             big="${splitSrcImgUrl[1]}"></a>
                        </div>
                    </li>
                    <li>
                        <div class="tb-pic tb-s40">
                            <a href="#"><img src="${splitSrcImgUrl[2]}" mid="${splitSrcImgUrl[2]}"
                                             big="${splitSrcImgUrl[2]}"></a>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="clear"></div>
        </div>

        <div class="clearfixRight">

            <!--规格属性-->
            <!--名称-->
            <div class="tb-detail-hd">
                <input type="hidden" value="${Product_Info.id}" id="prodId" >
                <h1 id="prodName" >
                    ${Product_Info.name}
                </h1>
            </div>
            <div class="tb-detail-list">
                <!--价格-->
                <div class="tb-detail-price">
                    <li class="price iteminfo_price">
                        <dt>促销价</dt>
                        <dd><em>¥</em><b class="sys_item_price" id="promotionPrice" > ${Product_Info.promotionPrice}</b></dd>
                    </li>
                    <li class="price iteminfo_mktprice">
                        <dt>原价</dt>
                        <dd><em>¥</em><b class="sys_item_mktprice">${Product_Info.salePrice}</b></dd>
                    </li>
                    <div class="clear"></div>
                </div>


                <!--销量-->
                <ul class="tm-ind-panel">
                    <li class="tm-ind-item tm-ind-sellCount canClick">
                        <div class="tm-indcon"><span class="tm-label">月销量</span><span
                                class="tm-count">${Product_Info.saleNum}</span></div>
                    </li>
                    <li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
                        <div class="tm-indcon"><span class="tm-label">累计评价</span><span
                                class="tm-count">${countComment}</span></div>
                    </li>
                </ul>
                <div class="clear"></div>

                <!--各种规格-->
                <dl class="iteminfo_parameter sys_item_specpara">
                    <dt class="theme-login">
                        <div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div>
                    </dt>
                    <dd>
                        <!--操作页面-->

                        <div class="theme-popover-mask"></div>

                        <div class="theme-popover" style="margin-top: 30px;">
                            <div class="theme-span"></div>
                            <div class="theme-poptit">
                                <a href="javascript:;" title="关闭" class="close">×</a>
                            </div>
                            <div class="theme-popbod dform">
                                <form class="theme-signin" name="loginform" action="" method="post">
                                    <div class="theme-signin-left">
                                        <%--<c:forEach items="${Product_Attr}" var="x" varStatus="i">--%>
                                        <%--<div class="theme-options">--%>
                                                <%--&lt;%&ndash; 显示一级分类 &ndash;%&gt;--%>
                                            <%--<c:if test="${x.typeId==0}">--%>
                                                <%--<c:if test="${i.index==0}">--%>
                                                    <%--<div class="cart-title" style="padding-top:40px">${x.typeName}</div>--%>
                                                <%--</c:if>--%>
                                                <%--<c:if test="${i.index!=0}">--%>
                                                    <%--<div class="cart-title">${x.typeName}</div>--%>
                                                <%--</c:if>--%>
                                            <%--</c:if>--%>

                                                <%-- 显示二级分类，未完成 --%>
                                            <%--<c:if test="${x.typeId!=0 && x.typeId==x.parentAttribute.id}">--%>
                                                <%--<c:forEach items="${ParentAttributeMap}" var="shopchildAttr">--%>
                                                <%--<ul>--%>

                                                <%--<c:if test="${shopchildAttr.key==x.id}">--%>
                                                <%--<li class="sku-line">${shopchildAttr.value}<i></i></li>--%>
                                                <%--</c:if>--%>

                                                <%--</ul>--%>
                                                <%--</c:forEach>--%>
                                                <%--<ul>--%>
                                                    <%--<li class="sku-line">${x.typeName}<i></i></li>--%>
                                                <%--</ul>--%>
                                            <%--</c:if>--%>
                                        <%--</div>--%>
                                        <%--</c:forEach>--%>
                                        <div class="theme-options">
                                            <div class="cart-title number">数量</div>
                    <dd>
                        <input id="btn-reduce" name="" type="button" value="-"/>
                        <input id="text_box" id="text_box" name="" type="text" value="1" style="width:30px;"/>
                        <input id="btn-add" name="" type="button" value="+"/>
                        <span id="Stock" class="tb-hidden">库存<span class="stock">${Product_Info.prodsNum}</span>件</span>
                    </dd>

            </div>
            <div class="clear"></div>

            <div class="btn-op">
                <div class="btn am-btn am-btn-warning">确认</div>
                <div class="btn close am-btn am-btn-warning">取消</div>
            </div>
        </div>
        <div class="theme-signin-right">
            <div class="img-info">
                <img src="${appPath}/images/songzi.jpg"/>
            </div>
            <div class="text-info">
                <span class="J_Price price-now">${Product_Info.promotionPrice}</span>
                <input type="hidden" id="prodsNum" value="${Product_Info.prodsNum}">
                <span id="Stock" class="tb-hidden">库存<span class="stock">${Product_Info.prodsNum}</span>件</span>
            </div>
        </div>

        </form>
    </div>
</div>

</dd>
</dl>
<div class="clear"></div>
<!--活动	-->
<div class="shopPromotion gold">
    <div class="hot">
        <dt class="tb-metatit">商品简介</dt>
        <div class="gold-list">
            <p>${Product_Info.title}<span>权益保障<i class="am-icon-sort-down"></i></span></p>
        </div>
    </div>
    <div class="clear"></div>
    <div class="coupon">
        <dt class="tb-metatit">权益保障</dt>
        <div class="gold-list">
            <ul>
                <li>正品保障</li>
                <li>七天退换</li>
                <li>极速退款</li>
            </ul>
        </div>
    </div>
</div>
</div>

<div class="pay">
    <div class="pay-opt">
        <a href="home.html"><span class="am-icon-home am-icon-fw">首页</span></a>
        <a><span class="am-icon-heart am-icon-fw">收藏</span></a>

    </div>
    <li>
        <div class="clearfix tb-btn tb-btn-buy theme-login">
            <a id="LikBuy" onclick="orderpay()" title="点此按钮到下一步确认购买信息" href="javascript:void(0);" >立即购买</a>
        </div>
    </li>
    <li>
        <div class="clearfix tb-btn tb-btn-basket theme-login">
            <a id="addCart" class="addCart" title="加入购物车" href="javascript:void(0)">加入购物车</a>
        </div>
    </li>
</div>

</div>

<div class="clear"></div>

</div>

<!-- introduce-->

<div class="introduce">
    <div class="browse">
        <div class="mc">
            <ul>
                <div class="mt">
                    <h2>看了又看</h2>
                </div>
                <%--  根据商品二级类别查找出来类似的商品，是根据商品最后的更新时间进行排序的 --%>
                <c:forEach items="${productminItem.list}" var="minPro">
                    <li>
                        <div class="p-img">
                            <a href="${appPath}/introduction/intro?id=${minPro.id}&pageNum=1&minproPageNum=1">
                                    <%-- 截取imgurl的第一张图片作为展示图片 --%>
                                    ${minPro.imgUrl.substring(0,minPro.imgUrl.indexOf(","))}
                            </a>
                        </div>
                        <div class="p-name"><a href="${appPath}/introduction/intro?id=${minPro.id}&pageNum=1&minproPageNum=1">
                                ${minPro.name}
                        </a>
                        </div>
                        <div class="p-price"><strong>￥${minPro.promotionPrice}</strong></div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="introduceMain">
        <div class="am-tabs" data-am-tabs>
            <ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
                <li class="am-active">
                    <a href="#">

                        <span class="index-needs-dt-txt">宝贝详情</span></a>

                </li>

                <li>
                    <%-- 提交请求 --%>
                    <a href="#">

                        <span class="index-needs-dt-txt">全部评价</span></a>

                </li>

                <li>
                    <a href="#">

                        <span class="index-needs-dt-txt">猜你喜欢</span></a>
                </li>
            </ul>

            <div class="am-tabs-bd">

                <div class="am-tab-panel am-fade am-in am-active">
                    <div class="J_Brand">

                        <div class="attr-list-hd tm-clear">
                            <h4>产品参数：</h4></div>
                        <div class="clear"></div>
                        <%--  --%>
                        <ul id="J_AttrUL">
                            ${Product_Info.remark}
                        </ul>
                        <div class="clear"></div>
                    </div>

                    <div class="details">
                        <div class="attr-list-hd after-market-hd">
                            <h4>商品细节</h4>
                        </div>

                        <div class="twlistNews">
                            ${Prdouct_main_img}
                            <source>
                        </div>
                    </div>
                    <div class="clear"></div>

                </div>

                <div class="am-tab-panel am-fade">

                    <div class="actor-new">
                        <div class="rate">

                            <strong>100<span>%</span></strong><br> <span>好评度</span>
                        </div>
                        <dl>
                            <dt>买家印象</dt>
                            <dd class="p-bfc">
                                <q class="comm-tags"><span>味道不错</span><em>(2177)</em></q>
                                <q class="comm-tags"><span>颗粒饱满</span><em>(1860)</em></q>
                                <q class="comm-tags"><span>口感好</span><em>(1823)</em></q>
                                <q class="comm-tags"><span>商品不错</span><em>(1689)</em></q>
                                <q class="comm-tags"><span>香脆可口</span><em>(1488)</em></q>
                                <q class="comm-tags"><span>个个开口</span><em>(1392)</em></q>
                                <q class="comm-tags"><span>价格便宜</span><em>(1119)</em></q>
                                <q class="comm-tags"><span>特价买的</span><em>(865)</em></q>
                                <q class="comm-tags"><span>皮很薄</span><em>(831)</em></q>
                            </dd>
                        </dl>
                    </div>
                    <div class="clear"></div>
                    <div class="tb-r-filter-bar">
                        <ul class=" tb-taglist am-avg-sm-4">
                            <li class="tb-taglist-li tb-taglist-li-current">
                                <div class="comment-info">
                                    <span>全部评价</span>
                                    <span class="tb-tbcr-num">${countComment}</span>
                                </div>
                            </li>

                            <li class="tb-taglist-li tb-taglist-li-1">
                                <div class="comment-info">
                                    <span>好评</span>
                                    <span class="tb-tbcr-num">(32)</span>
                                </div>
                            </li>

                            <li class="tb-taglist-li tb-taglist-li-0">
                                <div class="comment-info">
                                    <span>中评</span>
                                    <span class="tb-tbcr-num">(32)</span>
                                </div>
                            </li>

                            <li class="tb-taglist-li tb-taglist-li--1">
                                <div class="comment-info">
                                    <span>差评</span>
                                    <span class="tb-tbcr-num">(32)</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="clear"></div>

                    <ul class="am-comments-list am-comments-list-flip" id="comment">
                        <c:forEach items="${comments.list}" var="com">
                            <li class="am-comment">
                                <!-- 评论容器 -->
                                <a href="">
                                    <!-- 评论者头像 -->
                                    <img class="am-comment-avatar" src="${appPath}/images/hwbn40x40.jpg"/>

                                </a>

                                <div class="am-comment-main">
                                    <!-- 评论内容容器 -->
                                    <header class="am-comment-hd">
                                        <!--<h3 class="am-comment-title">评论标题</h3>-->
                                        <div class="am-comment-meta">
                                            <!-- 评论元数据，显示用户名 -->
                                            <a href="#link-to-user" class="am-comment-author">b***1 (匿名)</a>
                                            <!-- 评论者 -->
                                            评论于
                                                <%-- 评论时间 --%>
                                            <time datetime=""><fmt:formatDate value="${com.contentTime}"
                                                                              pattern="yyyy-MM-dd HH:mm:ss"/></time>
                                        </div>
                                    </header>

                                    <div class="am-comment-bd">
                                        <div class="tb-rev-item " data-id="255776406962">
                                                <%-- 评论的内容 --%>
                                            <div class="J_TbcRate_ReviewContent tb-tbcr-content ">
                                                    ${com.content}
                                            </div>
                                                <%-- 评论的类别 --%>
                                            <div class="tb-r-act-bar">
                                                颜色分类：柠檬黄&nbsp;&nbsp;尺码：S
                                            </div>
                                        </div>

                                    </div>
                                    <!-- 评论内容 -->
                                </div>
                            </li>
                        </c:forEach>
                    </ul>

                    <div class="clear"></div>

                    <!--分页 -->
                    <ul class="am-pagination am-pagination-right">
                        <!--上一页 -->
                        <c:if test="${comments.isFirstPage==false}">
                            <li><a href="${appPath}/introduction/intro?id=${Product_Info.id}&pageNum=${comments.prePage}&minproPageNum=${productminItem.pageNum}">&laquo;</a></li>
                        </c:if>
                        <c:forEach items="${comments.navigatepageNums}" var="page">
                            <li>
                                <a href="${appPath}/introduction/intro?id=${Product_Info.id}&pageNum=${page}&minproPageNum=${productminItem.pageNum}">${page}</a>
                            </li>
                        </c:forEach>
                        <!--下一页 -->
                        <c:if test="${comments.isLastPage==false}">
                            <li><a href="${appPath}/introduction/intro?id=${Product_Info.id}&pageNum=${comments.nextPage}&minproPageNum=${productminItem.pageNum}">&raquo;</a></li>
                        </c:if>
                    </ul>
                    <div class="clear"></div>

                    <div class="tb-reviewsft">
                        <div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。
                        </div>
                    </div>

                </div>


                <%-- 猜你喜欢模块，结合大数据 --%>
                <div class="am-tab-panel am-fade">
                    <div class="like">
                        <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
                            <c:forEach items="${productminItem.list}" var="recom">
                                <li>
                                    <div class="i-pic limit">
                                            ${recom.imgUrl.substring(0,recom.imgUrl.indexOf(","))}
                                        <a href="${appPath}/introduction/intro?id=${Product_Info.id}&pageNum=1&minproPageNum=1"><p>${recom.name}</p></a>
                                        <p class="price fl">
                                            <b>¥</b>
                                            <strong>${recom.promotionPrice}</strong>
                                        </p>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="clear"></div>

                    <!--分页 -->
                    <ul class="am-pagination am-pagination-right">
                        <c:if test="${productminItem.isFirstPage==false}">
                            <li class="am-disabled"><a href="${productminItem.prePage}">&laquo;</a></li>
                        </c:if>
                        <c:forEach items="${productminItem.navigatepageNums}" var="page">
                            <li>
                                <a href="${appPath}/introduction/intro?id=${Product_Info.id}&pageNum=${comments.pageNum}&minproPageNum=${page}">${page}</a>
                            </li>
                        </c:forEach>
                        <!--下一页 -->
                        <c:if test="${productminItem.isLastPage==false}">
                            <li><a href="${productminItem.nextPage}">&raquo;</a></li>
                        </c:if>
                    </ul>
                    <div class="clear"></div>

                </div>

            </div>

        </div>

        <div class="clear"></div>

        <!-- 底部 -->
        <%@ include file="/_foot.jsp" %>

    </div>

</div>
</div>
<!--引导 -->
<%@include file="/_navigation.jsp" %>

<!--菜单 -->
<!-- 右侧导航栏 -->
<%@include file="/_rightbtn.jsp" %>
<!-- ↑引入右侧菜单栏 -->

</body>

</html>