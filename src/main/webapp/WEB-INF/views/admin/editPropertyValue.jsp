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
                        分类管理
                        <small> - ${category.name} - id:${propertyValueo.id} 属性值管理</small>
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
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            编辑属性值
                        </div>
                        <div class="panel-body">
                            <div class="row col-lg-12">
                                <form action="updatePropertyValue" role="form">
                                    <div class="form-group">
                                        <%-- 隐藏id属性，一并提交 --%>
                                        <input type="hidden" name="id" value="${propertyValue.id}">
                                        <input type="hidden" name="product_id" value="${product.id}">
                                        <input type="hidden" name="property_id" value="${propertyValue.property_id}">
                                        <label>属性值：</label>
                                        <input name="value" class="form-control" value="${propertyValue.value}"> <br/>
                                        <div class="pull-right">
                                            <input type="submit" class="btn btn-default">
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>

        </div>
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="../assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../assets/js/bootstrap.min.js"></script>
</body>
</html>
