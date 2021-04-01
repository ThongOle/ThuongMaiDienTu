<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<c:url value="/images" var="images"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(function (){
	donhang();
	var tinhId =  $('.khachhang-tinhId').val();
	if(tinhId != ""){
		layTinh(tinhId);
		var huyenId = $('.khachhang-huyenId').val();
		var xaId = $('.khachhang-xaId').val();
		layHuyen(tinhId,huyenId);
		layXa(huyenId, xaId);
	}else{
		layTinh(0);
	}
	;
	
	
	$('.country-select').on('change', '.select-tinh', function(){
		var giatri = $(this).children("option:selected").val();
		$('.country-select .select-xa').remove();
		$('.country-select .select-huyen').remove();
		thongtinxa ="<select class='nice-select wide select-xa'><option value='0'>-- Chọn xã --</option></select>"
		$('.label-xa').after(thongtinxa);
		
		if (giatri == 0){
			thongtinhuyen = "<select class='nice-select wide select-huyen' ><option value='0'>-- Chọn huyện --</option></select>"
			$('.label-huyen').after(thongtinhuyen);
		}else{
			ajaxHuyen = ajaxdiachi({
			diaChiId: giatri
		})
		ajaxHuyen.done(function(lstDC){
			var thongtinhuyen ="<select class='nice-select wide select-huyen' name='huyenId'><option value='0'>-- Chọn huyện --</option>"
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
		if (giatri == 0){
			thongtinxa ="<select class='nice-select wide select-xa'><option value='0'>-- Chọn xã --</option></select>"
			$('.label-xa').after(thongtinxa);
		}else{
			ajaxXa = ajaxdiachi({
				diaChiId: giatri
			})
			ajaxXa.done(function(lstDC){
			var thongtinxa ="<select class='nice-select wide select-xa' name='xaId'><option value='0'>-- Chọn xã --</option>"
				for (var i = 0 ; i < lstDC.length ; i++){
					thongtinxa += "<option value='"+lstDC[i].id+"'>"+lstDC[i].ten+"</option>"
				}
			thongtinxa += "</select>"
				$('.label-xa').after(thongtinxa);
		})
		}
	})
	$('.btnThanhToan').click(function(){
		console.log("a");
		var maKhachHang = $('.checkout-id').val();
		var tenKH = $('.checkout-hoten').val();
		var email = $('.checkout-email').val();
		var dienThoai = $('.checkout-dienthoai').val();
		var dcChiTiet = $('.checkout-dcchitiet').val();
		var ghiChu = $('.checkout-ghichu').val();
		var tinhId = $('.country-select .select-tinh').children("option:selected").val();
		var huyenId = $('.country-select .select-huyen').children("option:selected").val();
		var xaId = $('.country-select .select-xa').children("option:selected").val();
		var lstTT = localStorage.getItem('TTSP');
		var htTT = $('input[name="hinhthucthanhtoan"]:checked').val();
		alert(htTT);
		if (lstTT != null){
			 $.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/home/thanhtoan",
					dataType : 'json',
					data: {
						maKhachHang :maKhachHang,
						tenKH : tenKH,
						email: email,
						dienThoai: dienThoai,
						dcChiTiet: dcChiTiet,
						ghiChu : ghiChu,
						tinhId: tinhId,
						huyenId: huyenId,
						xaId: xaId,
						lstTT : lstTT,
						htTT: htTT
					
					},
					contentType : "application/json; charset=utf-8",
					async : true,
					success: function(){
						alert("Thanh toán thành công")
						localStorage.removeItem("TTSP");
						setTimeout(function(){location.href="${pageContext.request.contextPath}/home"} , 100);   
					}
					
			})
		}
		
	});
	
});
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
	
	<input type="text" class="checkout-id" style="display: none;" value="${objKH.id }">
	<div class="checkout-area pt-60 pb-30">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-12">
					<form action="#">
						<div class="checkbox-form">
							<h3>Thông tin thanh toán</h3>
							<div class="row">
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Họ Tên <span class="required">*</span></label> <input
											placeholder="Họ Tên" type="text" class="checkout-hoten" value="${objKH.hoTen }">
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Địa chỉ email <span class="required">*</span></label> <input
											placeholder="Địa chỉ email" type="text" class="checkout-email" value="${objKH.email }">
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Điện thoại <span class="required">*</span></label> <input
											placeholder="Điện thoại" type="text" class="checkout-dienthoai" value="${objKH.dienThoai }" >
									</div>
								</div>
								<div class="col-md-6">
									<input type="text" style="display:none;" class="khachhang-tinhId" value="${objKH.tinhId }">
									<input type="text" style="display:none;" class="khachhang-huyenId" value="${objKH.huyenId }">
									<input type="text" style="display:none;" class="khachhang-xaId" value="${objKH.xaId }">
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

								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Địa chỉ <span class="required">*</span></label> <input
											placeholder="Địa chỉ chi tiết" type="text" class="checkout-dcchitiet" value="${objKH.diaChi }">
									</div>
								</div>

								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Ghi chú</label>
										<textarea rows="2" class="checkout-ghichu"></textarea>
									</div>
								</div>

								<div class="col-md-12">
									<h5>Hình thức thanh toán</h5>
									<div class="checkout-form-list">
										<div
											style="width: 100%; height: auto; border: 1px solid rgb(221, 221, 221); border-radius: 5px">
											<div
												style="width: 100%; height: 100%; margin: 20px 20px 20px 20px">

												<div class="form-check" style="margin-bottom: 20px">
													<input class="form-check-input"
														style="width: auto; height: auto" type="radio"
														name="hinhthucthanhtoan" id="hinhthucthanhtoan1" value="1">
													 <label
														class="form-check-label" for="hinhthucthanhtoan1"><img alt="" src="${images }/iconthanhtoan1.svg">Thanh toán tiền mặt khi nhận hàng </label>
												</div>
												<div class="form-check" style="margin-bottom: 20px">
													<input class="form-check-input"
														style="width: auto; height: auto" type="radio"
														name="hinhthucthanhtoan" id="hinhthucthanhtoan2" value="2">
													 <label
														class="form-check-label" for="hinhthucthanhtoan2"><img alt="" src="${images }/iconthanhtoan2.svg">Thanh toán bằng thẻ quốc tế Visa,Master,JSB</label>
												</div>
												<div class="form-check" style="margin-bottom: 20px">
													<input class="form-check-input"
														style="width: auto; height: auto" type="radio"
														name="hinhthucthanhtoan" id="hinhthucthanhtoan3" value="3">
													 <label
														class="form-check-label" for="hinhthucthanhtoan3"><img alt="" src="${images }/iconthanhtoan3.svg">Thẻ ATM nội địa/Internet Banking (Miễn phí thanh toán)</label>
												</div>
												<div class="form-check" style="margin-bottom: 20px">
													<input class="form-check-input"
														style="width: auto; height: auto" type="radio"
														name="hinhthucthanhtoan" id="hinhthucthanhtoan4" value="4">
													 <label
														class="form-check-label" for="hinhthucthanhtoan4"><img alt="" src="${images }/iconthanhtoan4.svg">Thanh toán bằng ví MoMo</label>
												</div>
												<div class="form-check" style="margin-bottom: 20px">
													<input class="form-check-input"
														style="width: auto; height: auto" type="radio"
														name="hinhthucthanhtoan" id="hinhthucthanhtoan5" value="5">
													 <label
														class="form-check-label" for="hinhthucthanhtoan5"><img alt="" src="${images }/iconthanhtoan5.svg">Thanh toán bằng ZaloPay </label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="col-lg-6 col-12">
					<div class="your-order">
						<h3>Đơn hàng</h3>
						<div class="your-order-table table-responsive">
							<table class="table">
								<thead>
									<tr>
										<th class="cart-product-name">Sản Phẩm</th>
										<th class="cart-product-total">Giá tiền</th>
									</tr>
								</thead>
								<tbody class="tbodydonhang">
									
								</tbody>
								<tfoot>
									<tr class="cart-subtotal">
										<th>Tạm Tính</th>
										<td><span class="amount donhangtamtinh"></span></td>
									</tr>
									<tr class="order-total">
										<th>Tổng cộng</th>
										<td><strong><span class="amount donhangtongcong"></span></strong></td>
									</tr>
								</tfoot>
							</table>
						</div>
						<div class="payment-method">
							<div class="payment-accordion">
								<div class="order-button-payment">
									<input value="Thanh toán" type="submit" class="btnThanhToan">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Checkout Area End-->
</body>
</html>