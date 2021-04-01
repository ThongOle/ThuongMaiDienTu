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
$(function(){
	$('.btn-ctkh').click(function(e){
		e.preventDefault();
		window.location.href="${pageContext.request.contextPath}/admin/dskhachhang";
	})
})

</script>
<section class="content">
	<div class="body_scroll">
		<div class="block-header">
			<div class="row">
				<div class="col-lg-7 col-md-6 col-sm-12">
					<h2>Form Validation</h2>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html"><i
								class="zmdi zmdi-home"></i> Aero</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0);">Forms</a></li>
						<li class="breadcrumb-item active">Form Validation</li>
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
			<!-- Basic Validation -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="card">
						<div class="header">
							<h2>
								<strong>Thông tin hóa đơn</strong>
							</h2>
						</div>
						<div class="body">
							<form id="form_validation">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-float">
											<label>Mã khách hàng</label>
											<input type="text" class="form-control"
												 value="${objKH.id }">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-float">
										<label>Tên Khách hàng</label>
											<input type="text" class="form-control"
												value="${objKH.hoTen }">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-float">
											<label>Địa chỉ email</label>
											<input type="text" class="form-control"
												 value="${objKH.email }">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-float">
										<label>Điện thoại</label>
											<input type="text" class="form-control"
												value="${objKH.dienThoai }">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group form-float">
											<label>Địa chỉ nhận hàng</label>
											<input type="text" class="form-control"
												 value="${objKH.diaChi }, ${objKH.objXa.ten}, ${objKH.objHuyen.ten}, ${objKH.objTinh.ten}">
										</div>
									</div>
									
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-float">
											<label>Ngày Sinh</label>
											<input type="text" class="form-control"
												value="<fmt:formatDate pattern='dd/MM/yyyy' value='${objKH.ngaySinh}' />" >
										</div>
									</div>
									
								</div>
								
								<button class="btn btn-primary btn-ctkh"
									>Xác nhận</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>