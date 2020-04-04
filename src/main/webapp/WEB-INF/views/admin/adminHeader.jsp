<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<% 	String[] files = request.getServletPath().split("/admin/");
	String f = files[1];
%>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>淘金网-后台</title>
    <!-- Bootstrap Styles-->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->

    <!-- Custom Styles-->
    <link href="../assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- TABLE STYLES-->
    <link href="../assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <script type="text/javascript">
    	${msg }
    </script>
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only"> To make money is TaoJin</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="listCategory">TaoJin</a>
        </div>
    </nav>

    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                
                    <a class="<% if(f.equals("listCategory.jsp")){out.print("active-menu");} %>" href="listCategory"><i class="fa fa-bars"></i> 分类管理</a>
                </li>
                <li>
                    <a class="<% if(f.equals("listUser.jsp")){out.print("active-menu");} %>" href="listUser"><i class="fa fa-user"></i> 用户管理</a>
                </li>
                <li>
                    <a class="<% if(f.equals("listOrder.jsp")){out.print("active-menu");} %>" href="listOrder"><i class="fa fa-list-alt"></i> 订单管理</a>
                </li>
                <li>
                    <a class="<% if(f.equals("CarouselImg.jsp")){out.print("active-menu");} %>" href="CarouselImg"><i class="fa fa-link"></i> 轮播图管理</a>
                </li>
                <li>
                    <a class="<% if(f.equals("listLink.jsp")){out.print("active-menu");} %>" href="listLink"><i class="fa fa-link"></i> 推荐链接管理</a>
                </li>

                <li>
                    <a href="adminExit"><i class="fa fa-link"></i> 退出系统</a>
                </li>
                
            </ul>
        </div>

    </nav>