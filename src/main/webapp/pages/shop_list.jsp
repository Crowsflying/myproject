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

    <meta charset="utf-8"/>
<title>商家列表</title>
    <meta name="keywords"  content="DeathGhost" />
    <meta name="description" content="DeathGhost" />
    <meta name="author" content="DeathGhost,deathghost@deathghost.cn">
    <link rel="icon" href="${pageContext.request.contextPath}/images/icon/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="../css/style.css" /><script src="../js/html5.js"></script>
    <script src="../js/jquery.js"></script>
<script>
$(document).ready(function(){
  $("nav .indexAsideNav").hide();
  $("nav .category").mouseover(function(){
	  $(".asideNav").slideDown();
	  });
  $("nav .asideNav").mouseleave(function(){
	  $(".asideNav").slideUp();
	  });
  //冒泡
  $(".favorite_list li a").click(function(){
	alert("链接");
	window.location.href='shop.html';
	});
	$(".favorite_list li .shop_collect_goods").click(function(){
	alert("收藏本店铺");
	event.stopPropagation();
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
      <li><a href="user.jsp">商家中心</a></li>
      <li><a href="article_read.html" class="srvIcon">客户服务</a></li>
      <li><a href="union_login.html">联盟管理</a></li>
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
       <div class="inputWrap">
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
      <dt><a href="channel.jsp">女装</a></dt>
      <dd>
      <a href="#">夏装新</a>
      <a href="#">连衣裙</a>
      <a href="#">T恤</a>
      <a href="#">衬衫</a>
      <a href="#">裤子</a>
      <a href="#">牛仔裤</a>
      <a href="#">背带裤</a>
      <a href="#">短外套</a>
      <a href="#">时尚外套</a>
      <a href="#">风衣</a>
      <a href="#">毛衣</a>
      <a href="#">背心</a>
      <a href="#">吊带</a>
      <a href="#">民族服装</a>
      </dd>
      <dt><a href="channel.jsp">男装</a></dt>
      <dd>
      <a href="#">衬衫</a>
      <a href="#">背心</a>
      <a href="#">西装</a>
      <a href="#">POLO衫</a>
      <a href="#">马夹</a>
      <a href="#">皮衣</a>
      <a href="#">毛衣</a>
      <a href="#">针织衫</a>
      <a href="#">牛仔裤</a>
      <a href="#">外套</a>
      <a href="#">夹克</a>
      <a href="#">卫衣</a>
      <a href="#">风衣</a>
      <a href="#">民族风</a>
      <a href="#">原创设计</a>
      <a href="#">大码</a>
      <a href="#">情侣装</a>
      <a href="#">开衫</a>
      <a href="#">运动裤</a>
      <a href="#">工装裤</a>
      </dd>
      </dl>
      </li>
      <li>
      <a href="${pageContext.request.contextPath}/clothes/findmain.do" class="active">首页</a>
      </li>
      <li>
      <a href="#">时尚搭配</a>
      </li>
      <li>
      <a href="channel.jsp">原创设计</a>
      </li>
      <li>
      <a href="channel.jsp">时尚代购</a>
      </li>
      <li>
      <a href="channel.jsp">民族风</a>
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
  $(document).ready(function(){
     //测试效果，程序对接如需变动重新编辑
     $(".switchNav li").click(function(){
        $(this).addClass("active").siblings().removeClass("active");
        });
     $("#chanpin").click(function(){
        $(".inputWrap input[type='text']").attr("placeholder","输入产品关键词或货号");
        });
     $("#shangjia").click(function(){
        $(".inputWrap input[type='text']").attr("placeholder","输入商家店铺名");
        });
     $("#zixun").click(function(){
        $(".inputWrap input[type='text']").attr("placeholder","输入关键词查找文章内容");
        });
     $("#wenku").click(function(){
        $(".inputWrap input[type='text']").attr("placeholder","输入关键词查找文库内容");
        });
     });
    document.oncontextmenu=new Function("event.returnValue=false;");
    document.onselectstart=new Function("event.returnValue=false;"); 
  </script>
  
<section class="wrap list_class_page">
 <div class="lt_area">
  <div class="attr_filter">
     <h2>属性筛选</h2>
     <ul>
      <li>
       <dl>
        <dt>按品牌筛选：</dt>
        <dd>
         <a>品牌A</a>
         <a>品牌B</a>
         <a>品牌C</a>
         <a>品牌D</a>
         <a>品牌E</a>
         <a>品牌F</a>
         <a>品牌G</a>
         <a>品牌H</a>
         <a>品牌I</a>
         <a>品牌J</a>
        </dd>
       </dl>
      </li>
      <li>
       <dl>
        <dt>按价格筛选：</dt>
        <dd>
         <a>0~300元</a>
         <a>0~300元</a>
         <a>0~300元</a>
         <a>0~300元</a>
         <a>0~300元</a>
         <a>0~300元</a>
         <a>0~300元</a>
         <a>0~300元</a>
         <a>0~300元</a>
         <a>0~300元</a>
        </dd>
       </dl>
      </li>
      <li>
       <dl>
        <dt>按上架时间筛选：</dt>
        <dd>
         <a>今天</a>
         <a>昨天</a>
         <a>本周</a>
         <a>本月</a>
        </dd>
       </dl>
      </li>
     </ul>
  </div>
  <!--产品列表-->
    <section class="shop_li">
     <h2>店铺列表</h2>
      <ul class="favorite_list">
       <li>
        <a>
         <img src="upload/brandLogo01.jpg"/>
         <h3>店铺一</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo02.jpg"/>
         <h3>店铺二</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo03.jpg"/>
         <h3>店铺三</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo04.jpg"/>
         <h3>2019时尚新款</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo01.jpg"/>
         <h3>店铺一</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo02.jpg"/>
         <h3>店铺二</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo03.jpg"/>
         <h3>店铺三</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo04.jpg"/>
         <h3>2019时尚新款</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo01.jpg"/>
         <h3>店铺一</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo02.jpg"/>
         <h3>店铺二</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo03.jpg"/>
         <h3>店铺三</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo04.jpg"/>
         <h3>2019时尚新款</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo01.jpg"/>
         <h3>店铺一</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo02.jpg"/>
         <h3>店铺二</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo03.jpg"/>
         <h3>店铺三</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
       <li>
        <a>
         <img src="upload/brandLogo04.jpg"/>
         <h3>2019时尚新款</h3>
         <p class="shop_collect_goods" title="收藏该产品"><span>&#115;</span></p>
        </a>
       </li>
      </ul>
       <!--分页-->
       <div class="paging">
        <a>第一页</a>
        <a class="active">2</a>
        <a>3</a>
        <a>...</a>
        <a>89</a>
        <a>最后一页</a>
       </div>
    </section>

 </div>
 <aside class="rtWrap">
  <dl class="rtLiTwoCol">
   <dt>热门推荐</dt>
   <dd>
    <a href="product.jsp">
     <img src="upload/goods002.jpg"/>
     <p>0.00</p>
    </a>
   </dd>
   <dd>
    <a href="product.jsp">
     <img src="upload/goods001.jpg"/>
     <p>0.00</p>
    </a>
   </dd>
   <dd>
    <a href="product.jsp">
     <img src="upload/goods003.jpg"/>
     <p>0.00</p>
    </a>
   </dd>
   <dd>
    <a href="product.jsp">
     <img src="upload/goods004.jpg"/>
     <p>0.00</p>
    </a>
   </dd>
   <dd>
    <a href="product.jsp">
     <img src="upload/goods008.jpg"/>
     <p>0.00</p>
    </a>
   </dd>
   <dd>
    <a href="product.jsp">
     <img src="upload/goods007.jpg"/>
     <p>0.00</p>
    </a>
   </dd>
   <dd>
    <a href="product.jsp">
     <img src="upload/goods006.jpg"/>
     <p>0.00</p>
    </a>
   </dd>
   <dd>
    <a href="product.jsp">
     <img src="upload/goods005.jpg"/>
     <p>0.00</p>
    </a>
   </dd>
   <dd>
    <a href="product.jsp">
     <img src="upload/goods008.jpg"/>
     <p>0.00</p>
    </a>
   </dd>
   <dd>
    <a href="product.jsp">
     <img src="upload/goods007.jpg"/>
     <p>0.00</p>
    </a>
   </dd>
   <dd>
    <a href="product.jsp">
     <img src="upload/goods006.jpg"/>
     <p>0.00</p>
    </a>
   </dd>
   <dd>
    <a href="product.jsp">
     <img src="upload/goods005.jpg"/>
     <p>0.00</p>
    </a>
   </dd>
  </dl>
 </aside>
</section>
<!--footer-->
<footer>
 <!--help-->
 <ul class="wrap help">
  <li>
   <dl>
    <dt>消费者保障</dt>
    <dd><a href="article_read.html">保障范围</a></dd>
    <dd><a href="article_read.html">退换货流程</a></dd>
    <dd><a href="article_read.html">服务中心</a></dd>
    <dd><a href="article_read.html">更多服务特色</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>新手上路</dt>
    <dd><a href="article_read.html">保障范围</a></dd>
    <dd><a href="article_read.html">退换货流程</a></dd>
    <dd><a href="article_read.html">服务中心</a></dd>
    <dd><a href="article_read.html">更多服务特色</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>付款方式</dt>
    <dd><a href="article_read.html">保障范围</a></dd>
    <dd><a href="article_read.html">退换货流程</a></dd>
    <dd><a href="article_read.html">服务中心</a></dd>
    <dd><a href="article_read.html">更多服务特色</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>服务保障</dt>
    <dd><a href="article_read.html">保障范围</a></dd>
    <dd><a href="article_read.html">退换货流程</a></dd>
    <dd><a href="article_read.html">服务中心</a></dd>
    <dd><a href="article_read.html">更多服务特色</a></dd>
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