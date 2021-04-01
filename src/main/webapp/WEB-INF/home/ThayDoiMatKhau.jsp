<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.error{
	color:red !important;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.min.js"></script>
<body>
<script type="text/javascript">
	$(function(){
		$('#FormRegister').validate({
			rules : {
				matKhauOld : {
					required : true,
				},
				matKhauNew : {
					required : true,
				},
				matKhauAgain : {
					required : true,
					equalTo: "#matKhauNew"
				}
			},
			messages:{
				matKhauOld : "Vui lòng nhập mật khẩu cũ*",
				matKhauNew : "Vui lòng nhập mật khẩu mới *",
				matKhauAgain : {
					required: "Vui lòng xác nhận lại mật khẩu",
					equalTo: "Mật khẩu xác nhận không đúng"
				}
			}
		});
	})
</script>
<c:url var="urlDoiMatKhau" value="/home/doimatkhau-kh"/>
<c:url var="urlThongTin" value="/home/thongtincanhan"></c:url>
<c:url var="urlThayDoiMK" value="/home/thaydoimatkhau-kh"></c:url>
<c:url var="urlLichSu" value="/home/lichsumuahang"></c:url>
	<!-- Begin Li's Breadcrumb Area -->
	<div class="breadcrumb-area">
		<div class="container">
			<div class="breadcrumb-content">
				<ul>
					<li><a href="index.html">Home</a></li>
					<li class="active">Thanh toán</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Li's Breadcrumb Area End Here -->
	<!--Checkout Area Strat-->
	
	<input type="text" class="checkout-id" style="display: none;" value="${objKH.id }">
	<div class="checkout-area pt-60 pb-30">
		<div class="container">
			<div class="row">
				<!-- New Customer Start -->
				<div class="col-md-3">
					<div class="well mb-sm-30">
						<div class="new-customer">
							<p>Tài khoản của ${objKH.hoTen }</p>
							<label></label>
							<ul>
								<li class= "lithongtin" style="height: 36px;" ><i class="fa fa-user"
									style="font-size: 24px; color: silver; width: 30px"></i> &nbsp;
									<a class="menu"  href="${urlThongTin }">Thông tin tài khoản</a></li>
								<li class= "lithongtin" style="height: 37.5px;"><i class="fa fa-unlock-alt"
									style="font-size: 24px; color: silver; width: 30px"></i> &nbsp;
									<a class="menu" style=" color: blue !important" href="${urlThayDoiMK }">Thay đổi mật khẩu</a></li>
								<li class= "lithongtin" style="height: 31.5px;"><i
									class='fa fa-shopping-basket'
									style='font-size: 18px; color: silver; width: 36px'></i>&nbsp;
									<a class="menu" href="${urlLichSu }/${objKH.id }">Lịch sử mua hàng</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- New Customer End -->
				<!-- Returning Customer Start -->
				<div class="col-md-9">
					<div class="well">
						<div class="return-customer">
							<h6 class="mb-10 custom-title" style="font-size: 20px; color: #555555">Thông tin tài khoản</h6>
							<label style="height: 40px"></label>
							<s:form  method="post" id="FormRegister"
							 enctype="multipart/form-data" action="${urlDoiMatKhau }">
								<div class="row">
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Mật khẩu cũ<span class="required">*</span></label> 
										 <input type="password" class="form-control matKhauOld" placeholder="Nhập mật khẩu cũ" name="matKhauOld"/>
										 <span class="error"> ${mess} </span>
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Mật khẩu mới<span class="required">*</span></label> 
										 <input type="password" class="form-control matKhauNew" placeholder="Nhập mật khẩu mới" name="matKhauNew" id="matKhauNew"/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Xác nhận lại mật khẩu<span class="required">*</span></label> 
										 <input type="password" class="form-control matKhauAgain" placeholder="Nhập lại mật khẩu" name="matKhauAgain"/>
									</div>
								</div>
								</div>
								
								<div class="row">
									<div class="col-md-3"></div>
									<div class="col-md-3">
										<input type="submit" value="Cập nhật" class="btn btn-primary"
										class="return-customer-btn" >
									</div>
								</div>
								
							</s:form>
						</div>
					</div>
				</div>
				<!-- Returning Customer End -->
			</div>
			</div>
		</div>
</body>
</html>