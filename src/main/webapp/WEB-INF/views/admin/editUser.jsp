<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="adminHeader.jsp" %>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        用户管理
                        <small> - id:${user.id} 修改密码</small>
                    </h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <a href="javascript:history.back()" class="btn btn-success">返回上一页</a>
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col-md-6">
                    <!-- Advanced Tables -->
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            修改用户信息
                        </div>
                        <div class="panel-body">
                            <form action="updateUser" role="form" onsubmit="return upcheck();">
                                <input type="hidden" name="id" value="${user.id}">
                                <label>用户名：</label>
                                <input class="form-control" type="text" name="name" id="name" value="${user.name}" placeholder="请在这里重新输入用户名"><br>
                                <label>密码：</label>
                                <input class="form-control" type="text" name="password" id="password" placeholder="请在这里输入新密码"><br>   
                                <%-- <input type="hidden" id="hipassword" value="${user.password}"> --%>
                                <label>确认密码：</label>
                                <input class="form-control" type="text" id="repassword" id="password" placeholder="请在这里重新输入密码"><br>      
                                <div id="check_tip"></div><br>
                                <input type="submit" class="btn btn-success pull-right" value="确认修改">
                                <input type="reset" value="清除" class="btn btn-success" />
                            </form>

                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>

        </div>
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<script type="text/javascript">
	/* check_tip.innerHTML="<font color=red>两次输入的密码不相符</font>"; */
	function upcheck(){
		  var name = document.getElementById("name").value;
	      var password = document.getElementById("password").value;
	      var repassword = document.getElementById("repassword").value;
	     if(name == ''){
	   	  	check_tip.innerHTML="<font color=red>用户名不能为空</font>";
	       	return false;
	      }
	     if(password == '' || repassword == ''){
	   	 	 check_tip.innerHTML="<font color=red>密码不能为空</font>";
	       		return false;
	       }
	     if(password != repassword) {
	   	 		check_tip.innerHTML="<font color=red>密码输入不一致</font>";
	    	 	return false;
	 	}
			alert("修改成功");
			return true;
		
	       	    
	}
</script>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="../assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../assets/js/bootstrap.min.js"></script>
</body>
</html>
