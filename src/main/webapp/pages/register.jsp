<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8"/>
<title>注册</title>
<meta name="keywords"  content="DeathGhost"/>
<meta name="description" content="DeathGhost"/>
<meta name="author" content="DeathGhost,deathghost@deathghost.cn">
<link rel="icon" href="../images/icon/favicon.ico" type="image/x-icon">
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
     <li><a href="login.jsp" class="obviousText">亲，请登录</a></li>
    </ul>
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
 
<section class="wrap user_form">
 <div class="lt_img">
  <img src="../images/form_bg.jpg"/>
 </div>
 <div class="rt_form">
  <h2>会员注册</h2>
  <ul>
   <li class="user_icon">
    <input type="text" class="textbox" placeholder="账号" name="username" id="username"/>
   </li>
   </br>
   <li class="user_pwd">
    <input type="password" class="textbox" placeholder="密码" name="password" id="password"/>
   </li>
   <li class="link_li">
    <label><input type="checkbox"/><a>阅读注册协议</a></label>
    <a href="../pages/login.jsp" title="登录账号" class="fr">已有账号，立即登录？</a>
   </li>
   <li class="link_li">
    <input type="submit" value="立即注册" class="sbmt_btn"/>
   </li>
  </ul>
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
<script type="text/javascript">
    $(function () {
        $(".sbmt_btn").on("click",function () {
            var username=$("#username").val();
            var password=$("#password").val();
            if (username=="")
            {alert("账号不能为空");
                return
            }
            else if (password==""){
                alert("密码不能为空");
                return
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/clothes/register.do",
                type:"post",
                dataType:"json",
                data:{
                    username:username,
                    password:password
                },
                success:function () {
                        window.location.href="${pageContext.request.contextPath}/pages/login.jsp"
                }

            })
        })
    })
</script>
</html>
