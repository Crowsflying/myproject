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
<title>我的地址-用户中心</title>
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
     <li><a href="union_login.jsp">商城管理</a></li>
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
     <a href="#">产品配置中心</a>
    </li>
    <li>
     <a href="channel.jsp">产品商城</a>
    </li>
    <li>
     <a href="channel.jsp">材料商城</a>
    </li>
    <li>
     <a href="channel.jsp">设备商城</a>
    </li>
    <li>
     <a href="information.jsp">行业资讯</a>
    </li>
    <li>
     <a href="library.jsp">知识文库</a>
    </li>
    <li>
     <a href="#">绿色通道</a>
    </li>
    <li>
     <a href="#">特殊产品</a>
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
   <strong>我的地址列表</strong>
  </div>
  <table class="order_table">
   <tr>
    <td width="100" align="right">收件人：</td>
    <td><input type="text" placeholder="输入收件人姓名" class="textbox" id="addressname"/></td>
   </tr>
   <tr>
    <td width="100" align="right">联系电话：</td>
    <td><input type="text" placeholder="收件人手机号码" class="textbox" id="phone"/></td>
   </tr>
   <tr>
    <td width="100" align="right">收件地址：</td>
    <td>

     <select class="select" id="province">
      <option>宁波</option>
      <option>温州</option>
     </select>
     <select class="select" id="region">
      <option>江南</option>
      <option>鹿城</option>
     </select>
     <select class="select" id="number">
      <option>中软国际</option>
      <option>浙江工贸</option>
     </select>
    </td>
   </tr>

   <tr>
    <td width="100" align="right">详细地址：</td>
    <td><input type="text" placeholder="街道门牌号" class="textbox textbox_295"/></td>
   </tr>
   <tr>
    <td width="100" align="right"></td>
    <td><input type="button" value="添加地址" class="group_btn"/></td>
   </tr>
  </table>
  <table class="order_table address_tbl">
   <tr>
    <th width="140">收件人</th>
    <th width="140">联系电话</th>
    <th>收件地址</th>
    <th width="240">操作</th>
   </tr>
   <c:forEach var="address" items="${address}">
   <tr>
    <td style="width: 200px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${address.name}</td>
    <td width="240">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${address.phone}</td>
    <td>
     <address>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${address.address}
     </address>
    </td>
    <td>
     <label><input type="radio" name="moren"/>设为默认地址</label>
     <input type="button" value="编辑" class="btn"/>
     <a href="${pageContext.request.contextPath}/order/deleteaddress.do?addressid=${address.addressid}"> <input type="button" value="删除" class="btn"/></a>
    </td>
   </tr>
   </c:forEach>
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
<script type="text/javascript">
 $(".group_btn").on("click",function () {
     var province=$("#province option:selected").val();
     var region=$("#region option:selected").val();
     var number=$("#number option:selected").val();
     var oaddress=$(".textbox_295").val();
     var address=province+region+number+oaddress;
     var name=$("#addressname").val();
     var phone=$("#phone").val();
     if (name==""){
         alert("收件人不能为空");
         return
     }
     if (phone=="") {
         alert("手机号不能为空")
         return
     }
     if (oaddress==""){
         alert("详细地址不能为空");
         return
     }
     $.ajax({
         url:"${pageContext.request.contextPath}/order/insertaddress.do",
         type:"post",
         dataType:"json",
         async:true,
         data:{
             address:address,
             name:name,
             phone:phone
         },
         success:function () {
             alert("添加地址成功");
             window.location.href="${pageContext.request.contextPath}/order/findaddress.do"
         }
     })
 })

</script>
</html>
