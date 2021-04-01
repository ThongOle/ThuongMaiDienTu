<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<script type="text/javascript">
	$(document).ready(function(){
		$('#chiTietbody').on('click', '#chiTiet',function(){
			
			var a = $(this).data('value');
			window.location.href="chitietdonhang/"+ a;
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
									<strong>Danh sách Đơn hàng</strong>
								</h2>
							</div>
							<div class="body" style="padding: 10px">
								
								<div class="table-responsive">
									<table
										class="table table-hover table-bordered js-basic-example dataTable ">
										<thead>
											<tr>
												<th>Mã Đơn hàng</th>
												<th>Khách Hàng</th>
												<th>Hình Thức thanh toán</th>
												<th>Trạng thái</th>
												<th>Ngày mua</th>
											</tr>
										</thead>
										<tbody id ="chiTietbody">
											<c:if test="${not empty lstHoaDon}">
												<c:forEach var="hd" items="${lstHoaDon}">
													<tr id="chiTiet" data-value="${hd.id}">
														<th scope="row">${hd.id}</th>
														<td>${hd.tenKH }</td>
														<td>${hd.objHTTT.tenHinhThuc }</td>
														<td>${hd.objTinhTrang.tenTinhTrang }</td>
														<td><fmt:formatDate pattern="dd/MM/yyyy" value="${hd.ngayTao}" /></td>
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