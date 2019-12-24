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
<title>发布/编辑/更新-用户中心</title>
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
 
<section class="wrap user_center_wrap">
 <!--左侧导航-->
  <aside class="user_aside_nav">
  <dl>
   <dt>买家中心</dt>
   <dd><a href="${pageContext.request.contextPath}/order/clearorderfind.do">我的订单</a></dd>
   <dd><a href="${pageContext.request.contextPath}/order/findInquiry.do">我的询价单</a></dd>
   <dd><a href="${pageContext.request.contextPath}/onself/findcollect.do">我的收藏</a></dd>
   <dd><a href="${pageContext.request.contextPath}/order/findaddress.do">我的地址库</a></dd>
  </dl>
  <dl>
   <dt>商家管理中心</dt>
   <dd><a href="authenticate.jsp">我要开店</a></dd>
   <dd><a href="setting.jsp">店铺设置</a></dd>
   <dd><a href="seller_product_list.jsp">商品列表</a></dd>
   <dd><a href="seller_order_list.jsp">订单列表</a></dd>
   <dd><a href="offer_list.jsp">询价单</a></dd>
  </dl>
  <dl>
   <dt>控制面板</dt>
   <dd><a href="message.jsp">站内短消息</a></dd>
   <dd><a href="${pageContext.request.contextPath}/onself/findaccount.do">资金管理</a></dd>
   <dd><a href="profile.jsp">个人资料</a></dd>
   <dd><a href="${pageContext.request.contextPath}/pages/change_password.jsp">修改密码</a></dd>
  </dl>
 </aside>
 <!--右侧：内容区域-->
 <div class="user_rt_cont">
  <div class="top_title">
   <strong>发布/编辑/更新商品</strong>
  </div>
  <table class="order_table">
   <tr>
    <td width="90" align="right">产品分类选择：</td>
    <td>
    <select class="select">
     <optgroup label="材料专区">
      <option value ="分类A">分类A</option>
      <option value ="分类B">分类B</option>
     </optgroup>
     <optgroup label="设备专区">
      <option value ="分类A">分类A</option>
      <option value ="分类B">分类B</option>
     </optgroup>
    </select>
    </td>
   </tr>
   <tr>
    <td width="80" align="right">产品名称：</td>
    <td>
    <input type="text" class="textbox textbox_295" placeholder="输入产品名称"/>
    <mark class="tips_errors">这里是提示性或错误信息</mark>
    </td>
   </tr>
   <tr>
    <td width="80" align="right">产品货号：</td>
    <td>
    <input type="text" class="textbox" placeholder="输入产品唯一货号"/>
    <mark class="tips_errors">这里是提示性或错误信息</mark>
    </td>
   </tr>
   <tr>
    <td width="80" align="right">库存数量：</td>
    <td>
    <input type="text" class="textbox" placeholder="总库存数量"/>
    </td>
   </tr>
   <tr>
    <td width="80" align="right">市场售价：</td>
    <td>
    <input type="text" class="textbox" placeholder="0.00"/>
    <mark class="tips_errors">这里是提示性或错误信息</mark>
    </td>
   </tr>
   <tr>
    <td width="80" align="right">产品主图：</td>
    <td>
      <label class="uploadImg">
       <input type="file" style="display:none;"/>
       <span>上传图片</span>
      </label>
      <mark class="tips_errors">这里是提示性信息</mark>
    </td>
   </tr>
   <tr>
    <td width="80" align="right">相册图：</td>
    <td>
      <label class="uploadImg">
       <input type="file" style="display:none;"/>
       <span>上传图片</span>
      </label>
      <label class="uploadImg">
       <input type="file" style="display:none;"/>
       <span>上传图片</span>
      </label>
      <label class="uploadImg">
       <input type="file" style="display:none;"/>
       <span>上传图片</span>
      </label>
      <label class="uploadImg">
       <input type="file" style="display:none;"/>
       <span>上传图片</span>
      </label>
    </td>
   </tr>
   <tr>
    <td width="80" align="right">营业时间：</td>
    <td>
    <input type="text" class="textbox textbox_225"/>
    <mark class="tips_errors">这里是提示性或错误信息</mark>
    </td>
   </tr>
   <tr>
    <td width="80" align="right">联系方式：</td>
    <td>
    <input type="text" class="textbox textbox_225"/>
    <mark class="tips_errors">这里是提示性或错误信息</mark>
    </td>
   </tr>
   <tr>
    <td width="80" align="right">关于我们：</td>
    <td>
    <textarea placeholder="这里放置个文本编辑器可以编辑的...支持HTML输出的..." class="textarea" style="width:500px;height:100px;"></textarea>
    </td>
   </tr>
   <tr>
    <td width="80" align="right"></td>
    <td>
    <input type="button" value="更新保存" class="group_btn"/>
    </td>
   </tr>
  </table>
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
