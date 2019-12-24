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
    <title>Bootstrap Admin</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    
    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

    <script src="lib/jquery-1.7.2.min.js" type="text/javascript"></script>

    <!-- Demo page code -->

    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="lib/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
  <body class=""> 
  <!--<![endif]-->
    
    <div class="navbar">
        <div class="navbar-inner">
                <ul class="nav pull-right">
                    
                    <li><a href="#" class="hidden-phone visible-tablet visible-desktop" role="button">Settings</a></li>
                    <li id="fat-menu" class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i> Jack Smith
                            <i class="icon-caret-down"></i>
                        </a>

                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#">My Account</a></li>
                            <li class="divider"></li>
                            <li><a tabindex="-1" class="visible-phone" href="#">Settings</a></li>
                            <li class="divider visible-phone"></li>
                            <li><a tabindex="-1" href="${pageContext.request.contextPath}/clothes/logout.do">Logout</a></li>
                        </ul>
                    </li>
                    
                </ul>
                <a class="brand" href="${pageContext.request.contextPath}/user/findpage.do"><span class="first">Your</span> <span class="second">Company</span></a>
        </div>
    </div>
    


    
    <div class="sidebar-nav">
        <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>Dashboard</a>
        <ul id="dashboard-menu" class="nav nav-list collapse in">
            <li><a href="${pageContext.request.contextPath}/user/findpage.do">Home</a></li>
            <li ><a href="${pageContext.request.contextPath}/user/findall.do">Sample List</a></li>
            <li ><a href="${pageContext.request.contextPath}/pages/employee.jsp">Sample Item</a></li>
            <li class="active"><a href="media.jsp">Media</a></li>
            <li ><a href="calendar.jsp">Calendar</a></li>
            
        </ul>

        <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>Account<span class="label label-info">+3</span></a>
        <ul id="accounts-menu" class="nav nav-list collapse">
            <li ><a href="${pageContext.request.contextPath}/pages/sign-in.jsp">Sign In</a></li>
            <li ><a href="${pageContext.request.contextPath}/pages/sign-up.jsp">Sign Up</a></li>
            <li ><a href="pages/reset-password.jsp">Reset Password</a></li>
        </ul>

        <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>Error Pages <i class="icon-chevron-up"></i></a>
        <ul id="error-menu" class="nav nav-list collapse">
            <li ><a href="403.jsp">403 page</a></li>
            <li ><a href="404.jsp">404 page</a></li>
            <li ><a href="500.jsp">500 page</a></li>
            <li ><a href="503.jsp">503 page</a></li>
        </ul>

        <a href="#legal-menu" class="nav-header" data-toggle="collapse"><i class="icon-legal"></i>Legal</a>
        <ul id="legal-menu" class="nav nav-list collapse">
            <li ><a href="privacy-policy.jsp">Privacy Policy</a></li>
            <li ><a href="terms-and-conditions.jsp">Terms and Conditions</a></li>
        </ul>

        <a href="help.jsp" class="nav-header" ><i class="icon-question-sign"></i>Help</a>
        <a href="faq.jsp" class="nav-header" ><i class="icon-comment"></i>Faq</a>
    </div>
    

    
    <div class="content">
        
        <div class="header">
            <div class="stats">
    <p class="stat"><span class="number">10</span>Users</p>
    <p class="stat"><span class="number">19</span>Events</p>
    <p class="stat"><span class="number">12</span>Calendars</p>
</div>

            <h1 class="page-title">Calendar</h1>
        </div>
        
                <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/clothes/findmain.do">Home</a> <span class="divider">/</span></li>
            <li class="active">Calendar</li>
        </ul>

        <div class="container-fluid">
            <div class="row-fluid">
                    


<link rel='stylesheet' type='text/css' href='lib/fullcalendar-1.5.3/fullcalendar/fullcalendar.css' />
<link rel='stylesheet' type='text/css' href='lib/fullcalendar-1.5.3/fullcalendar/fullcalendar.print.css' media='print' />
<script type='text/javascript' src='lib/fullcalendar-1.5.3/fullcalendar/fullcalendar.min.js'></script>

<script type='text/javascript'>

	$(document).ready(function() {

		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();

		$('#calendar').fullCalendar({
            header: false,
		});
        $('#calendar').fullCalendar('next');

	});

</script>
<style type='text/css'>

	#calendar {
		width: 100%;
		margin: 0 auto;
		}

</style>



<div style="float:right; margin-top: 1em;">
    <a href="#" class="btn btn-primary">Add</a>
    <a href="#" class="btn btn-danger">Remove</a>
    <a href="#" class="btn btn-info">Info</a>
    <a href="#" class="btn btn-success">Success</a>
    <a href="#" class="btn btn-warning">Warning</a>
</div>
<h2>Upcoming Events</h2>
<div id='calendar'></div>


                    
                    <footer>
                        <hr>

                        <!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
                        <p class="pull-right">A <a href="http://www.portnine.com/bootstrap-themes" target="_blank">Free Bootstrap Theme</a> by <a href="http://h2design.taobao.com/" title="Դ��֮��" target="_blank">Դ��֮��</a></p>

                        <p>&copy; 2012 <a href="http://h2design.taobao.com/" title="Դ��֮��" target="_blank">Դ��֮��</a></p>
                    </footer>
                    
            </div>
        </div>
    </div>
    


    <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
    
  </body>
</html>


