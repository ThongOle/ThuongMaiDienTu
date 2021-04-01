<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông chó</title>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$('.chiTietSanPham').click(function(){
			var a = $(this).data('value');
			window.location.href="sanphamadd2/"+ a;
		})
	});
</script>
<c:url value="/admin/xoasanpham" var="urlXoa"></c:url>
<c:url value="/admin/sanphamadd" var="urlThemMoi"></c:url>
	<section class="content">
		<div class="body_scroll">
			<div class="block-header">
				<div class="row">
					<div class="col-lg-7 col-md-6 col-sm-12">
						<h2>Normal Tables</h2>
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html"><i
									class="zmdi zmdi-home"></i> Aero</a></li>
							<li class="breadcrumb-item"><a href="javascript:void(0);">Tables</a></li>
							<li class="breadcrumb-item active">Normal Tables</li>
						</ul>
						<button class="btn btn-primary btn-icon mobile_menu" type="button">
							<i class="zmdi zmdi-sort-amount-desc"></i>
						</button>
					</div>
					<div class="col-lg-5 col-md-6 col-sm-12">
						<button
							class="btn btn-primary btn-icon float-right right_icon_toggle_btn"
							type="button">
							<i class="zmdi zmdi-arrow-right"></i>
						</button>
					</div>
				</div>
			</div>

			<div class="container-fluid">
				<div class="row clearfix">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="card">
							<div class="header">
								<h2>
									<strong>Danh sách sản phẩm</strong> 
								</h2>
							</div>
							<div class="body" style="padding: 10px">
							<a class="btn btn-primary" style="float: right;" href="${urlThemMoi }"><i class="zmdi zmdi-hc-fw"></i>Thêm mới</a>
								<div class="table-responsive">
									<table class="table table-hover table-bordered js-basic-example dataTable ">
										<thead>
											<tr>
												<th>Id Sản phẩm</th>
												<th>Tên Sản phẩm</th>
												<th>Giá tiền</th>
												<th>Danh mục</th>
												<th>Hãng Sản xuất</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty lstSP}">
												<c:forEach var="sp" items="${lstSP}">
													<tr class="chiTietSanPham" data-value ="${sp.id}">
														<th scope="row">${sp.id}</th>
														<td>${sp.tenSanPham }</td>
														<td>${sp.giaTien }</td>
														<td>${sp.objDanhMuc.tenDanhMuc }</td>
														<td>${sp.objHangSanXuat.tenHangSX }</td>
														<td><a href="${urlXoa}/${sp.id}">Xóa</a></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- #END# Hover Rows -->
			</div>
		</div>
	</section>
</body>
</html>