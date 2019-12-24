<%@ page import="com.company.bean.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String path = request.getRequestURI();
        String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path;
    %>
    <base href="<%=basePath%>">

    <style type="text/css">

        /*设置 a 标签的css样式*/
        .page-normal a {
            border: 1px solid #ff6500;
            padding: 5px 7px;
            color: #ff6500;
            margin-left: 20px; /*设置标签 a 之间的间隔*/
            text-decoration: none; /*去除页码数字下面的下划线*/
        }

        /*设置鼠标经过时 a 标签的css样式*/
        .page-normal a:hover {
            background-color: #ffbe94;
        }

        /*设置整个div的css样式,该样式主要用于设置网页内的省略号 …… 的样式，并且同时设置内容居中显示*/
        .page-normal {
            color: #ff6500;
            text-align: center;
        }

        /*设置当前页面的css样式*/
        .page-normal .page-current {
            color: #ffffff;
            background-color: #ff6500;
        }

        /*设置左单括号 < 的css样式*/
        .page-normal .page-prev {
            color: #ffe3c6;
        }

        .page-icon li {
            display: inline-block;
            margin-right: -1px;
            padding: 5px;
            border: 1px solid #e2e2e2;
            min-width: 20px;
            text-align: center;
        }
        .page-icon li.active {
            background: #009688;
            color: #fff;
            border: 1px solid #009688;
        }
        .page-icon li a {
            display: block;
            text-align: center;
        }
        /*进行代码优化，将不同css样式中共有的属性放在一起，有助于提高运行效率*/
        .page-normal a, .page-normal a:hover, .page-normal .page-prev, .page-normal .page-current {
            border: 1px solid #ff6500;
            padding: 5px 7px;
        }
    </style>
    <meta charset="utf-8"/>
    <title>购物车</title>
    <meta name="keywords" content="DeathGhost"/>
    <meta name="description" content="DeathGhost"/>
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="../images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    <script src="../js/html5.js"></script>
    <script src="../js/jquery.js"></script>
    <script>
        $(document).ready(function () {
            $("nav .indexAsideNav").hide();
            $("nav .category").mouseover(function () {
                $(".asideNav").slideDown();
            });
            $("nav .asideNav").mouseleave(function () {
                $(".asideNav").slideUp();
            });
        });
    </script>
</head>
<body>
<!--header-->
<header>
    <!--topNavBg-->
    <div class="topNavBg">
        <div class="wrap">
            <!--topLeftNav-->
            <ul class="topLtNav">
                <%
                    User user= (User) request.getSession().getAttribute("user");
                %>
                <%if (user==null){%>
                <li><a href="login.jsp" class="obviousText">亲，请登录</a></li>
                <input type="hidden" value="1" id="rootrua">
                <li><a href="register.jsp">注册</a></li>
                <%}else{%>
                <li><a href="user.jsp" class="obviousText"><%=user.getNickname()%></a></li>
                <input type="hidden" value="<%=user.getType()%>" id="rootrua">
                <li><a href="${pageContext.request.contextPath}/clothes/logout.do">退出</a></li>
                <%}%>
            </ul>
            <script>
                function roothome() {
                    var key=$("#rootrua").val();
                    if (key==1){
                        alert("不是管理员无法进入");
                        return;
                    }
                    else {
                        window.location.href="${pageContext.request.contextPath}/user/findpage.do";
                    }
                }
            </script>
            <!--topRightNav-->
            <ul class="topRtNav">
                <li><a href="user.jsp">个人中心</a></li>
                <li><a href="${pageContext.request.contextPath}/clothes/findCart.do" class="cartIcon">购物车<i>0</i></a></li>
                <li><a href="${pageContext.request.contextPath}/onself/findcollect.do" class="favorIcon">收藏夹</a></li>
                <li><a href="javascript:void(0);" onclick="roothome()">商家中心</a></li>
                <li><a href="article_read.jsp" class="srvIcon">客户服务</a></li>
                <li><a href="union_login.jsp">联盟管理</a></li>
            </ul>
        </div>
    </div>
    <!--logoArea-->
    <div class="wrap logoSearch">
        <!--logo-->
        <div class="logo">
            <h1><img src="../images/logo1.png"/></h1>
        </div>
        <!--search-->
        <div class="search">
            <ul class="switchNav">
                <li class="active" id="chanpin">产品</li>
                <li id="shangjia">商家</li>
                <li id="zixun">搭配</li>
                <li id="wenku">文库</li>
            </ul>
            <div class="searchBox">
                <form>
                    <div class="inputWrap" style="height: 34px">
                        <input type="text" placeholder="输入产品关键词或货号"/>
                    </div>
                    <div class="btnWrap">
                        <input type="submit" value="搜索"/>
                    </div>
                </form>
                <a href="${pageContext.request.contextPath}/clothes/clearsenior.do" class="advancedSearch">高级搜索</a>
            </div>
        </div>
    </div>
    <!--nav-->
    <nav>
        <ul class="wrap navList">
            <li class="category">
                <a>全部产品分类</a>
                <dl class="asideNav indexAsideNav">
                    <dt><a href="${pageContext.request.contextPath}/clothes/findmaninfo.do?name=2019女装新款 夏季时尚开衫 爆款">女装</a></dt>
                    <dd>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">夏装新</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">连衣裙</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">T恤</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">衬衫</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">裤子</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">牛仔裤</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">背带裤</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">短外套</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">时尚外套</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">风衣</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">毛衣</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">背心</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">吊带</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">民族服装</a>
                    </dd>
                    <dt><a href="${pageContext.request.contextPath}/clothes/findmaninfo.do?name=2019男7">男装</a></dt>
                    <dd>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">衬衫</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">背心</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">西装</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">POLO衫</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">马夹</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">皮衣</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">毛衣</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">针织衫</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">牛仔裤</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">外套</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">夹克</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">卫衣</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">风衣</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">民族风</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">原创设计</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">大码</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">情侣装</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">开衫</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">运动裤</a>
                        <a href="${pageContext.request.contextPath}/clothes/findmain.do">工装裤</a>
                    </dd>
                </dl>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/clothes/findmain.do" class="active">首页</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/clothes/findmaninfo.do?name=2019女装新款 夏季时尚开衫 爆款">时尚搭配</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/clothes/findmaninfo.do?name=2019男7">原创设计</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/clothes/findmaninfo.do?name=2019女装新款 夏季时尚开衫 推荐款">时尚代购</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/clothes/findmaninfo.do?name=2019女装新款 夏太古城">民族风</a>
            </li>
            <li>
                <a href="information.jsp">时尚搭配</a>
            </li>
            <li>
                <a href="library.jsp">搭配知识</a>
            </li>
            <li>
                <a href="#">促销专区</a>
            </li>
            <li>
                <a href="#">其他</a>
            </li>
        </ul>
    </nav>

</header>
<script>
    $(document).ready(function () {
        //测试效果，程序对接如需变动重新编辑
        $(".switchNav li").click(function () {
            $(this).addClass("active").siblings().removeClass("active");
        });
        $("#chanpin").click(function () {
            $(".inputWrap input[type='text']").attr("placeholder", "输入产品关键词或货号");
        });
        $("#shangjia").click(function () {
            $(".inputWrap input[type='text']").attr("placeholder", "输入商家店铺名");
        });
        $("#zixun").click(function () {
            $(".inputWrap input[type='text']").attr("placeholder", "输入关键词查找文章内容");
        });
        $("#wenku").click(function () {
            $(".inputWrap input[type='text']").attr("placeholder", "输入关键词查找文库内容");
        });
    });




</script>

<section class="wrap" style="margin-top:20px;overflow:hidden;">
    <table class="order_table">
        <tr>
            <th><input type="checkbox"/></th>
            <th>产品</th>
            <th>名称</th>
            <th>属性</th>
            <th>单价</th>
            <th>数量</th>
            <th>小计</th>
            <th>操作</th>
            <th>购买</th>
        </tr>
        <c:forEach var="cart" items="${pageInfo.list}">
            <tr>
                <td class="center"><input type="checkbox"/></td>
                <td class="center"><a href="${pageContext.request.contextPath}/clothes/findmaninfo.do?name=${cart.goodsname}"><img src="http://q28msmys0.bkt.clouddn.com/${cart.image}"
                                                              style="width:50px;height:50px;"/></a></td>
                <td><a href="product.jsp">${cart.goodsname}</a></td>
                <td>
                    <p>颜色：${cart.color}</p>
                    <p>规格：${cart.attribute}</p>
                </td>
                <td class="center"><span class="rmb_icon">${cart.price}</span></td>
                <td class="center">
                    <input type="hidden" value="${cart.cartId}">
                    <input type="button" value="-" class="jj_btn" onclick="numberreduce(this)"/>
                    <input type="text" value="${cart.nums}" class="number" id="${cart.cartId}" name="num"/>
                    <input type="button" value="+" class="jj_btn" onclick="numberadd(this)"/>
                    <input type="hidden" value="${cart.cartId}">
                    <input type="hidden" value="${cart.stock}">
                </td>
                <td class="center"><strong class="rmb_icon" id="sumprice">${cart.price*cart.nums}</strong></td>
                <td class="center"><a href="${pageContext.request.contextPath}/clothes/deleteCart.do?id=${cart.cartId}">删除</a>
                    <input type="hidden" value="${cart.price*cart.nums}">
                <td class="center"><a  class="a_btn" href="${pageContext.request.contextPath}/order/clothesset.do?id=${cart.cartId}" id="${cart.cartId}">购买</a>
                </td>

            </tr>
        </c:forEach>
    </table>
    <script type="text/javascript">
        // $(".a_btn").on("onclick",function () {
        //     var id=this.id;
        //     window.location.href=""
        // }
        $(".number").on("change",function () {
            var id=this.id;
            var nums=this.value;
            var num=parseInt(nums);
            var stock=$(this).next().next().next().val();
            if (num<=0){
                alert("非法数值请重新输入!!!");
                $(".number").val(1);
                nums=1
            }
            if (num>stock){
                alert("超出库存"+stock);
                $(".number").val(stock);
                nums=stock
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/clothes/setCartnums.do",
                type:"post",
                dataType:"json",
                async:true,
                data:{
                    cartId:id,
                    nums:nums,
                    stock:stock
                },
                success:function () {
                    window.location.href="${pageContext.request.contextPath}/clothes/findCart.do"
                }
            })
        });
        function numberreduce(o) {
            if (parseInt($(o).next().val())<=1){
                return
            }
            $(o).next().val(parseInt($(o).next().val())-1);
            var nums=parseInt($(o).next().val());
            var cartId=$(o).prev().val();
            $.ajax({
                url:"${pageContext.request.contextPath}/clothes/setCartnums.do",
                type:"post",
                dataType:"json",
                async:true,
                data:{
                    cartId:cartId,
                    nums:nums
                },
                success:function () {
                    window.location.href="${pageContext.request.contextPath}/clothes/findCart.do"
                }
            })
        }
        function numberadd(o) {
            $(o).prev().val(parseInt($(o).prev().val())+1);
            var nums=parseInt($(o).prev().val());
            var cartId=$(o).next().val();
            var stock=$(o).next().next().val();
            if (nums>stock){
                alert("超出库存"+stock);
                $(o).next().val(stock);
                nums=stock
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/clothes/setCartnums.do",
                type:"post",
                dataType:"json",
                async:true,
                data:{
                    cartId:cartId,
                    nums:nums
                },
                success:function () {
                    window.location.href="${pageContext.request.contextPath}/clothes/findCart.do"
                }
            })
        }
    </script>
    <div class="page-icon" style="text-align: center">
        <li><a href="${pageContext.request.contextPath}/clothes/findCart.do?currentpage=1"><<</a></li>
        <c:forEach var="i" begin="1" end="${pageInfo.pages}">
            <li><a href="${pageContext.request.contextPath}/clothes/findCart.do?currentpage=${i}">${i}</a></li>
        </c:forEach>
        <li><a href="${pageContext.request.contextPath}/clothes/findCart.do?currentpage=${pageInfo.pages}">>></a></li>
    </div>
    <div class="order_btm_btn">
        <a href="${pageContext.request.contextPath}/clothes/findmain.do" class="link_btn_01 buy_btn"/>继续购买</a>
        <c:if test="${buybuy1!=0}">
    <a href="${pageContext.request.contextPath}/clothes/settlement.do" class="link_btn_02 add_btn"/>共计金额<strong class="rmb_icon">${buybuy1}</strong>立即结算</a>
        </c:if>
    </div>
</section>
<!--footer-->
<footer>
    <!--help-->
    <ul class="wrap help">
        <li>
            <dl>
                <dt>消费者保障</dt>
                <dd><a href="article_read.jsp">保障范围</a></dd>
                <dd><a href="article_read.jsp">退换货流程</a></dd>
                <dd><a href="article_read.jsp">服务中心</a></dd>
                <dd><a href="article_read.jsp">更多服务特色</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>新手上路</dt>
                <dd><a href="article_read.jsp">保障范围</a></dd>
                <dd><a href="article_read.jsp">退换货流程</a></dd>
                <dd><a href="article_read.jsp">服务中心</a></dd>
                <dd><a href="article_read.jsp">更多服务特色</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>付款方式</dt>
                <dd><a href="article_read.jsp">保障范围</a></dd>
                <dd><a href="article_read.jsp">退换货流程</a></dd>
                <dd><a href="article_read.jsp">服务中心</a></dd>
                <dd><a href="article_read.jsp">更多服务特色</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>服务保障</dt>
                <dd><a href="article_read.jsp">保障范围</a></dd>
                <dd><a href="article_read.jsp">退换货流程</a></dd>
                <dd><a href="article_read.jsp">服务中心</a></dd>
                <dd><a href="article_read.jsp">更多服务特色</a></dd>
            </dl>
        </li>
    </ul>
    <dl class="wrap otherLink">
        <dt>友情链接</dt>
        <dd><a href="http://www.17sucai.com" target="_blank">17素材</a></dd>
        <dd><a href="http://www.17sucai.com/pins/24448.html">HTML5模块化后台管理模板</a></dd>
        <dd><a href="http://www.17sucai.com/pins/15966.html">绿色清爽后台管理系统模板</a></dd>
        <dd><a href="http://www.17sucai.com/pins/14931.html">黑色的cms商城网站后台管理模板</a></dd>
        <dd><a href="http://www.deathghost.cn" target="_blank">前端博客</a></dd>
        <dd><a href="http://www.deathghost.cn" target="_blank">博客</a></dd>
        <dd><a href="http://www.deathghost.cn" target="_blank">新码笔记</a></dd>
        <dd><a href="http://www.deathghost.cn" target="_blank">DethGhost</a></dd>
        <dd><a href="#">当当</a></dd>
        <dd><a href="#">优酷</a></dd>
        <dd><a href="#">土豆</a></dd>
        <dd><a href="#">新浪</a></dd>
        <dd><a href="#">钉钉</a></dd>
        <dd><a href="#">支付宝</a></dd>
    </dl>
    <div class="wrap btmInfor">
        <p>© 2013 DeathGhost.cn 版权所有 网络文化经营许可证：浙网文[2013]***-027号 增值电信业务经营许可证：浙B2-200***24-1 信息网络传播视听节目许可证：1109***4号</p>
        <address>联系地址：陕西省西安市雁塔区XXX号</address>
    </div>
</footer>
</body>
</html>
