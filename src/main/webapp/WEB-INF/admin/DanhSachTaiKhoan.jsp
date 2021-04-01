<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:url value="/admin/tk-xoa" var="urlXoa"></c:url>
<c:url value="/admin/captaikhoan" var="urlThemMoi"></c:url>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$('#chiTiet').click(function(){
			var a = $(this).data('value');
			window.location.href="captaikhoan/"+ a;
		});
	});
</script>
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
									<strong>Danh sách Tài khoản</strong>
								</h2>
							</div>
							<div class="body" style="padding: 10px">
								<a  class="btn btn-primary" style="float: right;" href="${urlThemMoi}"><i
									class="zmdi zmdi-hc-fw"></i>Thêm mới</a>
								<div class="table-responsive">
									<table
										class="table table-hover table-bordered js-basic-example dataTable ">
										<thead>
											<tr>
												<th>Id</th>
												<th>Username</th>
												<th>Họ tên</th>
												<th>Email</th>
												<th>VaiTro</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty lstTK}">
												<c:forEach var="tk" items="${lstTK}">
													<tr id="chiTiet" data-value="${tk.id}">
														<th scope="row">${tk.id}</th>
														<td>${tk.taiKhoan }</td>
														<td>${tk.hoTen }</td>
														<td>${tk.email }</td>
														<td>${tk.objVaiTro.tenVaiTro }</td>
														<td onclick='tdclick(event)'><a
															href="${urlXoa}/${tk.id}">Xóa</a></td>
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