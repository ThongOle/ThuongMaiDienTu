<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	$(document).ready(function() {
		$('.dropify').dropify({
			messages : {
				'default' : 'Click vào để thêm Ảnh đại diện',
				'replace' : 'Click để thay thế ảnh đại diện',
				'remove' : 'Loại bỏ',
				'error' : 'Ooops, có lỗi xảy ra'
			}
		});
	});
</script>
</head>
<c:url value="/admin/tk-themmoicapnhat" var="urlThemMoiCapNhat"></c:url>
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
								<strong>Cấp tài khoản</strong>
							</h2>
						</div>
						<div class="body">
							<s:form id="form_validation" method="POST"
								modelAttribute="taikhoan" action="${urlThemMoiCapNhat }" enctype="multipart/form-data">
								<div style="width: 20%; margin: auto;">
									<input type="file" class="dropify" name="fUpload" data-default-file="<c:url value="/images/${taikhoan.avatar }"/>">
								</div>
								<br>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-float">
											<s:input type="text" class="form-control" hidden="true"
												path="id" required="true"></s:input>
											<s:input type="text" class="form-control"
												placeholder="Họ Tên" path="hoTen" required="true"></s:input>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-float">
											<s:input type="email" class="form-control" path="email"
												placeholder="Email" required="true"></s:input>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-float">
											<s:input type="text" class="form-control"
												placeholder="Username" path="taiKhoan" required="true"></s:input>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-float">
											<s:input type="password" class="form-control" path="matKhau"
												placeholder="Mật Khẩu" required="true"></s:input>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<div class="radio inlineblock m-r-20">
												<s:radiobutton id="male" class="with-gap" path="gioiTinh"
													value="0" />
												<label for="male">Nam</label>

											</div>
											<div class="radio inlineblock">
												<s:radiobutton id="female" class="with-gap" path="gioiTinh"
													value="1" />
												<label for="female">Nữ</label>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-float">
											<s:select class="form-control" path="vaiTroId">
												<s:option value="0">-- Chọn Vai trò --</s:option>
												<s:options items="${lstVaiTro }" />
											</s:select>
										</div>
									</div>
								</div>
								<button class="btn btn-primary"
									type="submit">Xác nhận</button>
							</s:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>