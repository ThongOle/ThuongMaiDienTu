<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	 .menu{
		color: #555555 !important;
	}
	
	.lithongtin:hover{
		background: #EEEEEE !important;
		color: blue !important;
	}
	
	
	.lbl{
	position: absolute; 
	bottom: 0;
	}
	
	
</style>
</head>
<body>
<c:url var="urlUpdate" value="/home/capnhat-taikhoan"/>
<c:url var="urlThongTin" value="/home/thongtincanhan"></c:url>
<c:url var="urlThayDoiMK" value="/home/thaydoimatkhau-kh"></c:url>
<c:url var="urlLichSu" value="/home/lichsumuahang"></c:url>
<script type="text/javascript">
$(function(){
	var khachhangtinhId = $('.khachhang-tinhId').val();
	console.log (khachhangtinhId +"a");
	if (khachhangtinhId != ""){
	var	khachhanghuyenId = $('.khachhang-huyenId').val();
	var	khachhangxaId = $('.khachhang-xaId').val();
		
		layTinh(khachhangtinhId);
		layHuyen(khachhangtinhId,khachhanghuyenId);
		layXa(khachhanghuyenId, khachhangxaId);
	}
	$('.country-select').on('change', '.select-tinh', function(){
		
		var giatri = $(this).children("option:selected").val();
		
		$('.country-select .select-xa').remove();
		$('.country-select .select-huyen').remove();
		thongtinxa ="<select class='nice-select wide select-xa'><option value='0'>-- Chọn xã --</option></select>"
		$('.label-xa').after(thongtinxa);
		$('.khachhang-tinhId').val();
		$('.khachhang-tinhId').val(giatri);
		if (giatri == 0){
			thongtinhuyen = "<select class='nice-select wide select-huyen' ><option value='0'>-- Chọn huyện --</option></select>"
			$('.label-huyen').after(thongtinhuyen);
		}else{
			
			ajaxHuyen = ajaxdiachi({
			diaChiId: giatri
		})
		ajaxHuyen.done(function(lstDC){
			var thongtinhuyen ="<select class='nice-select wide select-huyen' ><option value='0'>-- Chọn huyện --</option>"
				for (var i = 0 ; i < lstDC.length ; i++){
					thongtinhuyen += "<option value='"+lstDC[i].id+"'>"+lstDC[i].ten+"</option>"
				}
			thongtinhuyen += "</select>"
				$('.label-huyen').after(thongtinhuyen);
		})
		}
		
	});
	$('.country-select').on('change', '.select-huyen', function(){
		var giatri = $(this).children("option:selected").val();
		$('.country-select .select-xa').remove();
		$('.khachhang-huyenId').val();
		$('.khachhang-huyenId').val(giatri);
		
		if (giatri == 0){
			thongtinxa ="<select class='nice-select wide select-xa'><option value='0'>-- Chọn xã --</option></select>"
			$('.label-xa').after(thongtinxa);
		}else{
			
			ajaxXa = ajaxdiachi({
				diaChiId: giatri
			})
			ajaxXa.done(function(lstDC){
			var thongtinxa ="<select class='nice-select wide select-xa' ><option value='0'>-- Chọn xã --</option>"
				for (var i = 0 ; i < lstDC.length ; i++){
					thongtinxa += "<option value='"+lstDC[i].id+"'>"+lstDC[i].ten+"</option>"
				}
			thongtinxa += "</select>"
				$('.label-xa').after(thongtinxa);
		})
		}
	})
	$('.country-select').on('change', '.select-xa', function(){
		var giatri = $(this).children("option:selected").val();
	
		$('.khachhang-xaId').val(giatri);
		
		
	});
})
	

</script>
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
	
	<input type="text" class="checkout-id" style="display:none;" value="${objKH.id }">
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
									<a class="menu" style=" color: blue !important" href="${urlThongTin }">Thông tin tài khoản</a></li>
								<li class= "lithongtin" style="height: 37.5px;"><i class="fa fa-unlock-alt"
									style="font-size: 24px; color: silver; width: 30px"></i> &nbsp;
									<a class="menu" href="${urlThayDoiMK }">Thay đổi mật khẩu</a></li>
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
							<s:form action="${urlUpdate }" method="post" id="FormRegister"
							 enctype="multipart/form-data"  modelAttribute="thongtinkhachhang">
								<div class="row">
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Họ Tên <span class="required">*</span></label> 
										 <s:input type="text" class="form-control" path="id" style="display: none;"/>
										 <s:input type="text" class="form-control" placeholder="Họ và Tên" path="hoTen"/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Địa chỉ email <span class="required">*</span></label> 
										<s:input type="email" class="form-control" id="email" placeholder="Email" path="email"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Điện thoại <span class="required">*</span></label> 
										<s:input class="form-control" id="mobile" placeholder="Điện thoại" path="dienThoai"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Giới tính <span class="required">*</span></label> 
										<div class="row">
											<div class="col-sm-1"></div>
											<div class="col-sm-3"> <label class="radio-inline"><s:radiobutton style="width: auto; height: auto;" 
												class="form-check-input" path="gioiTinh" value="0"/>Nam</label> </div>
											<div class="col-sm-3"> <label class="radio-inline">
										<s:radiobutton style="width: auto; height: auto;" 
											class="form-check-input" path="gioiTinh" value="1"/>Nữ</label> </div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<s:input type="text" style="display:none;" class="khachhang-tinhId" path="tinhId"></s:input>
									<s:input type="text" style="display:none;" class="khachhang-huyenId" path="huyenId"></s:input>
									<s:input type="text" style="display:none;" class="khachhang-xaId" path="xaId"></s:input>
									<s:input type="text" style="display:none;" class="khachhang-matkhau" path="matKhau"></s:input>
									<div class="country-select clearfix">
										<label class="label-tinh">Tỉnh/Thành phố <span class="required">*</span></label>
										
									</div>
								</div>
								<div class="col-md-6">
									<div class="country-select clearfix">
										<label class="label-huyen">Quận/Huyện <span class="required">*</span></label> 
										<select
											class="nice-select wide select-huyen" >
												<option value="0">-- Chọn huyện --</option>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="country-select clearfix">
										<label class="label-xa">Phường/Xã <span class="required">*</span></label> 
										<select
											class="nice-select wide select-xa">
												<option value="0">-- Chọn xã --</option>
										</select>
									</div>
								</div>

								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Địa chỉ <span class="required">*</span></label> <s:input
											placeholder="Địa chỉ chi tiết" type="text" class="checkout-dcchitiet" path="diaChi"></s:input>
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Ngày Sinh <span class="required">*</span></label> 
										<s:input  path="ngaySinh" class="datepicker"/>
									</div>
								</div>
								</div>
				
								<label></label>
								
								<div class="row">
									<div class="col-md-3"></div>
									<div class="col-md-3">
										<input type="submit" value="Cập nhật" class="btn btn-primary"
										class="return-customer-btn">
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