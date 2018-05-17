
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
.tip{ display:none}
@media only screen and (min-width: 1025px) 

   {
   
   .tip{display:block;}
   
   }
/*侧边信息栏*/  
.tip{ position:fixed; top:0px;right:0px;background-color: #e1e1e1; min-height: 100%;z-index: 1000; }
#sidebar {
    padding-top: 120px;
    width: 40px;
    position: absolute;
    right: 0;
    background-color:#1F1F21;
    min-height: 100%;
    z-index: 100;
	color:#FFF;
}

#content {
    width: 800px;
    margin: 0 auto;
    height: 400px;
}
.item {
    text-align: center;
    cursor: pointer;
	position:relative;
    padding-bottom: 3px;
}
.item span,.quick_toggle li span{
display: block;
line-height:38px;
width: 35px;
height: 38px;
background: url(${appPath }/images/ibar_sprites.png) no-repeat;
}
/*图标定位*/
.item .setting {position:absolute;top: 10px;left: 10px;width: 18px;height: 19px;background-position: 0 0;}
.item:hover .setting{background-position: -33px 0;}
.item .message {position:absolute;top: 10px;left: 8px;width: 22px;height: 19px;background-position: 0px -29px;}
.item:hover .message{background-position: -33px -29px;}
.item .view { position:absolute;width: 18px;height: 18px;background-position: 0 -57px;top: 10px;left: 10px;}
.item:hover .view{background-position: -33px -57px;}
.item .zuji { position:absolute;width: 11px;height: 24px;background-position: -4px -110px;top: 8px;left: 12px;}
.item:hover .zuji{background-position: -36px -110px;}

.item span.wdsc,.item span.chongzhi{ background:none;}


.item:hover,.quick_toggle li:hover{ background:#ed145b;}
.item p {font-size: 12px;width:16px;margin:0px auto;padding-bottom:10px;}
.item,.nav-content{ font-size:12px;}
.ibar_login_box {width: 267px;height: 185px;padding: 10px;background: #fff;box-shadow: 0 0 5px rgba(0,0,0,.4);border-radius: 5px 0 0 5px;border-left: 1px solid #ccc\0;border-top: 1px solid #ccc\0;border-bottom: 1px solid #ccc\0;z-index: 3;position: absolute;top: 0px;left: -270px;display: none;}

#shopCart{overflow: hidden;}
p.cart_num {width: 21px; height: 21px; display: block; border-radius: 50%;background: #ED145B none repeat scroll 0% 0%;text-align: center; line-height: 21px;
cursor: pointer;color: #FFF; margin-bottom:10px;}
.item:hover p.cart_num{ background:#FFF;color: #ED145B}
/*小图标定位*/

.quick_toggle {position: absolute;bottom: 0;left: 0;width: 40px;background: #2b2b2b;z-index: 1;}
.item a,.quick_toggle a{ display:block;
width: 40px;
height: 38px;cursor: pointer; position:relative; overflow:hidden; }
.quick_toggle span{position:absolute;top:12px;left:12px;background: url(${appPath }/images/ibar_sprites.png) no-repeat;}
.quick_toggle .kfzx{background-position:0 -175px;}
.quick_toggle li:hover .kfzx{ background-position:-33px -175px;}
.quick_toggle .mpbtn_qrcode {background-position: 0 -302px; position:absolute;top:12px;left:10px;}
.quick_toggle .top {background-position: 0 -201px; position:absolute;top:12px;left:10px;}


/*展开内容项布局*/
.ia-head-list .num {font-size: 16px;height: 26px;font-family: arial;}
.ia-head-list .pl {width:60px;border-right: dashed 1px #ccc;height: 47px;margin-top: 10px; margin-left:6px;text-align: center;float: left;}
.pl.money{ border-right:none;}
.ia-head-list {height: 66px;width: 200px;background: #f3f3f3;overflow: hidden;zoom: 1;margin-top: 15px;color: #4a4a4a;}
/*头像*/
.ibar_login_box .avatar_imgbox {width: 100px;height: 100px;border-radius: 50%; overflow:hidden; float:left;}
.status_login .user_info {overflow: hidden;color: #333;padding-top: 30px;line-height: 24px;width: 140px;float: left;}
.ibar_login_box .login_btnbox {width: 200px;height: 79px;border-top: 1px dotted #d5d5d5;overflow: hidden;padding-top: 15px;clear: both; margin:0px auto;}
.ibar_login_box .login_btnbox a {width: 94px;height: 30px;line-height: 30px;text-align: center;border: 1px solid;color: #333;text-decoration: none;float: left;background-position: 0 -408px;background-repeat: repeat-x;border-color: #e9e9e9;}


.mp_tooltip {height: 38px;line-height: 38px;width: 92px;position: absolute;z-index: 2;left: -121px;top: 0;background: #2b2b2b;color: #d8d8d8;text-align: center;display: block;visibility: hidden;font-size:12px;}
.icon_arrow_white {position: absolute;right: -5px;top: 15px;width: 5px;height: 9px;background:url(${appPath }/images/ibar_sprites.png) no-repeat;background-position: 0 -253px;}
.icon_arrow_right_black {position: absolute;right: -5px;top: 15px;width: 5px;height: 9px;
background:url(../images/ibar_sprites.png) no-repeat;background-position:0px -234px;overflow: hidden;}


.mp_qrcode {padding: 10px;width: 148px;height: 150px;top: -50px;background: #fff;box-shadow: 0 0 5px rgba(0,0,0,.4);border-radius: 5px 0 0 5px;border: 1px solid #ccc;z-index: 3;position: absolute;left: -154px;display: none;}
.mp_qrcode .icon_arrow_white{top:105px;}
.nav-content {position: absolute;min-height: 100%; width: 200px;background-color: #fff;z-index: 99;text-align: center;right:-165px;border-radius: 5px 0 0 5px;border: 1px solid #999; padding-top:15px;}



.mp_qrcode img{width:100%;height: auto;}





.am-article-title.blog-title{font-size:24px;line-height: 1.15;font-weight: normal;margin: 10px 0px 20px;}
.blog-content p{margin: 0 0 1.6rem 0;font-size:14px;}



</style>
<!-- 
<div class="navCir">
    <li class="active"><a href="home2.html"><i class="am-icon-home "></i>首页</a></li>
    <li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
    <li><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>
    <li><a href="personalCenter/index.html"><i class="am-icon-user"></i>我的</a></li>
</div> -->

<!--菜单 -->
<div class=tip>
    <div id="sidebar">
        <div id="wrap">
            <div id="prof" class="item ">
                <a href="${appPath }/usercenter/index ">
                    <span class="setting "></span>
                </a>
                <div class="ibar_login_box status_login ">
                    <div class="avatar_box ">
                        <p class="avatar_imgbox "><img src="${appPath }/images/no-img_mid_.jpg " /></p>
                        <ul class="user_info ">
                            <c:if test="${sessionScope.User!=null}">
                            <li>用户名：${User.userName}</li>
                            </c:if>
                            <li>级&nbsp;别：普通会员</li>
                        </ul>
                    </div>
                    <div class="login_btnbox ">
                        <a href="${appPath }/usercenter/order " class="login_order ">我的订单</a>
                        <a href="${appPath }/usercenter/collection " class="login_favorite ">我的收藏</a>
                    </div>
                    <i class="icon_arrow_white "></i>
                </div>

            </div>

            <div id="shopCart " class="item ">
                <a href="${appPath }/shopcart/select">
                    <span class="message "></span></a>
                <p>购物车 </p>
                <p class="cart_num ">0</p>

            </div>

            <div id="asset " class="item ">
                <a href="${appPath }/usercenter/wallet ">
                    <span class="view "></span>
                </a>
                <div class="mp_tooltip ">
                    我的资产
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="foot " class="item ">
                <a href="${appPath }/usercenter/foot ">
                    <span class="zuji "></span>
                </a>
                <div class="mp_tooltip ">
                    我的足迹
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="brand " class="item ">
                <a href="${appPath }/usercenter/collection">
                    <span class="wdsc "><img src="${appPath }/images/wdsc.png " /></span>
                </a>
                <div class="mp_tooltip ">
                    我的收藏
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div id="broadcast " class="item ">
                <a href="# ">
                    <span class="chongzhi "><img src="${appPath }/images/chongzhi.png " /></span>
                </a>
                <div class="mp_tooltip ">
                    我要充值
                    <i class="icon_arrow_right_black "></i>
                </div>
            </div>

            <div class="quick_toggle ">
                <!-- <li class="qtitem ">
                    <a href="# " ><span class="kfzx "></span></a>
                    <div class="mp_tooltip ">客服中心<i class="icon_arrow_right_black "></i></div>
                </li> -->
                <!--二维码 -->
                <%-- <li class="qtitem ">
                    <a href="#none "><span class="mpbtn_qrcode "></span></a>
                    <div class="mp_qrcode " style="display:none; "><img src="${appPath }/images/weixin_qr1.png " /><i class="icon_arrow_white "></i></div>
                </li> --%>
                <li class="qtitem ">
                    <a href="#top " class="return_top "><span class="top "></span></a>
                </li>
            </div>

            <!--回到顶部 -->
            <div id="quick_links_pop " class="quick_links_pop hide "></div>

        </div>

    </div>
    <div id="prof-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            我
        </div>
    </div>
    <div id="shopCart-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            购物车
        </div>
    </div>
    <div id="asset-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            资产
        </div>

        <div class="ia-head-list ">
            <%--<a href="# " target="_blank " class="pl ">--%>
                <%--<div class="num ">0</div>--%>
                <%--<div class="text ">优惠券</div>--%>
            <%--</a>--%>
            <%--<a href="# " target="_blank " class="pl ">--%>
                <%--<div class="num ">0</div>--%>
                <%--<div class="text ">红包</div>--%>
            <%--</a>--%>
            <a href="# " target="_blank " class="pl money ">
                <div class="num ">￥0</div>
                <div class="text ">余额</div>
            </a>
        </div>

    </div>
    <%--<div id="foot-content " class="nav-content ">--%>
        <%--<div class="nav-con-close ">--%>
            <%--<i class="am-icon-angle-right am-icon-fw "></i>--%>
        <%--</div>--%>
        <%--<div>--%>
            <%--足迹--%>
        <%--</div>--%>
    <%--</div>--%>
    <div id="brand-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            收藏
        </div>
    </div>
    <div id="broadcast-content " class="nav-content ">
        <div class="nav-con-close ">
            <i class="am-icon-angle-right am-icon-fw "></i>
        </div>
        <div>
            充值
        </div>
    </div>
</div>
<script>
    window.jQuery || document.write('<script src="${appPath }/basic/js/jquery.min.js "><\/script>');
</script>
<script type="text/javascript " src="${appPath }/basic/js/quick_links.js "></script>
