<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.trchitietdonhang:hover{
	background-color: #b0b2b5;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	$('.trchitietdonhang').click(function(){
		var id = $(this).data('value') 
		window.location.href="${pageContext.request.contextPath}/home/chitiethoadon/"+id
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
	
	<input type="text" class="checkout-id" value="${objKH.id }">
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
									<a class="menu" href="${urlLichSu }/${objKH.id }" style=" color: blue !important">Lịch sử mua hàng</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- New Customer End -->
				<!-- Returning Customer Start -->
				<div class="col-md-9">
					<div class="well">
						<div class="return-customer">
							<h6 class="mb-10 custom-title"
								style="font-size: 20px; color: #555555">Đơn hàng của tôi</h6>
							<label style="height: 20px"></label>
							<table class="table" style="border: 0px solid black !important">
								<thead>
									<tr>
										<th style="border: none;">Mã đơn hàng</th>
										<th style="border: none;">Ngày mua</th>
										<th style="border: none;">Hình thức thanh toán</th>
										<th style="border: none;">Trạng thái</th>
									</tr>
								</thead>
								<tbody style="font-size: 13px;">
									<c:if test="${not empty lstHoaDon }">
										<c:forEach var="hd" items="${lstHoaDon }">
											<tr class="trchitietdonhang" data-value="${hd.id }">
												<td class="chitietdonhang" style="border: none;"><a style="color: #6633FF">#${hd.id}</a></td>
												<td class="chitietdonhang" style="border: none;"><fmt:formatDate pattern="dd/MM/yyyy" value="${hd.ngayTao}" /></td>
												<td class="chitietdonhang" style="border: none;">${hd.objHTTT.tenHinhThuc }</td>
												<td class="chitietdonhang" style="border: none;"><span style="color:#FFCC00">
													${hd.objTinhTrang.tenTinhTrang }
												</span></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- Returning Customer End -->
			</div>
			</div>
		</div>
</body>
</html>