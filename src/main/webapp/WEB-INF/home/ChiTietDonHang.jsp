<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
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
	var gia = new Array();
	$('.hdct-gia').each(function(){
		var x = $(this).text();
		gia.push(parseInt(x));
		
	})
	var soluong = new Array();
	$('.hdct-soluong').each(function(){
		var y = $(this).text();
		soluong.push(parseInt(y));
	})
	var tongcong = 0;
	for (var i = 0 ;i < gia.length; i ++){
		var tong = gia[i] * soluong[i];
		tongcong += tong;
		$(".hdct-tong:eq("+i+")").text(formatTien.format(tong));
	}
	$(".hdct-tongcong").text(formatTien.format(tongcong));
	
	
})
</script>
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
									<a class="menu" href="${urlThayDoiMK }">Thay đổi mật khẩu</a></li>
								<li class= "lithongtin" style="height: 31.5px;"><i
									class='fa fa-shopping-basket'
									style='font-size: 18px; color: silver; width: 36px'></i>&nbsp;
									<a class="menu" style=" color: blue !important" href="${urlLichSu }/${objKH.id }">Lịch sử mua hàng</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- New Customer End -->
				<!-- Returning Customer Start -->
				<div class="col-md-9">
					<div class="well">
						<div class="return-customer">
							<h6 class="mb-10 custom-title" style="font-size: 20px; color: #555555">Thông tin đơn hàng</h6>
							<label style="height: 40px"></label>
							<s:form   modelAttribute="objHoaDon">
								<div class="row">
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Mã đơn hàng <span class="required">*</span></label> 
										 <s:input type="text" class="form-control" placeholder="Họ và Tên" path="id"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Người nhận <span class="required">*</span></label> 
										 <s:input type="text" class="form-control" placeholder="Họ và Tên" path="tenKH"/>
									</div>
								</div>
								<div class="col-md-6">
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
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>Địa chỉ nhận hàng<span class="required">*</span></label> 
										<input class="form-control" id="mobile" placeholder="Điện thoại" value='${objHoaDon.dcChiTiet }, ${objHoaDon.objXa.ten}, ${objHoaDon.objHuyen.ten}, ${objHoaDon.objTinh.ten}'/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Tình trạng <span class="required">*</span></label> 
										<s:input class="form-control" id="mobile" placeholder="Điện thoại" path="objTinhTrang.tenTinhTrang"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>Hình thức thanh toán <span class="required">*</span></label> 
										<s:input class="form-control" id="mobile" placeholder="Điện thoại" path="objHTTT.tenHinhThuc"/>
									</div>
								</div>
								</div>
								<div class="row">
									<div class="table-content table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="li-product-thumbnail">Hình ảnh</th>
                                                <th class="cart-product-name">Sản phẩm</th>
                                                <th class="cart-product-name">Phân loại</th>
                                                <th class="li-product-price">Đơn giá</th>
                                                <th class="li-product-quantity">Số lượng</th>
                                                <th class="li-product-subtotal">Tổng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="hdct" items="${objHoaDon.lstCTHD }">
                                             <tr>
                                                <td style='width: 150px'><img style='width: 100%' src='<c:url value='/images/${hdct.objGTTT.objSanPham.lstAnhSP[0].anh }'/>'></td>
                                                <td>${hdct.objGTTT.objSanPham.tenSanPham } </td>
                                                <td >${hdct.objGTTT.thuocTinh1 } ${hdct.objGTTT.thuocTinh2 }</td>
                                                <td class="hdct-gia">${hdct.gia }</td>
                                                <td class="hdct-soluong">${hdct.soLuong }</td>
                                                <td class="hdct-tong"></td>
                                            </tr>
                                           </c:forEach>
                                           <tr>
                                           <td colspan="2"><strong>Tổng Cộng</strong></td>
                                           <td class="hdct-tongcong" colspan="4"></td>
                                        </tbody>
                                    </table>
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