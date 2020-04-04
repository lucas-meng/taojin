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
                        <small></small>
                    </h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            用户管理表
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>用户id</th>
                                        <th>用户名</th>
                                        <th>修改用户信息</th>
                                        <th>删除用户信息</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${users}" var="u">
                                        <tr>
                                            <td>${u.id}</td>
                                            <td>${u.name}</td>
                                            <td><a href="editUser?id=${u.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                                            <td><a href="deleteUser?id=${u.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>

			<%-- 用户增加表单 --%>
            <div class="row" id="divpx2" >
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            增加用户
                        </div>
                        <div class="panel-body">
                            <form action="insertUser" role="form" onsubmit="return check();">
                                <input type="hidden" name="id" value="">
                                <label>用户名：</label>
                                <input type="text" class="form-control" name="name" id="name" placeholder="请在这里输入账户">
                                <label>密码：</label>
                                <input type="text" class="form-control" name="password" id="password" placeholder="请在这里输入密码">
                                <label>确认密码：</label>
                                <input class="form-control" type="text" id="repassword" placeholder="请在这里重新输入密码"><br>
                                <div id="check_tip"></div><br>
                                <input type="submit" class="btn btn-success pull-right" value="添加" >
                                <input type="reset" value="清除" class="btn btn-default" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>
	

        </div>
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<script type="text/javascript">
  
            /* check_tip.innerHTML="<font color=red>两次输入的密码不相符</font>"; */
     function check(){
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
        	 check_tip.innerHTML="<font color=red>两次输入的密码不相符</font>";
         	 return false;
      	   }
			alert("添加成功");
			return true;
	
            	    
 }
  
  </script>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="../assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="../assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="../assets/js/dataTables/jquery.dataTables.js"></script>
<script src="../assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- Custom Js -->
<script src="../assets/js/custom-scripts.js"></script>


</body>
</html>
