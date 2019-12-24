<%@ page import="com.company.bean.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
 String path = request.getRequestURI();
 String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path;
%>
<base href="<%=basePath%>">
<head>
<meta charset="utf-8"/>
<title>产品详情</title>
<meta name="keywords"  content="DeathGhost" />
<meta name="description" content="DeathGhost" />
<meta name="author" content="DeathGhost,deathghost@deathghost.cn">
<link rel="icon" href="../images/icon/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="../css/style.css" /><script src="../js/html5.js"></script>
<script src="../js/jquery.js"></script>
<script src="../js/jquery.jqzoom.js"></script>
<script src="../js/base.js"></script>
<script>
$(document).ready(function(){
  $("nav .indexAsideNav").hide();
  $("nav .category").mouseover(function(){
	  $(".asideNav").slideDown();
	  });
  $("nav .asideNav").mouseleave(function(){
	  $(".asideNav").slideUp();
	  });
  //detail tab
  $(".product_detail_btm .item_tab a").click(function(){
	   var liindex = $(".product_detail_btm .item_tab a").index(this);
	   $(this).addClass("curr_li").parent().siblings().find("a").removeClass("curr_li");
       $(".cont_wrap").eq(liindex).fadeIn(150).siblings(".cont_wrap").hide();
	  });
  //radio
  $(".horizontal_attr label").click(function(){
	  $(this).addClass("isTrue").siblings().removeClass("isTrue");
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
 
 <!--导航指向-->
<aside class="wrap insideLink">
  <a href="${pageContext.request.contextPath}/clothes/findmain.do">首页</a>
  <a href="product_list.jsp">时尚女装</a>
</aside>
<section class="wrap product_detail">
 <!--img:left-->
 <div class="gallery">
  <div>
    <div id="preview" class="spec-preview"> <span class="jqzoom"><img jqimg="http://q28msmys0.bkt.clouddn.com/${maninfo.images}" src="http://q28msmys0.bkt.clouddn.com/${maninfo.images}" style="height: 422px;width: 422px"/></span> </div>
    <!--缩图开始-->
    <div class="spec-scroll"> <a class="prev">&lt;</a> <a class="next">&gt;</a>
     <input type="hidden" id="images" value="${maninfo.images}">
     <input type="hidden" id="price" value="${maninfo.price}">
      <div class="items">
        <ul>
          <li><img bimg="../upload/goods.jpg" src="../upload/goods.jpg" onmousemove="preview(this);"></li>
          <li><img bimg="../upload/goods.jpg" src="../upload/goods.jpg" onmousemove="preview(this);"></li>
          <li><img bimg="../upload/goods.jpg" src="../upload/goods.jpg" onmousemove="preview(this);"></li>
          <li><img bimg="../upload/goods.jpg" src="../upload/goods.jpg" onmousemove="preview(this);"></li>
          <li><img bimg="../upload/goods.jpg" src="../upload/goods.jpg" onmousemove="preview(this);"></li>
          <li><img bimg="../upload/goods.jpg" src="../upload/goods.jpg" onmousemove="preview(this);"></li>
          <li><img bimg="../upload/goods.jpg" src="../upload/goods.jpg" onmousemove="preview(this);"></li>
          <li><img bimg="../upload/goods.jpg" src="../upload/goods.jpg" onmousemove="preview(this);"></li>
          <li><img bimg="../upload/goods.jpg" src="../upload/goodssmall.jpg" onmousemove="preview(this);"></li>
          <li><img bimg="../upload/goods.jpg" src="../upload/goodssmall.jpg" onmousemove="preview(this);"></li>
          <li><img bimg="../upload/goods.jpg" src="../upload/goods.jpg" onmousemove="preview(this);"></li>
          <li><img bimg="../upload/goods.jpg" src="../upload/goodssmall.jpg" onmousemove="preview(this);"></li>
        </ul>
      </div>
    </div>
    <!--缩图结束-->
  </div>
 </div>
 <!--text:right-->
 <div class="rt_infor">
  <!--lt_infor-->
  <div class="goods_infor">
   <h2>${maninfo.clothesname}</h2>
   <ul>
    <li>
     <dl class="horizontal">
      <dt>价格：</dt>
      <dd><strong class="rmb_icon univalent">${maninfo.price}</strong>元</dd>
     </dl>
    </li>
    <li>
     <dl class="horizontal">
      <dt>上架时间：</dt>
      <dd><time>${maninfo.shelftime}</time></dd>
     </dl>
    </li>
    <li>
     <dl class="horizontal">
      <dt>品牌：</dt>
      <a href="${pageContext.request.contextPath}/clothes/brandshop.do?brand=${maninfo.brand}"><dd><em>${maninfo.brand}</em></a>
     </dl>
    </li>
    <li class="statistics">
     <dl class="vertical">
      <dt>月销量</dt>
      <dd>${maninfo.sales}</dd>
     </dl>
     <dl class="vertical">
      <dt>累计评论</dt>
      <dd>${maninfo.comment}</dd>
     </dl>
     <dl class="vertical">
      <dt>关注</dt>
      <dd>${maninfo.follow}</dd>
     </dl>
    </li>
    <li>
     <dl class="horizontal horizontal_attr">
      <dt>规格：</dt>
      <dd>
       <%--<label><input type="radio" name="guige"/>S码</label>--%>
       <%--<label><input type="radio" name="guige"/>M码</label>--%>
       <%--<label><input type="radio" name="guige"/>L码</label>--%>
       <%--<label><input type="radio" name="guige"/>XL码</label>--%>
       <%--<label><input type="radio" name="guige"/>XXL码</label>--%>
           <select class="select" id="province">
               <option>S码</option>
               <option>M码</option>
               <option>L码</option>
               <option>XL码</option>
               <option>XXL码</option>
           </select>
      </dd>
     </dl>
    </li>
    <li>
     <dl class="horizontal horizontal_attr">
      <dt>颜色：</dt>
      <dd>
       <%--<label><input type="radio" name="yanse"/>黑色</label>--%>
       <%--<label><input type="radio" name="yanse"/>蓝色</label>--%>
       <%--<label><input type="radio" name="yanse"/>白色</label>--%>
           <select class="select" id="province2">
               <option>黑色</option>
               <option>蓝色</option>
               <option>白色</option>
           </select>
      </dd>
     </dl>
    </li>
    </li>
    <li>
     <dl class="horizontal horizontal_attr">
      <dt>数量：</dt>
      <dd>
       <input type="hidden" value="${maninfo.clothesname}" class="goodname"/>
       <input type="button" value="-" class="jj_btn" onclick="numberreduce(this)"/>
       <input type="text" value="1" class="num" id="num"/>
       <input type="button" value="+" class="jj_btn" onclick="numberadd(this)"/>
       库存：<span>${maninfo.stock}</span>件
      </dd>
     </dl>
    </li>
    <li class="last_li">
     <input type="button" value="立即询价" class="buy_btn" onClick="alert('询价请求已推送至商家，请耐心等待！');"/>
     <input type="button" value="加入收藏" class="buy_btn" id="favorite"/>
     <input type="button" value="加入购物车" class="add_btn"/>
    </li>
   </ul>
  </div>
  <script type="text/javascript">
     $("#favorite").on("click",function () {
         var image=$("#images").val();
         var collectname=$(".goodname").val();
         var price=$("#price").val();
         $.ajax({
             url:"${pageContext.request.contextPath}/onself/insertcollect.do",
             type:"post",
             dataType:"json",
             async:true,
             data:{
                 image:image,
                 collectname:collectname,
                 price:price
             },
             success:function (data) {
                 if (data.result=="0") {
                     alert("收藏夹已有请去收藏夹查看")
                 }
                 else {
                     alert("成功加入收藏夹，可去购物车查看")
                 }

             }
         })
     })
      $(".num").on("change",function () {
          var nums=$(".num").val();
          var stock=parseInt($("dd span").text());
          if (nums>stock||nums<=0){
              alert("超出库存或者非法数值请重新输入!!!");
              document.getElementById("num").value=1;
              return
          }
      })
      function numberreduce(o) {
          if (parseInt($(o).next().val())<=1){
              return
          }
          $(o).next().val(parseInt($(o).next().val())-1);
      }
      function numberadd(o) {
          if (parseInt($(o).prev().val())>=${maninfo.stock}){
              alert("不能超出库存");
              document.getElementById("num").value=0;
          }
          $(o).prev().val(parseInt($(o).prev().val())+1);
      }
          $(".add_btn").on("click",function() {
              var goodname=$(".goodname").val();
              var nums=$(".num").val();
              var attribute=$("#province option:selected").val();
              var color =$("#province2 option:selected").val();
              $.ajax({
                  url:"${pageContext.request.contextPath}/clothes/buyCarts.do",
                  type:"post",
                  dataType:"json",
                  async:true,
                  data:{
                      goodname:goodname,
                      nums:nums,
                      attribute:attribute,
                      color:color
                  },
                  success:function (data) {
                      if (data.result=="0"){
                          alert("购物车库存超出，请修改数量后购买")
                      }
                      else {
                          alert("成功加入购物车，可去购物车查看")
                      }

                  }
              })

          })


  </script>
  <!--rt_infor-->
  <div class="shop_infor">
   <dl class="business_card">
    <dt>xx有限公司</dt>
    <dd>资质：生产商</dd>
    <dd>联系人：*先生（先生）</dd>
    <dd>邮件：******@Foxmail.com</dd>
    <dd>电话：4008-******</dd>
    <dd>所在地：陕西省西安市</dd>
    <dd>地址：陕西省西安市**区**街232号</dd>
    <dd class="center">
     <a href="shop.jsp" class="link_btn">进入店铺</a>
     <a class="link_btn">收藏店铺</a>
    </dd>
   </dl>
  </div>
 </div>
</section>
<!--detail-->
<section class="wrap product_detail_btm">
 <article>
  <ul class="item_tab">
   <li><a class="curr_li">商品详情</a></li>
   <li><a>商品评价（2893）</a></li>
   <li><a>成交记录（1892）</a></li>
  </ul>
  <!--商品详情-->
  <div class="cont_wrap active">
  <img src="../upload/goods005.jpg"/><br/>
   该商品参与了公益宝贝计划，卖家承诺每笔成交将为壹乐园计划捐赠0.02元。该商品已累积捐赠24560笔。
善款用途简介：基于游戏教育在儿童成长中的重要性，壹基金设立了“壹乐园计划”，帮助提供滑梯、攀爬架、跷跷板、秋千、乒乓球桌等，为灾后及贫困地区的孩子们搭建课<br/>
该商品参与了公益宝贝计划，卖家承诺每笔成交将为壹乐园计划捐赠0.02元。该商品已累积捐赠24560笔。
善款用途简介：基于游戏教育在儿童成长中的重要性，壹基金设立了“壹乐园计划”，帮助提供滑梯、攀爬架、跷跷板、秋千、乒乓
  </div>
  <!--商品评价-->
  <div class="cont_wrap">
   <table class="table">
    <tr>
     <td width="20%" align="center">李*锋</td>
     <td width="60%">这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦</td>
     <td width="20%" align="center"><time>2013-01-13 15:06</time></td>
    </tr>
    <tr>
     <td width="20%" align="center">彭**法</td>
     <td width="60%">这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦</td>
     <td width="20%" align="center"><time>2013-01-13 15:06</time></td>
    </tr>
    <tr>
     <td width="20%" align="center">代**彭</td>
     <td width="60%">这里是评论内容哦这里是评论内容哦这里是评论内容哦容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦这里是评论内容哦</td>
     <td width="20%" align="center"><time>2013-01-13 15:06</time></td>
    </tr>
   </table>
   <!--分页-->
   <div class="paging">
    <a>第一页</a>
    <a class="active">2</a>
    <a>3</a>
    <a>...</a>
    <a>89</a>
    <a>最后一页</a>
   </div>
  </div>
  <!--成交记录-->
  <div class="cont_wrap">
   <table class="table">
    <tr>
     <th>买家</th>
     <th>产品属性</th>
     <th>数量</th>
     <th>成交时间</th>
    </tr>
    <tr>
     <td align="center">李**强</td>
     <td>
      <p>颜色：黑色<p>
      <p>规格：M<p>
     </td>
     <td align="center"><b>1</b></td>
     <td align="center"><time>2013-01-13 15:25:39</time></td>
    </tr>
    <tr>
     <td align="center">李**强</td>
     <td>
      <p>颜色：黑色<p>
      <p>规格：L<p>
     </td>
     <td align="center"><b>1</b></td>
     <td align="center"><time>2013-01-13 15:25:39</time></td>
    </tr>
    <tr>
     <td align="center">葛**华</td>
     <td>
      <p>颜色：白色<p>
      <p>规格：XL<p>
     </td>
     <td align="center"><b>5</b></td>
     <td align="center"><time>2013-01-13 15:25:39</time></td>
    </tr>
   </table>
   <!--分页-->
   <div class="paging">
    <a>第一页</a>
    <a class="active">2</a>
    <a>3</a>
    <a>...</a>
    <a>89</a>
    <a>最后一页</a>
   </div>
  </div>
 </article>
 <aside>
  <dl class="aside_pro_list">
   <dt>
    <strong>精品推荐</strong>
    <a>更多</a>
   </dt>
 <c:forEach var="boutique" items="${boutique}">
   <dd>
    <a href="${pageContext.request.contextPath}/clothes/findmaninfo.do?name=${boutique.clothesname}" class="goods_img"><img src="http://q28msmys0.bkt.clouddn.com/${boutique.images}"/></a>
    <div class="rt_infor">
     <h3><a href="#">${boutique.clothesname}</a></h3>
     <p><del class="rmb_icon">${boutique.price}</del></p>
     <p><strong class="rmb_icon">${boutique.price}</strong></p>
    </div>
   </dd>
 </c:forEach>
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
