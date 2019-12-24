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
<title>首页</title>
<meta name="keywords"  content="DeathGhost" />
<meta name="description" content="DeathGhost" />
<meta name="author" content="DeathGhost,deathghost@deathghost.cn">
<link rel="icon" href="${pageContext.request.contextPath}/images/icon/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="../css/style.css" /><script src="../js/html5.js"></script>
<script src="../js/jquery.js"></script>
<script src="../js/swiper.min.js"></script>
<script>
$(document).ready(function(){
	//焦点图
	var mySwiper = new Swiper('#slide',{
		  autoplay:5000,
		  visibilityFullFit : true,
		  loop:true,
		  pagination : '.pagination',
	  });
})
</script>
</head>
<body>
<!--advertisment<div class="wrap"><img src="${pageContext.request.contextPath}/upload/banner.jpg"/></div>-->
<!--header-->
<%
  User user= (User) request.getSession().getAttribute("user");
%>
<header>
  <!--topNavBg-->
  <div class="topNavBg">
   <div class="wrap">
   <!--topLeftNav-->
    <ul class="topLtNav">
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
   <!--topRightNav-->
    <ul class="topRtNav">
     <li><a href="user.jsp">个人中心</a></li>
     <li><a href="${pageContext.request.contextPath}/clothes/findCart.do" class="cartIcon">购物车<i>!</i></a></li>
     <li><a href="${pageContext.request.contextPath}/onself/findcollect.do" class="favorIcon">收藏夹</a></li>
     <li><a href="javascript:void(0);" onclick="roothome()">商家中心</a></li>
     <li><a href="article_read.jsp" class="srvIcon" >客户服务</a></li>
     <li><a href="union_login.jsp">联盟管理</a></li>
    </ul>
   </div>
  </div>
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
  <!--logoArea-->
  <div class="wrap logoSearch">
   <!--logo-->
   <div class="logo">
    <h1><img src="${pageContext.request.contextPath}/images/logo1.png"/></h1>
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

 </script>

<!--advertisment area-->
<section class="wrap">
 <!--ctCont-->
 <div class="IdxmainArea">
    <!--slide-->
    <div id="slide">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
         <a href="${pageContext.request.contextPath}/clothes/findmain.do">
          <img src="${pageContext.request.contextPath}/upload/slide01.jpg"/>
         </a>
        </div>
        <div class="swiper-slide">
         <a href="${pageContext.request.contextPath}/clothes/findmain.do">
          <img src="${pageContext.request.contextPath}/upload/slide02.jpg"/>
         </a>
        </div>
        <div class="swiper-slide">
         <a href="${pageContext.request.contextPath}/clothes/findmain.do">
          <img src="${pageContext.request.contextPath}/upload/slide03.jpg"/>
         </a>
        </div>
      </div>
      <div class="pagination"></div>
    </div>
    <!--singleAd-->
    <div style="left: 10px">
     <a href="${pageContext.request.contextPath}/clothes/findmain.do">
      <img src="../${pageContext.request.contextPath}/upload/sigleAd.jpg" >
     </a>
    </div>

     <!--bestShop-->
    <dl class="bestShop">
     <dt>
      <strong>优秀商家推荐</strong>
      <a href="${pageContext.request.contextPath}/clothes/clearsenior.do" class="fr">更多</a>
     </dt>
     <dd>
      <a href="${pageContext.request.contextPath}/clothes/findmain.do">
       <img src="${pageContext.request.contextPath}/upload/001.jpg"/>
       <h2>DM精品女装</h2>
      </a>
     </dd>
     <dd>
      <a href="${pageContext.request.contextPath}/clothes/findmain.do">
       <img src="${pageContext.request.contextPath}/upload/002.jpg"/>
       <h2>DM精品女装</h2>
      </a>
     </dd>
     <dd>
      <a href="${pageContext.request.contextPath}/clothes/findmain.do">
       <img src="${pageContext.request.contextPath}/upload/003.jpg"/>
       <h2>DM精品女装</h2>
      </a>
     </dd>
     <dd>
      <a href="${pageContext.request.contextPath}/clothes/findmain.do">
       <img src="${pageContext.request.contextPath}/upload/004.jpg"/>
       <h2>DM精品女装</h2>
      </a>
     </dd>
     <dd>
      <a href="${pageContext.request.contextPath}/clothes/findmain.do">
       <img src="${pageContext.request.contextPath}/upload/005.jpg"/>
       <h2>DM精品女装</h2>
      </a>
     </dd>
     <dd>
      <a href="${pageContext.request.contextPath}/clothes/findmain.do">
       <img src="${pageContext.request.contextPath}/upload/006.jpg"/>
       <h2>DM精品女装</h2>
      </a>
     </dd>
     <dd>
      <a href="${pageContext.request.contextPath}/clothes/findmain.do">
       <img src="${pageContext.request.contextPath}/upload/007.jpg"/>
       <h2>DM精品女装</h2>
      </a>
     </dd>
     <dd>
      <a href="${pageContext.request.contextPath}/clothes/findmain.do">
       <img src="${pageContext.request.contextPath}/upload/008.jpg"/>
       <h2>DM精品女装</h2>
      </a>
     </dd>
    </dl>
 </div>
 <!--asdCont-->
 <div class="IdxAsideRt">
  <!--login-->

  <div class="idxRtLogin">

   <div class="fstArea">
     <a href="${pageContext.request.contextPath}/pages/user.jsp" class="userIcon">
      <img src="${pageContext.request.contextPath}/images/icon/DefaultAvatar.jpg">
     </a>
     <div class="rtInfor">
      <p>Hi!你好</p>
      <p class="obviousText">免费入驻，提升品牌效应！</p>
     </div>
    </div>

    <div class="secArea">
        <%if (user==null){%>
     <a href="login.jsp">登录</a>
     <a href="register.jsp">免费注册</a>
     <a href="register.jsp">商户入驻</a>
        <%}else {%>
        <a href="${pageContext.request.contextPath}/onself/findcollect.do">收藏</a>
        <a href="${pageContext.request.contextPath}/clothes/findCart.do">购物车</a>
        <a href="${pageContext.request.contextPath}/onself/findaccount.do">我的余额</a>
        <%}%>
    </div>

   </div>
   <dl class="idxRtAtc">
    <dt>
     <em class="obviousText">最新公告</em>
     <a href="article_list.jsp">more</a>
    </dt>
    <dd><a href="article_read.jsp">2015年12月20日系统升级通告统升级通告</a></dd>
    <dd><a href="article_read.jsp">2015年12月20日系统升级通告</a></dd>
    <dd><a href="article_read.jsp">2015年12月20日系统升级通告</a></dd>
    <dd><a href="article_read.jsp">2015年12月20日系统升级通告</a></dd>
    <dd><a href="article_read.jsp">2015年12月20日系统升级通告</a></dd>
   </dl>
   <dl class="idxRtAtc">
    <dt>
     <em>质量标准技术参数</em>
     <a href="article_list.jsp">more</a>
    </dt>
    <dd><a href="article_read.jsp">2015年12月20日系统升级通告统升级通告</a></dd>
    <dd><a href="article_read.jsp">2015年12月20日系统升级通告</a></dd>
   </dl>
  </div>
</section>
<!--productList-->
<section class="wrap idxproLi">
 <h2>
  <strong>
   <a href="${pageContext.request.contextPath}/clothes/findmaninfo.do?name=2019女装新款 夏季时尚开衫 爆款">女装展示区</a>
  </strong>
  <span class="classLi">
   <a href="${pageContext.request.contextPath}/clothes/findmain.do">夏装</a>
   <a href="${pageContext.request.contextPath}/clothes/findmain.do">连衣裙</a>
   <a href="${pageContext.request.contextPath}/clothes/findmain.do">开衫</a>
   <a href="${pageContext.request.contextPath}/clothes/findmain.do">牛仔裤</a>
   <a href="${pageContext.request.contextPath}/clothes/findmain.do">背带裤</a>
   <a href="${pageContext.request.contextPath}/clothes/findmain.do">T恤</a>
  </span>
 </h2>
 <div class="ltArea" id="nvzhuang">
  <!--ad:category pic-->
   <a href="${pageContext.request.contextPath}/clothes/findmain.do"><img src="${pageContext.request.contextPath}/upload/bestCategoryPic01.jpg"/></a>
 </div>
 <div class="ctLi">
  <ul>
  <c:forEach var="woman" items="${woman}">
   <li>
    <a href="${pageContext.request.contextPath}/clothes/findmaninfo.do?type=0&&name=${woman.clothesname}">
     <img src="http://q28msmys0.bkt.clouddn.com/${woman.images}"/>
     <h3>${woman.clothesname}</h3>
     <p><span>${woman.price}</span></p>
    </a>
   </li>
  </c:forEach>
  </ul>
  <!--bestBrand-->
  <div class="idxBrandLi">
   <a href="${pageContext.request.contextPath}/clothes/brandshop.do?brand=Anorina"><img src="${pageContext.request.contextPath}/upload/brandLogo01.jpg"/></a>
   <a href="${pageContext.request.contextPath}/clothes/brandshop.do?brand=777"><img src="${pageContext.request.contextPath}/upload/brandLogo02.jpg"/></a>
   <a href="${pageContext.request.contextPath}/clothes/brandshop.do?brand=Agent"><img src="${pageContext.request.contextPath}/upload/brandLogo03.jpg"/></a>
   <a href="${pageContext.request.contextPath}/clothes/brandshop.do?brand=MQUEEN"><img src="${pageContext.request.contextPath}/upload/brandLogo04.jpg"/></a>
  </div>
 </div>
</section>

<section class="wrap idxproLi">
 <h2>
  <strong>
   <a href="${pageContext.request.contextPath}/clothes/findmaninfo.do?name=2019男7">男装展示区</a>
  </strong>
  <span class="classLi">
   <a href="${pageContext.request.contextPath}/clothes/findmain.do">夏装</a>
   <a href="${pageContext.request.contextPath}/clothes/findmain.do">连衣裙</a>
   <a href="${pageContext.request.contextPath}/clothes/findmain.do">开衫</a>
   <a href="${pageContext.request.contextPath}/clothes/findmain.do">牛仔裤</a>
   <a href="${pageContext.request.contextPath}/clothes/findmain.do">背带裤</a>
   <a href="${pageContext.request.contextPath}/clothes/findmain.do">T恤</a>
  </span>
 </h2>
 <div class="ltArea" id="nanzhuang">
  <!--ad:category pic-->
   <a href="${pageContext.request.contextPath}/clothes/findmain.do"><img src="${pageContext.request.contextPath}/upload/bestCategoryPic02.jpg"/></a>
 </div>
 <div class="ctLi">
  <ul>
   <c:forEach var="man" items="${man}">
    <li>
     <a href="${pageContext.request.contextPath}/clothes/findmaninfo.do?type=1&&name=${man.clothesname}">
      <img src="http://q28msmys0.bkt.clouddn.com/${man.images}"/>
      <h3>${man.clothesname}</h3>
      <p><span>${man.price}</span></p>
     </a>
    </li>
   </c:forEach>
  </ul>
  <!--bestBrand-->
  <div class="idxBrandLi">
   <a href="${pageContext.request.contextPath}/clothes/brandshop.do?brand=Anorina"><img src="${pageContext.request.contextPath}/upload/brandLogo01.jpg"/></a>
   <a href="${pageContext.request.contextPath}/clothes/brandshop.do?brand=777"><img src="${pageContext.request.contextPath}/upload/brandLogo02.jpg"/></a>
   <a href="${pageContext.request.contextPath}/clothes/brandshop.do?brand=Agent"><img src="${pageContext.request.contextPath}/upload/brandLogo03.jpg"/></a>
   <a href="${pageContext.request.contextPath}/clothes/brandshop.do?brand=MQUEEN"><img src="${pageContext.request.contextPath}/upload/brandLogo04.jpg"/></a>
  </div>
 </div>
</section>
<!--case-->
<section class="wrap idexCase">
 <h2>
  <strong>工程案例</strong>
  <a href="#">more</a>
 </h2>
 <ul>
  <li>
   <a href="#">
    <img src="${pageContext.request.contextPath}/upload/case001.jpg"/>
    <h3>时尚搭配案例</h3>
   </a>
  </li>
  <li>
   <a href="#">
    <img src="${pageContext.request.contextPath}/upload/case002.jpg"/>
    <h3>时尚搭配案例</h3>
   </a>
  </li>
  <li>
   <a href="#">
    <img src="${pageContext.request.contextPath}/upload/case003.jpg"/>
    <h3>时尚搭配案例</h3>
   </a>
  </li>
  <li>
   <a href="#">
    <img src="${pageContext.request.contextPath}/upload/case004.jpg"/>
    <h3>时尚搭配案例</h3>
   </a>
  </li>
  <li>
   <a href="#">
    <img src="${pageContext.request.contextPath}/upload/case005.jpg"/>
    <h3>时尚搭配案例</h3>
   </a>
  </li>
 </ul>
</section>
<!--section:two->articleList-->
<section class="wrap idxArticle">
  <dl>
   <dt>
    <strong>招标资讯</strong>
    <a href="article_list.jsp">more</a>
   </dt>
   <dd><a href="article_read.jsp">内蒙古君联生物发展有限公司阿巴嘎旗流化床锅炉除尘及链条炉排炉内脱硫设施采购项目公开招标招标公告</a></dd>
   <dd><a href="article_read.jsp">四川省老年大学教学用具及设备采购二标段公开招标采购公告</a></dd>
   <dd><a href="article_read.jsp">慢道峰山桥至仙境源风机路、曲径通幽至老虎洞至孙家至王沟服务区亮化工程公开招标公告</a></dd>
   <dd><a href="article_read.jsp">四川省资阳市安岳县民政局第二次全国地名普查外包服务采购项目公开招标采购公告</a></dd>
   <dd><a href="article_read.jsp">内蒙古君联生物发展有限公司阿巴嘎旗流化床锅炉除尘及链条炉排炉内脱硫设施采购项目公开招标招标公告</a></dd>
  </dl>
  <dl style="margin:0 2.5%">
   <dt>
    <strong>最新询价信息</strong>
    <a href="article_list.jsp">more</a>
   </dt>
   <dd><a href="article_read.jsp">内蒙古君联生物发展有限公司阿巴嘎旗流化床锅炉除尘及链条炉排炉内脱硫设施采购项目公开招标招标公告</a></dd>
   <dd><a href="article_read.jsp">四川省老年大学教学用具及设备采购二标段公开招标采购公告</a></dd>
   <dd><a href="article_read.jsp">慢道峰山桥至仙境源风机路、曲径通幽至老虎洞至孙家至王沟服务区亮化工程公开招标公告</a></dd>
   <dd><a href="article_read.jsp">四川省资阳市安岳县民政局第二次全国地名普查外包服务采购项目公开招标采购公告</a></dd>
   <dd><a href="article_read.jsp">内蒙古君联生物发展有限公司阿巴嘎旗流化床锅炉除尘及链条炉排炉内脱硫设施采购项目公开招标招标公告</a></dd>
  </dl>
  <dl>
   <dt>
    <strong>行业资讯</strong>
    <a href="article_list.jsp">more</a>
   </dt>
   <dd><a href="article_read.jsp">内蒙古君联生物发展有限公司阿巴嘎旗流化床锅炉除尘及链条炉排炉内脱硫设施采购项目公开招标招标公告</a></dd>
   <dd><a href="article_read.jsp">四川省老年大学教学用具及设备采购二标段公开招标采购公告</a></dd>
   <dd><a href="article_read.jsp">慢道峰山桥至仙境源风机路、曲径通幽至老虎洞至孙家至王沟服务区亮化工程公开招标公告</a></dd>
   <dd><a href="article_read.jsp">四川省资阳市安岳县民政局第二次全国地名普查外包服务采购项目公开招标采购公告</a></dd>
   <dd><a href="article_read.jsp">内蒙古君联生物发展有限公司阿巴嘎旗流化床锅炉除尘及链条炉排炉内脱硫设施采购项目公开招标招标公告</a></dd>
  </dl>
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
