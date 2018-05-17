
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <title>购物车页面</title>

    <link href="${appPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="${appPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="${appPath }/css/cartstyle.css" rel="stylesheet" type="text/css" />
    <link href="${appPath }/css/optstyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${appPath }/js/jquery.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".delete").click(function () {
                if (confirm("你确定删除吗")){
                    var cartId=$(".cartId").val();
                    location.href = "${appPath}/shopcart/remove?cartId=" + cartId;
                }
            });
            //为“-”绑定点击事件，点击-减少一件商品
            $(".delNum").click(function () {
                var userId = $(".userId").val();
                //购买商品的数量
               var buynum = $("#text_box").val()-1;
                //购买商品的购物车ID
               var id=$(".cartId").val();
               if (buynum<=0){
                   if (confirm("你确定删除该商品吗")){
                       var cartId=$(".cartId").val();
                       location.href = "${appPath}/shopcart/remove?cartId=" + cartId;
                   }
               }
               //当前购物车对应数据库的唯一性ID
                location.href = "${appPath}/shopcart/update?cardId=" + id+"&buyNum="+buynum+"&userId="+userId;
            });
            //为“+”绑定点击事件，点击+增加一件商品,需要判定加入购物车的数量是否大于库存，大于库存需要阻止添加
            $(".AddNum").click(function () {
                var userId = $(".userId").val();
                var buynum = parseInt($("#text_box").val())+1;
                //获取该商品库存
                var prodsNum = $(".prodsNum").val();
                var id=$(".cartId").val();
                if (buynum>prodsNum){
                    alert("你购买数量超出当前商品数量，请修改后重试");
                    return;
                }
                location.href = "${appPath}/shopcart/update?cardId=" + id+"&buyNum="+buynum+"&userId="+userId;
            });
            //鼠标移开输入框事件判断更新数量
            $("#text_box").blur(function () {
                var userId = $(".userId").val();
                var prodsNum = $(".prodsNum").val();
                var id=$(".cartId").val();
                var buynum= parseInt($(this).val());
                //获取旧的购买数量
                var oldbuynum =$("#hid_" + id).val();
                if (oldbuynum!=buynum){
                    if (/^[1-9][0-9]*$/.test(buynum)) {
                        if (buynum>prodsNum){
                            alert("你购买数量超出当前商品数量，请修改后重试");
                            $(this).val(oldbuynum);
                            return;
                        }
                        location.href = "${appPath}/shopcart/update?cardId=" + id+"&buyNum="+buynum+"&userId="+userId;
                    } else {
                        alert("请输入一个整数");
                        $(this).val(oldbuynum);
                        return;
                    }
                }
            });
        });
        //全选
        function checkAll(obj){
            //让所有item的状态和全选保持一致
            var items = document.getElementsByName("item");
            for(var i=0; i<items.length; i++){
                items[i].checked = obj.checked;
            }
        }
        //统计选中的checkbox数量
        function sumselect() {
            var items = document.getElementsByName("item");
            var sum = 0;
            for(var i=0; i<items.length;i++){
                if(items[i].checked){
                    sum += 	parseFloat(items[i].value);
                }
            }
            //计算出总金额
            document.getElementById("J_Total").innerHTML = sum;
            //TODO 小BUG，显示为0时候无法显示为0还是上一次，还没测试有多个商品
            document.getElementById("J_SelectedItemsCount").innerHTML=items.length;
        }
        //批量删除选中的
        function deleteAll() {
            if (confirm("你确定全部商品删除吗")){
                var items = document.getElementsByName("item");
                var array = new Array();
                for(var i=0; i<items.length; i++){
                    //批量遍历哪个被选中，选中的获取其中被选中的cartId保存到一个数组中
                    if (items[i].checked){
                        array[i]=$(".cartId").val();
                    }
                }
                $.ajax({
                    type : 'POST',
                    url: '${appPath}/shopcart/removeAll',
                    contentType : "application/json" ,
                    data : JSON.stringify(array),
                    success : function() {
                        location.href = "${appPath}/shopcart/select";
                    }
                });
            }
        }
    </script>

    <script type="text/javascript">
        function cartOrder1(){
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

            console.log(prodName);
            console.log("图片："+prodUrl);
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
<%@include file="../../../shop/_head2.jsp"%>
<!--购物车 -->
<div class="concent">
    <div id="cartTable">
        <div class="cart-table-th">
            <div class="wp">
                <div class="th th-chk">
                    <div id="J_SelectAll1" class="select-all J_SelectAll">

                    </div>
                </div>
                <div class="th th-item">
                    <div class="td-inner">商品信息</div>
                </div>
                <div class="th th-price">
                    <div class="td-inner">单价</div>
                </div>
                <div class="th th-amount">
                    <div class="td-inner">数量</div>
                </div>
                <div class="th th-sum">
                    <div class="td-inner">金额</div>
                </div>
                <div class="th th-op">
                    <div class="td-inner">操作</div>
                </div>
            </div>
        </div>
        <div class="clear"></div>

        <tr class="item-list">
            <div class="bundle  bundle-last ">
                <div class="clear"></div>
                <div class="bundle-main">
                    <c:set var="totalMoney" value="0"></c:set>
                    <%-- 一个ul标签作为一个循环体 --%>
                    <c:forEach items="${shopCartsInfo}" var="cardInfo">
                    <ul class="item-content clearfix">
                        <input type="hidden" value="${cardInfo.prodId }" id="prodId"/>
                        <li class="td td-chk">
                            <div class="cart-checkbox ">
                                <input class="check" id="${cardInfo.cartId}" name="item" value="${cardInfo.prodNum * cardInfo.product.promotionPrice}" type="checkbox" onclick="sumselect()">
                                <label for="${cardInfo.cartId}"></label>
                            </div>
                        </li>
                        <li class="td td-item">
                            <div class="item-pic">
                                <a href="${appPath}/introduction/intro?id=${cardInfo.product.id}&pageNum=1&minproPageNum=1" target="_blank" data-title=">${cardInfo.product.name}" class="J_MakePoint" data-point="tbcart.8.12">
                                    <img src=${cardInfo.product.imgUrl.substring(9,cardInfo.product.imgUrl.indexOf(" />"))} style="width:80px;height:80px;" class="itempic J_ItemImg"></a>
                                    <input type="hidden" id="prodImgUrl" value=${cardInfo.product.imgUrl.substring(9,cardInfo.product.imgUrl.indexOf(" />"))} />
                            </div>
                            <div class="item-info">
                                <div class="item-basic-info">
                                    <a href="${appPath}/introduction/intro?id=${cardInfo.product.id}&pageNum=1&minproPageNum=1" target="_blank" title="${cardInfo.product.name}" class="item-title J_MakePoint" data-point="tbcart.8.11" id="prodName">${cardInfo.product.name}</a>
                                </div>
                            </div>
                        </li>
                        <li class="td td-info">
                        <div class="item-props item-props-can">
                            <div>${cardInfo.product.title}</div>
                            <%--<span tabindex="0" class="btn-edit-sku theme-login">修改</span>--%>
                            <%--<i class="theme-login am-icon-sort-desc"></i>--%>
                        </div>
                        </li>
                        <li class="td td-price">
                            <div class="item-price price-promo-promo">
                                <div class="price-content">
                                    <div class="price-line">
                                        <em class="price-original">${cardInfo.product.salePrice}</em>
                                    </div>
                                    <div class="price-line">
                                        <em class="J_Price price-now" tabindex="0" id="promotionPrice">${cardInfo.product.promotionPrice}</em>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="td td-amount">
                            <div class="amount-wrapper ">
                                <div class="item-amount ">
                                    <div class="sl">
                                        <a href="javascript:void(0)"class="delNum" style="padding-right: 8px">-</a>
                                        <%-- 隐藏域，方便数据进行回显 --%>
                                        <input type="hidden" id="hid_${cardInfo.cartId}" value="${cardInfo.prodNum}">
                                        <input class="text_box" id="text_box" name="text_box" type="text" value="${cardInfo.prodNum}" style="width:30px;"/>
                                        <a href="javascript:void(0)"class="AddNum" style="padding-left: 6px">+</a>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="td td-sum">
                            <div class="td-inner">
                                <input type="hidden" value="${cardInfo.prodNum * cardInfo.product.promotionPrice}" id="totalMoney">
                                <em tabindex="0" class="J_ItemSum number">${cardInfo.prodNum * cardInfo.product.promotionPrice}</em>
                            </div>
                        </li>
                        <c:set var="totalMoney" value="${totalMoney+cardInfo.prodNum * cardInfo.product.promotionPrice}"></c:set>
                        <input type="hidden" value="${cardInfo.cartId}" class="cartId">
                        <input type="hidden" value="${cardInfo.product.prodsNum}" class="prodsNum">
                        <input type="hidden" value="${cardInfo.userId}" class="userId">
                        <li class="td td-op">
                            <div class="td-inner">
                                <a title="移入收藏夹" class="btn-fav" href="#">
                                    移入收藏夹</a>
                                <a href="javascript:;" data-point-url="#" class="delete">
                                    删除</a>
                            </div>
                        </li>
                    </ul>
                    </c:forEach>
                </div>
            </div>
        </tr>
        <div class="clear"></div>
    <div class="float-bar-wrapper">
        <div id="J_SelectAll2" class="select-all J_SelectAll">
            <div class="cart-checkbox">
                <input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox" onclick="checkAll(this),sumselect()">
                <label for="J_SelectAllCbx2"></label>
            </div>
            <span>全选</span>
        </div>
        <div class="operations">
            <a href="#" hidefocus="true" class="deleteAll" onclick="deleteAll()">删除</a>
            <a href="#" hidefocus="true" class="J_BatchFav">移入收藏夹</a>
        </div>
        <div class="float-bar-right">
            <div class="amount-sum">
                <span class="txt">已选商品</span>
                <em id="J_SelectedItemsCount"></em><span class="txt">件</span>
                <div class="arrow-box">
                    <span class="selected-items-arrow"></span>
                    <span class="arrow"></span>
                </div>
            </div>
            <div class="price-sum">
                <span class="txt">合计:</span>
                <%-- jsp精准判断，实际使用这个传过去订单 --%>
                <%--${totalMoney}--%>
                <strong class="price">¥<em id="J_Total"></em></strong>
            </div>
            <div class="btn-area">
                <a href="javascript:void(0);" id="J_Go" class="submit-btn submit-btn-disabled" aria-label="请注意如果没有选择宝贝，将无法结算" onclick="cartOrder1()" >
                    <span>结&nbsp;算</span></a>
            </div>
        </div>
    </div>
    <%@include file="/_foot.jsp"%>
    </div>
</div>

<!--操作页面-->

<div class="theme-popover-mask"></div>

<div class="theme-popover">
    <div class="theme-span"></div>
    <div class="theme-poptit h-title">
        <a href="javascript:;" title="关闭" class="close">×</a>
    </div>
    <div class="theme-popbod dform">
        <form class="theme-signin" name="loginform" action="" method="post">

            <div class="theme-signin-left">

                <li class="theme-options">
                    <div class="cart-title">颜色：</div>
                    <ul>
                        <li class="sku-line selected">12#川南玛瑙<i></i></li>
                        <li class="sku-line">10#蜜橘色+17#樱花粉<i></i></li>
                    </ul>
                </li>
                <li class="theme-options">
                    <div class="cart-title">包装：</div>
                    <ul>
                        <li class="sku-line selected">包装：裸装<i></i></li>
                        <li class="sku-line">两支手袋装（送彩带）<i></i></li>
                    </ul>
                </li>
                <div class="theme-options">
                    <div class="cart-title number">数量</div>
                    <dd>
                        <input class="min am-btn am-btn-default" name="" type="button" value="-" />
                        <input class="text_box" name="" type="text" value="1" style="width:30px;" />
                        <input class="add am-btn am-btn-default" name="" type="button" value="+" />
                        <span  class="tb-hidden">库存<span class="stock">1000</span>件</span>
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
                    <img src="${appPath }/images/kouhong.jpg_80x80.jpg" />
                </div>
                <div class="text-info">
                    <span class="J_Price price-now">¥39.00</span>
                    <span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
                </div>
            </div>

        </form>
    </div>
</div>
<!--引导 -->
<%@include file="/_navigation.jsp" %>

<!-- 右侧导航栏 -->
<%@include file="/_rightbtn.jsp" %>
<!-- ↑引入右侧菜单栏 -->
</body>

</html>
