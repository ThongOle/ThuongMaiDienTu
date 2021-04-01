<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<c:url value="/resources" var="resources"></c:url>
<!-- Begin Header Area -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.hm-wishlist a:hover label {
	color: #fed700;
}

</style>

</head>
<header>
<c:url var="home" value="/" scope="request" />
<c:url var="urlDangNhap" value="/home/dangnhap"/>
<c:url var="urlDangKy" value="/home/dangky"/>
	
	<script type="text/javascript">
	
	$(document)
				.ready(
						function() {
							$('.datepicker').datepicker(
									{format: "dd/mm/yyyy"	}	
							);
							// gọi giỏ hàng
							previewgiohang();
							//xóa sản phẩm trong giỏ hàng
							$('.minicart-product-list')
									.on(
											"click",
											".close",
											function() {

												var idTTXoa = $(this).data(
														'value');
												var ttSP = localStorage
														.getItem('TTSP');
												ttSP = JSON.parse(ttSP);
												for (var i = 0; i < ttSP.length; i++) {
													if (ttSP[i].idTT == idTTXoa) {
														ttSP.splice(i, 1);
														break;
													}
												}
												ttSP = JSON.stringify(ttSP);
												localStorage.setItem('TTSP',
														ttSP);
												previewgiohang();
												giohang();

											});

							$('.hm-minicart')
									.on(
											'click',
											'.btnxemgiohang',
											function() {
												window.location.href = '${pageContext.request.contextPath}/home/giohang';
											})
							var tenKH = $('.thongtinkhachhang').val();
							
							if (tenKH != ""){
								$('.hm-wishlist label').text(tenKH);
								$('.hienThiModal').removeAttr('data-toggle');
								$('.hienThiModal').removeAttr('data-target');
								$('.hienThiModal').attr("href", "${pageContext.request.contextPath}/home/thongtincanhan" )
							}
							
						})
	
	</script>
	<input class="thongtinkhachhang" style="display: none" value="${objKH.hoTen}">
	<!--  Modal login  -->
	<div class="modal" tabindex="-1" role="dialog" id="LoginModal">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<ul class="nav nav-tabs">
						<li class="nav-item"><a class="nav-link active" href="#Login" data-toggle="tab"><strong>Đăng nhập</strong></a></li>
						<li class="nav-item"><a class="nav-link" href="#Registration" data-toggle="tab"><strong>Đăng ký</strong></a></li>
					</ul>
					<br>
					<!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="Login">
                                <s:form role="form" class="form-horizontal" modelAttribute="khachhang" action="${urlDangNhap}" >
                                <div class="form-group row">
                                    <label for="email" class="col-sm-12 control-label">Email</label>
                                    <div class="col-sm-12">
                                        <s:input type="email" class="form-control" id="email1" placeholder="Email" path="email"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="exampleInputPassword1" class="col-sm-12 control-label">Mật khẩu</label>
                                    <div class="col-sm-12">
                                        <s:input type="password" class="form-control" id="exampleInputPassword1" placeholder="Mật Khẩu" path="matKhau"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12" style="position: relative;">
                                        <button style="float: right;" type="submit" class="btn btn-primary btn-sm">
                                            Xác nhận</button> &nbsp;
                                        <a style="float: right; margin-right: 10px; position: absolute; top: 50%; transform: translate(0, -50%); color: blue;" href="javascript:;">Quên mật khẩu?</a>
                                    </div>
                                </div>
                                </s:form>
                            </div>
                            <div class="tab-pane" id="Registration">
                                <s:form role="form" class="form-horizontal" modelAttribute="khachhang" action="${urlDangKy}" method="post" >
                                <div class="row">
                                <div class="col-sm-12">
                                <div class="form-group">
                                    <label class="col-sm-12 control-label">Họ và tên</label>
                                    <div class="col-sm-12">
                                        <s:input type="text" class="form-control" placeholder="Họ và Tên" path="hoTen"/>
                                    </div>
                                </div>
                                </div>
                                </div>
                                
                                 <div class="row">
                                <div class="col-sm-6">
                                <div class="form-group">
                                
                                    <label class="col-sm-12 control-label">
                                        Email</label>
                                    <div class="col-sm-12">
                                        <s:input type="email" class="form-control" id="email" placeholder="Email" path="email"/>
                                    </div>
                                </div>
                                </div>
                                <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-sm-12 control-label">
                                        Điện thoại</label>
                                    <div class="col-sm-12">
                                        <s:input class="form-control" id="mobile" placeholder="Điện thoại" path="dienThoai"/>
                                    </div>
                                </div>
                                </div>
                                </div>
                                
                                <div class="row">
                                <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-sm-12 control-label">
                                        Mật khẩu</label>
                                    <div class="col-sm-12">
                                        <s:input type="password" class="form-control" id="mobile" placeholder="Nhập mật khẩu" path="matKhau"/>
                                    </div>
                                </div>
                                </div>
                                <div class="col-sm-6">
                                	<div class="form-group">
                                    <label class="col-sm-12 control-label">
                                        Nhập lại mật khẩu</label>
                                    <div class="col-sm-12">
                                        <input type="password" class="form-control" id="mobile" placeholder="Nhập lại mật khẩu" />
                                    </div>
                                </div>
                                </div>
                                </div>
                                <div class="row">
                                <div class="col-sm-6">
                                <div class="form-group">
									<label class="col-sm-12 control-label"> Giới Tính</label>
									<div class="col-sm-12 row">
										<div class="col-sm-1"></div>
										<div class="form-check col-sm-5">
											<label class="form-check-label "> <s:radiobutton style="width: auto; height: auto;" 
												class="form-check-input" path="gioiTinh" value="0"/>Nam
											</label>
										</div>
										<div class="form-check col-sm-5">
											<label class="form-check-label "> <s:radiobutton style="width: auto; height: auto;" 
												class="form-check-input" path="gioiTinh" value="1"/>Nữ
											</label>
										</div>
										<div class="col-sm-1"></div>
									</div>
								</div>
                                </div>
                                <div class="col-sm-6">
                                <div class="form-group">
                                    <label class="col-sm-12 control-label">
                                        Ngày Sinh</label>
                                    <div class="col-sm-12">
                                        <s:input  path="ngaySinh" class="datepicker"/>
                                    </div>
                                </div>
                                </div>
                                </div>
                     			<br>
								<div class="row">
									<div class="col-sm-12">
										<button type="submit"  class="btn btn-primary btn-sm" style="float: right;">
											Đăng ký</button>
									</div>
								</div>
							</s:form>
                            </div>
                        </div>
				</div>
			</div>
		</div>
	</div>

	<!-- Begin Header Middle Area -->
	<div class="header-middle pl-sm-0 pr-sm-0 pl-xs-0 pr-xs-0">
		<div class="container">
			<div class="row">
				<!-- Begin Header Logo Area -->
				<div class="col-lg-3">
					<div class="logo pb-sm-30 pb-xs-30">
						<a href="${pageContext.request.contextPath}/home"> <img
							src="${resources }/images/menu/logo/1.jpg" alt="">
						</a>
					</div>
				</div>
				<!-- Header Logo Area End Here -->
				<!-- Begin Header Middle Right Area -->
				<div class="col-lg-9 pl-0 ml-sm-15 ml-xs-15">
					<!-- Begin Header Middle Searchbox Area -->
					<form action="#" class="hm-searchbox">
						<select class="nice-select select-search-category">
							<option value="0">All</option>
							<option value="10">Laptops</option>
							<option value="17">- - Prime Video</option>
							<option value="20">- - - - All Videos</option>
							<option value="21">- - - - Blouses</option>
							<option value="22">- - - - Evening Dresses</option>
							<option value="23">- - - - Summer Dresses</option>
							<option value="24">- - - - T-shirts</option>
							<option value="25">- - - - Rent or Buy</option>
							<option value="26">- - - - Your Watchlist</option>
							<option value="27">- - - - Watch Anywhere</option>
							<option value="28">- - - - Getting Started</option>
							<option value="18">- - - - Computers</option>
							<option value="29">- - - - More to Explore</option>
							<option value="30">- - - - TV &amp; Video</option>
							<option value="31">- - - - Audio &amp; Theater</option>
							<option value="32">- - - - Camera, Photo</option>
							<option value="33">- - - - Cell Phones</option>
							<option value="34">- - - - Headphones</option>
							<option value="35">- - - - Video Games</option>
							<option value="36">- - - - Wireless Speakers</option>
							<option value="19">- - - - Electronics</option>
							<option value="37">- - - - Amazon Home</option>
							<option value="38">- - - - Kitchen &amp; Dining</option>
							<option value="39">- - - - Furniture</option>
							<option value="40">- - - - Bed &amp; Bath</option>
							<option value="41">- - - - Appliances</option>
							<option value="11">TV &amp; Audio</option>
							<option value="42">- - Chamcham</option>
							<option value="45">- - - - Office</option>
							<option value="47">- - - - Gaming</option>
							<option value="48">- - - - Chromebook</option>
							<option value="49">- - - - Refurbished</option>
							<option value="50">- - - - Touchscreen</option>
							<option value="51">- - - - Ultrabooks</option>
							<option value="52">- - - - Blouses</option>
							<option value="43">- - Meito</option>
							<option value="53">- - - - Hard Drives</option>
							<option value="54">- - - - Graphic Cards</option>
							<option value="55">- - - - Processors (CPU)</option>
							<option value="56">- - - - Memory</option>
							<option value="57">- - - - Motherboards</option>
							<option value="58">- - - - Fans &amp; Cooling</option>
							<option value="59">- - - - CD/DVD Drives</option>
							<option value="44">- - Sony Bravia</option>
							<option value="60">- - - - Sound Cards</option>
							<option value="61">- - - - Cases &amp; Towers</option>
							<option value="62">- - - - Casual Dresses</option>
							<option value="63">- - - - Evening Dresses</option>
							<option value="64">- - - - T-shirts</option>
							<option value="65">- - - - Tops</option>
							<option value="12">Smartphone</option>
							<option value="66">- - Camera Accessories</option>
							<option value="68">- - - - Octa Core</option>
							<option value="69">- - - - Quad Core</option>
							<option value="70">- - - - Dual Core</option>
							<option value="71">- - - - 7.0 Screen</option>
							<option value="72">- - - - 9.0 Screen</option>
							<option value="73">- - - - Bags &amp; Cases</option>
							<option value="67">- - XailStation</option>
							<option value="74">- - - - Batteries</option>
							<option value="75">- - - - Microphones</option>
							<option value="76">- - - - Stabilizers</option>
							<option value="77">- - - - Video Tapes</option>
							<option value="78">- - - - Memory Card Readers</option>
							<option value="79">- - - - Tripods</option>
							<option value="13">Cameras</option>
							<option value="14">headphone</option>
							<option value="15">Smartwatch</option>
							<option value="16">Accessories</option>
						</select> <input type="text" placeholder="Enter your search key ...">
						<button class="li-btn" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
					<!-- Header Middle Searchbox Area End Here -->
					<!-- Begin Header Middle Right Area -->
					<div class="header-middle-right">
						<ul class="hm-menu">
							<!-- Begin Header Middle Wishlist Area -->
							<li class="hm-wishlist"><a class="hienThiModal" data-toggle="modal" data-target="#LoginModal"
								style="width: auto; border: none;"><label><i
										class="fa fa-user"></i> Đăng nhập</label> </a></li>
							<!-- Header Middle Wishlist Area End Here -->
							<!-- Begin Header Mini Cart Area -->
							<li class="hm-minicart">
								<div class="hm-minicart-trigger">
									<span class="item-icon"></span> <span class="item-text">
										<span class="cart-item-count soluongtronggio"
										style="top: -12px"></span>
									</span>
								</div> <span></span>
								<div class="minicart">
									<ul class="minicart-product-list">

									</ul>
									<p class="minicart-total">
										Tổng cộng: <span class="tong-cong-minicart"></span>
									</p>
									<div class="minicart-button">
										<a
											class="li-button li-button-fullwidth li-button-sm btnxemgiohang">
											<span style="color: white;">Xem giỏ hàng</span>
										</a> <a href="${pageContext.request.contextPath}/home/checkout"
											class="li-button li-button-fullwidth li-button-sm btnmuangay">
											<span>Mua ngay</span>
										</a>
									</div>
								</div>
							</li>
							<!-- Header Mini Cart Area End Here -->
						</ul>
					</div>
					<!-- Header Middle Right Area End Here -->
				</div>
				<!-- Header Middle Right Area End Here -->
			</div>
		</div>
	</div>
	<!-- Header Middle Area End Here -->
	<!-- Begin Header Bottom Area -->
	<div class="header-bottom header-sticky d-none d-lg-block">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Begin Header Bottom Menu Area -->
					<div class="hb-menu hb-menu-2 d-xl-block">
						<nav>
							<ul>
								<li><a href="${pageContext.request.contextPath}/home">Trang
										Chủ</a>
								<li><a href="shop-left-sidebar.html">Ưu đãi hot</a></li>
								<li><a href="blog-left-sidebar.html">Tin tức</a></li>
								<li><a href="index.html">Trả góp 0%</a></li>

								<li><a href="about-us.html">Về chúng tôi</a></li>
								<li><a href="contact.html">Liên hệ</a></li>
								<!-- Begin Header Bottom Menu Information Area -->
								<li class="hb-info f-right p-0 d-sm-none d-lg-block"><span>2405,
										C14 Bắc Hà, phường Trung Văn, quận Đống Đa thành phố Hà Nội</span></li>
								<!-- Header Bottom Menu Information Area End Here -->
							</ul>
						</nav>
					</div>
					<!-- Header Bottom Menu Area End Here -->
				</div>
			</div>
		</div>
	</div>
	<!-- Header Bottom Area End Here -->
	<!-- Begin Mobile Menu Area -->
	<div class="mobile-menu-area d-lg-none d-xl-none col-12">
		<div class="container">
			<div class="row">
				<div class="mobile-menu"></div>
			</div>
		</div>
	</div>
	<!-- Mobile Menu Area End Here -->
	
</header>