<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	var formatTien = new Intl.NumberFormat('de-DE', {
		  style: 'currency',
		  currency: 'VND',
		});
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
	$('.btn-cthd').click(function(e){
		e.preventDefault();
		window.location.href="${pageContext.request.contextPath}/admin/dsdonhang";
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
											<label>Mã đơn hàng</label>
											<input type="text" class="form-control"
												 value="${objHD.id }">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-float">
										<label>Khách hàng</label>
											<input type="text" class="form-control"
												value="${objHD.tenKH }">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-float">
											<label>Địa chỉ email</label>
											<input type="text" class="form-control"
												 value="${objHD.email }">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-float">
										<label>Điện thoại</label>
											<input type="text" class="form-control"
												value="${objHD.dienThoai }">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group form-float">
											<label>Địa chỉ nhận hàng</label>
											<input type="text" class="form-control"
												 value="${objHD.dcChiTiet }, ${objHD.objXa.ten}, ${objHD.objHuyen.ten}, ${objHD.objTinh.ten}">
										</div>
									</div>
									
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group form-float">
											<label>Tình trạng</label>
											<input type="text" class="form-control"
												 value="${objHD.objTinhTrang.tenTinhTrang }">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group form-float">
										<label>Hình thức thanh toán</label>
											<input type="text" class="form-control"
												value="${objHD.objHTTT.tenHinhThuc }">
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
                                        <c:forEach var="hdct" items="${objHD.lstCTHD }">
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
								<button class="btn btn-primary btn-cthd"
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