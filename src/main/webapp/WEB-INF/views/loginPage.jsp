<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>


<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp" %>

<style>
    .header {
        padding: 22px 0px;
        height: 88px;
        width: 1190px;
        margin: auto;
    }

    a {
        text-decoration: none;
    }

    .header .tm-logo {
        margin-top: 8px;
        width: 190px;
    }

    #mallPage, #mallPage.mallChn {
        width: auto;
        min-width: 990px;
        background-color: transparent;
    }
</style>
<div class="mallPage" id="mallPage">
    <div class="header">
        <a href="/home">
            <img src="/img/logo.png" class="tm-logo">
        </a>
    </div>
</div>


<style>
    .content {
        position: relative;
        width: 100%;
        margin-bottom: 40px;
    }

    .login-banner-wrap img {
        display: block;
        margin: auto;
    }

    .content .form {
        display: none;
        position: absolute;
        top: 91px;
        right: 60px;
        background: #fff;
    }

    .form-inner {
        padding: 25px 26px 20px;
        width: 350px;
        height: 404px;
    }

    .static-form {
        display: block;
        position: relative;
    }

    .login-title {
        height: 18px;
        line-height: 18px;
        font-size: 16px;
        color: #3c3c3c;
        margin-top: 19px;
        padding-bottom: 8px;
        font-weight: 700;
    }

    .field {
        margin-top: 25px;
        position: relative;
    }

    div.field {
        border: 1px solid #CBCBCB;
        margin: 20px 0px;
    }

    div.field span.loginInputIcon {
        margin: 0px;
        background-color: #CBCBCB;
        width: 40px;
        height: 40px;
        display: inline-block;
    }

    span.loginInputIcon span.glyphicon {
        font-size: 22px;
        position: relative;
        left: 9px;
        top: 9px;
        color: #606060;
    }

    div.field input {
        display: inline-block;
        border: 0px solid transparent;
        width: 244px;
        height: 30px;
        position: relative;
        left: 6px;
        top: 6px;
    }

    button.redButton {
        color: white;
        background-color: #FF0036;
        font-size: 16px;
        font-weight: 700;
        height: 42px;
        line-height: 42px;
        vertical-align: middle;
        width: 300px;
        border-radius: 3px;
        border: 0;
    }

    button.redButton:hover {
        background-color: rgba(255, 0, 54, .8);
    }
</style>
<script>
    $(function(){

        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.loginErrorMessageDiv").show();
        </c:if>

        $("form.loginForm").submit(function(){
            if(0==$("#name").val().length||0==$("#password").val().length){
                $("span.errorMessage").html("请输入账号密码");
                $("div.loginErrorMessageDiv").show();
                return false;
            }
            if(0==$("#codeYzm").val().length){
                $("span.errorMessage").html("请输入验证码");
                $("div.loginErrorMessageDiv").show();
                return false;
            }
            return true;
        });

        $("form.loginForm input").keyup(function(){
            $("div.loginErrorMessageDiv").hide();
        });
        changeimg();
    })
    function changeimg(){
                var img=document.getElementById("img1");
                //防止页面缓存
                img.src="getVerifyCodeImage"+ "?r="+Math.random();
            }
</script>
<div class="content">
    <div class="login-banner-wrap" style="width: 100%; background-color: rgb(223, 226, 231);" title="">
        <div class="inner">
            <img src="/img/fore/loginPage-background1.jpg">
        </div>
    </div>

    <div class="form" style="display: block; right: 176.5px;">
        <div class="form-inner">
            <div class="static-form">
                <div class="loginErrorMessageDiv" style="display: none;">
                    <div class="alert alert-danger" >
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                        <span class="errorMessage"></span>
                    </div>
                </div>
                <div class="login-title">淘金网登录</div>
                <form action="/login" class="loginForm" method="post">
                    <div class="field">
                        <span class="loginInputIcon">
					        <span class=" glyphicon glyphicon-user"></span>
				        </span>
                        <input id="name" name="name" placeholder="邮箱" type="text">
                    </div>
                    <div class="field">
                        <span class="loginInputIcon ">
                            <span class=" glyphicon glyphicon-lock"></span>
                        </span>
                        <input id="password" name="password" type="password" placeholder="密码" type="text">
                    </div>
                    <div class="field">
                        <span class="loginInputIcon ">
                            <span class=" glyphicon glyphicon-lock"></span>
                        </span>
                        <input id="codeYzm" name="codeYzm" type="text" placeholder="验证码" type="text">
                    </div>
                    <div class="field">
                        <span class="loginInputIcon ">
                            <span class=" glyphicon glyphicon-lock"></span>
                        </span>
                        <img id="img1" title="点击获取新验证码" src="/verifycode/getVerifyCodeImage.do" onclick="changeimg()" width="240" height="30" alt="" style="display:inline-block;">
                    </div>
                    
                    <div style="margin-top:10px">
                        <button class="redButton" type="submit">登 录</button>
                    </div>

                    <div style="margin-top: 20px;">
                        <!-- <a class="notImplementLink" href="#nowhere">忘记登录密码</a> -->
                        <a href="registerPage" class="pull-right">免费注册</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<%@include file="include/footer.jsp" %>