<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="adminHeader.jsp"%>
<!-- /. NAV SIDE  -->
<div id="page-wrapper">
	<div id="page-inner">
		<div class="row">
			<div class="col-md-12">
				<h1 class="page-header">
					轮播图管理 <small> - - 图片管理</small>
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
					<div class="panel-heading">图片编辑</div>
					<div class="panel-body">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>图片id</th>
									<th>图片预览</th>
									<th>删除图片</th>
								</tr>
							</thead>
							<tbody>
								<div class="alert alert-info">
									<srong>注意：</srong>
									默认第一张图为产品大图
								</div>
								<form action="updateCarouselImg" method="post"
									enctype="multipart/form-data">
									<h5>上传文件：</h5>
									<input type="file" name="file" class="pull-left"> <input
										type="submit" class="btn btn-primary " value="上传"> <br />
									<br />
								</form>
								<c:forEach items="${carouselImages}" var="pi">
									<tr>
										<td class="col-md-1">${pi.carousel_id}</td>
										<td><img class="col-md-8"
											src="../img/product/${pi.carousel_imgs}"
											onerror="this.src='../img/product/error.png'"></td>
										<td class="col-md-1"><a
											href="CarouselDel?id=${pi.carousel_id}"><span
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
