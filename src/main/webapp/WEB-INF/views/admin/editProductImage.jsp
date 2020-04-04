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
                        <small> - ${product.name} - 图片管理</small>
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
                <div class="col-md-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            产品图片编辑
                        </div>
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>产品Id</th>
                                    <th>产品图片id</th>
                                    <th>图片预览</th>
                                    <th>修改图片</th>
                                    <th>删除图片</th>
                                </tr>
                                </thead>
                                <tbody>
                                <div class="alert alert-info">
                                    <srong>注意：</srong>
                                    默认第一张图为产品大图
                                </div>
                                <c:forEach items="${productImages}" var="pi">
                                    <tr>
                                        <td>${pi.product_id}</td>
                                        <td>${pi.id}</td>
                                        <td><img class="col-md-8"
                                                 src="../img/product/${pi.product_id}/${pi.id%5==0?5:pi.id%5}.jpg"
                                                 onerror="this.src='../img/product/error.png'"></td>
                                        <td class="col-md-5">
                                            <form action="updateProductImage" method="post"
                                                  enctype="multipart/form-data">
                                                <input type="hidden" name="id" value="${pi.id}">
                                                <input type="hidden" name="product_id"
                                                       value="${pi.product_id}">
                                                <input type="file" name="picture" class="pull-left">
                                                <input type="submit" class="btn btn-primary pull-right" value="上传">
                                            </form>
                                        </td>
                                        <td>
                                            <a href="deleteProductImage?product_id=${pi.product_id}&id=${pi.id}"><span
                                                    class="glyphicon glyphicon-trash"></span></a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
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
