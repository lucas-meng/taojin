<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>

<%-- 首页搜索栏和Tmall图标 --%>
<div class="header">
    <div class="headerLayout workArea">

        <%-- 图片logo --%>
        <div class="logo">
            <a href="${context}">
                <img src="img/logo.png">
            </a>
        </div>

        <%-- 搜索框 --%>
        <form class="mallSearch-input" action="/searchProduct">
            <input name="keyword" type="text" placeholder="搜索淘金网商品">
            <button type="submit" class="searchButton">搜索</button>
            <ul class="hot-query">
                <li>
                    <a href="searchProduct?keyword=帅气">帅气</a>
                </li>
                <li class="hot-query-li">
                    <a href="searchProduct?keyword=美丽">美丽</a>
                </li>
                <li class="hot-query-li">
                    <a href="searchProduct?keyword=专业">专业</a>
                </li>
                <li class="hot-query-li">
                    <a href="searchProduct?keyword=优秀">优秀</a>
                </li>
            </ul>
        </form>
    </div>
</div>

<div style="clear: both;"/>

<%-- 分类信息栏 --%>
<div class="main-nav">
    <div class="workArea">
        <!-- <span class="category-type">
            <span class="glyphicon glyphicon-th-list category-type-icon"></span>
            <span class="category-type-text">商品分类</span>
        </span> -->
        <span>
            <!-- <a href="">
                <img src="img/fore/tmall-shop.png">
            </a>
            <a href="">
                <img src="img/fore/tmall-international.png">
            </a> -->
            <c:forEach items="${links}" var="link">
                <a href="${link.link}">${link.text}</a>
            </c:forEach>
        </span>
    </div>
</div>