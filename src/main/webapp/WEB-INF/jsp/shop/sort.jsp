
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>全部分类</title>
    <link href="${appPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="${appPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="${appPath }/css/sortstyle.css" rel="stylesheet" type="text/css" />
    <script src="${appPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <%-- AJAX点击查询当前类的下面有的二级目录 --%>
    <script type="text/javascript">

    </script>
</head>

<body>
<%@include file="../../../shop/_head2.jsp"%>

</div>
<!--主体-->

<div id="nav" class="navfull">
    <div class="area clearfix">
        <div class="category-content" id="guide_2">
            <div class="long-title"><span class="all-goods">全部分类</span><span id="meauBack"><a href="javascript:history.go(-1);location.reload()">返回</a></span></div>
            <div class="category">
                <ul class="category-list" id="js_climit_li">

                    <%-- 最外层大标签 --%>
                    <c:forEach items="${ParentInfo}" var="p">
                    <li class="appliance js_toggle relative first selected">
                        <div class="category-info">
                            <h3 class="category-name b-category-name"><i><img src="${appPath}/images/cake.png"></i><a href="${appPath}/sort/selectSingle?id=${p.id}" class="ml-22" title="${p.name}">${p.name}</a></h3>
                            <em>&gt;</em></div>
                        <div class="menu-item menu-in top">

                            <div class="area-in">
                                <div class="area-bg">
                                    <div class="menu-srot">
                                        <div class="sort-side">
                                            <dl class="dl-sort">
                                                <c:if test="${singleList!=null}">
                                                <c:forEach items="${singleList}" var="d">
                                                <dd><a title="${d.name}" href="${appPath}/shop/search?name=${d.name}"><span>${d.name}</span></a></dd>
                                                </c:forEach>
                                                </c:if>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <b class="arrow"></b>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

    </div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("li").click(function() {
            $(this).addClass("selected").siblings().removeClass("selected");
        })
    })
</script>
<div class="clear"></div>
<!--引导 -->
<%@include file="/_navigation.jsp" %>
</body>

</html>
