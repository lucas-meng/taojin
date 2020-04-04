<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/3 0003
  Time: 上午 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="js/DD_belatedPNG_0.0.8a-min.js"></script>
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
</head>
<body>
<script language="javascript" type="text/javascript">
        function changeimg(){
                var img=document.getElementById("img1");
                //防止页面缓存
                img.src="getVerifyCodeImage"+ "?r="+Math.random();
            }
</script>
<form action="" method="post">
        <img id="img1" title="点击获取新验证码" src="/verifycode/getVerifyCodeImage.do" onclick="changeimg()" width="62" height="28" alt="" style="display:inline-block;">
 </form>
</body>
</html>


