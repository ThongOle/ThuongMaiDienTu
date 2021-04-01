<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Begin Slider With Category Menu Area -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

<body>
<c:url var="home" value="/" scope="request" />
<script type="text/javascript">

	$(document).ready(function(){
		
		// gọi ajax lấy danh mục
		var ajaxCall = $.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/home/laydanhmuc",
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			async : true,
		})
		
		ajaxCall.done(function(lstDM){
			var thongtin1="";
			var dem;
			for (var i=0 ; i <lstDM.length; i++){
				// gọi function để add danh mục con
					thongtin1 += chuoidm(lstDM[i].id, lstDM[i].tenDanhMuc, lstDM[i].lstDanhMuc);
				}
			if (lstDM.length >=9){
				// xử lý nếu chuỗi danh mục cha quá 8 (chống tràn)
				thongtin1 += "<li class='rx-parent'>"
                			+"<a class='rx-default'>Thêm danh mục</a>"
                			+ "<a class='rx-show'>Ẩn bớt danh mục</a>"
            				+ "</li>"
			}
			$('#danhMuc').append(thongtin1);
			for (var i =9; i <= lstDM.length; i++){
				var lop = "#danhMuc .right-menu:nth-child("+i+")";
				$(lop).addClass('rx-child');
			}
		});
		
		// xử lý thông tin khi đóng modal sản phẩm
		$('#exampleModalCenter').on('hide.bs.modal', function(){
			$('.thuoc-tinh-1 .option-1').remove();
			$('.thuoc-tinh-2 .option-2').remove();
			$('.product-details-left').empty();
			
			
		})
		
		
		// xử lý thông tin trên modal sản phẩm
		$('.quick-view-btn').click(function(){
			var sanphamid = $(this).data('id');
			
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/home/laylistGTTT/"+sanphamid,
				dataType : 'json',
				contentType : "application/json; charset=utf-8",
				async : true,
				success: function(lstGTTT){
					$('.name-quick-view').text(lstGTTT[0].objSanPham.tenSanPham);
					$('.price-quick-view').html(formatTien.format(lstGTTT[0].giaTien));
					$('.lstGTTT-sp').val(JSON.stringify(lstGTTT));
					$('.thuocTinhId-sp').val(lstGTTT[0].id);
					var thongtin ="";
					if(lstGTTT[0].objSanPham.thuocTinh1!= null){
						$('.thuoc-tinh-1').css('display', 'block');
						$('.thuoc-tinh-1 label').text(lstGTTT[0].objSanPham.thuocTinh1);
						var size = lstGTTT.length;
						var tt1 = new Set();
						for (var i = 0; i < size; i++ ){
							tt1.add(lstGTTT[i].thuocTinh1);
						}
						thongtin += "<select class='nice-select option-1'>"
						var dem1 = 1;
						for (var tt of tt1){
							thongtin+= "<option value='"+dem1+"'>"+tt+"</option>"
							dem1 += 1;
						}
						thongtin += "</select>"
						console.log(thongtin);
						$('.thuoc-tinh-1').append(thongtin);
					}
					var thongtin2="";
					if(lstGTTT[0].objSanPham.thuocTinh2!= null){
						$('.thuoc-tinh-2').css('display', 'block');
						$('.thuoc-tinh-2 label').text(lstGTTT[0].objSanPham.thuocTinh2);
						var size = lstGTTT.length;
						var tt2 = new Set();
						for (var i = 0; i < size; i++ ){
							tt2.add(lstGTTT[i].thuocTinh2);
						}
						thongtin2 += "<select class='nice-select option-2'>"
						var dem2 = 1;
						for (var tt of tt2){
							thongtin2 += "<option value='"+dem2+"'>"+tt+"</option>"
							dem2 +=1;
						}
						thongtin2 += "</select>"
						$('.thuoc-tinh-2').append(thongtin2);
					}
					var anhlon ="";
					var anhnho="";
					var sizeASP = lstGTTT[0].objSanPham.lstAnhSP.length;
					for (var i = 0; i< sizeASP ; i++){
						anhlon += "<div class='lg-image'>"
								+"<img src='<c:url value='images/"+lstGTTT[0].objSanPham.lstAnhSP[i].anh+"'></c:url>' alt='product image'>"
								+"</div>";
					}
					
					for (var i = 0; i< sizeASP ; i++){
						anhnho += "<div class='sm-image'>"
								+"<img src='<c:url value='images/"+lstGTTT[0].objSanPham.lstAnhSP[i].anh+"'></c:url>' alt='product image thumb'>"
								+"</div>";
					}
					var anh = "<div class='product-details-images slider-navigation-1'>"+ anhlon
							+ "</div><div class=product-details-thumbs slider-thumbs-1'>"+ anhnho+ "</div>"
					$('.product-details-left').append(anh);
					
					// js để tạo slide trong modal 
					$('.product-details-images').each(function(){
					     var $this = $(this);
					     var $thumb = $this.siblings('.product-details-thumbs, .tab-style-left');
					     $this.slick({
					        arrows: false,
					        slidesToShow: 1,
					        slidesToScroll: 1,
					        autoplay: false,
					        autoplaySpeed: 5000,
					        dots: false,
					        infinite: true,
					        centerMode: false,
					        centerPadding: 0,
					        asNavFor: $thumb,
					    });
					 });
					  
					// js để tạo slide trong modal 
					 $('.product-details-thumbs').each(function(){
					     var $this = $(this);
					     var $details = $this.siblings('.product-details-images');
					     $this.slick({
					        slidesToShow: 4,
					        slidesToScroll: 1,
					        autoplay: false,
					        autoplaySpeed: 5000,
					        dots: false,
					        infinite: true,
					        focusOnSelect: true,
					        centerMode: true,
					        centerPadding: 0,
					        prevArrow: '<span class="slick-prev"><i class="fa fa-angle-left"></i></span>',
					        nextArrow: '<span class="slick-next"><i class="fa fa-angle-right"></i></span>',
					        asNavFor: $details,
					    });
					 });
					
					
				}
			})
		})
		//xử lý khi thay chọn thuộc tinh sản phẩm
		$('.thuoc-tinh-1').on('change', '.option-1', function(){
			var lstGTTT = $('.lstGTTT-sp').val();
			lstGTTT = JSON.parse(lstGTTT);
			var thuocTinh1 = $(this).children("option:selected").val();
			var thuocTinh2 = $('.thuoc-tinh-2 .option-2').children("option:selected").val();
			var thuocTinhId = 0;
			var dem = 0;
			if(thuocTinh2 == undefined){
				dem = thuocTinh1;
			}else{
				
				for (var i = 0 ; i< thuocTinh1; i++){
					for(var j = 0 ; j< thuocTinh2; j++){
						dem += 1;
					}
				}	
			}
			thuocTinhId = lstGTTT[dem -1].id;
			$('.thuocTinhId-sp').val(thuocTinhId);
			$('.price-quick-view').html(formatTien.format(lstGTTT[dem-1].giaTien));
			
		});
		$('.thuoc-tinh-2').on('change', '.option-2', function(){
			var lstGTTT = $('.lstGTTT-sp').val();
			lstGTTT = JSON.parse(lstGTTT);
			var thuocTinh2 = $(this).children("option:selected").val();
			var thuocTinh1 = $('.thuoc-tinh-1 .option-1').children("option:selected").val();
			var thuocTinhId = 0;
			var dem = 0;
			if(thuocTinh2 == undefined){
				dem = thuocTinh1;
			}else{
				
				for (var i = 0 ; i< thuocTinh1; i++){
					for(var j = 0 ; j< thuocTinh2; j++){
						dem += 1;
					}
				}	
			}
			thuocTinhId = lstGTTT[dem -1].id;
			$('.thuocTinhId-sp').val(thuocTinhId);
			$('.price-quick-view').html(formatTien.format(lstGTTT[dem-1].giaTien));
			
		});
		// Xử lý khi thêm sản phẩm từ modal
		$('.modal-add-to-cart').click(function(){ 
			var soLuong = $('.so-luong-modal').val();
			var thuocTinhId = $('.thuocTinhId-sp').val();
			themVaoGio(thuocTinhId, soLuong);
			
		});
		
		//xử lý khi tăng sản phẩm
		$('.cart-plus-minus').on('click', '.qtybutton' , function() {
			
			 var $button = $(this);
			 var oldValue = $button.parent().find("input").val();
			    if ($button.hasClass('inc')) {
			       var newVal = parseFloat(oldValue) + 1;
			    } else {
			        // Don't allow decrementing below zero
			       if (oldValue > 1) {
			         var newVal = parseFloat(oldValue) - 1;
			         } else {
			         newVal = 1;
			       }
			   }
			    $button.parent().find("input").val(newVal);
		});
		
		
		
		
	});
	
	// function gọi danh mục con
	function chuoidm(id, tendanhmuc, lstDMcon){
		var thongtin = "";
		thongtin += "<li class='right-menu' data-value= "+id+ ">" 
				+ "<a href='${pageContext.request.contextPath}/home/shopsanpham/"+id+"'>" + tendanhmuc 
	   	 		+ "</a>"
	   	 		+ "<ul class='cat-mega-menu'>";
	   	
	   	var dem = lstDMcon.length/3;
	   	dem = parseInt (dem);
	   	if(dem == 0){
	   		thongtin += chuoifor(0,dem, lstDMcon);
	   	}else{
	   		thongtin += chuoifor(dem*2, lstDMcon.length, lstDMcon);
	   		thongtin += chuoifor(dem, dem*2, lstDMcon);
	   		thongtin += chuoifor(0,dem, lstDMcon);	
	   	}
	   	 	thongtin += ("</ul></li>");
	   	return thongtin;
	};
	function chuoifor(start,dem, lstDMcon){
		var chuoifor= ("<li class='right-menu cat-mega-title'><ul>");
		for (var i = start ; i<dem; i++){
			chuoifor += ("<li><a href='${pageContext.request.contextPath}/home/shopsanpham/"+lstDMcon[i].id+"'>"+lstDMcon[i].tenDanhMuc+"</a></li>" );
		}
		chuoifor += ("</ul></li>");
		return chuoifor;
	}
	
	
	
</script>
	
	<div class="slider-with-banner">
		<div class="container">
			<div class="row">
				<!-- Begin Category Menu Area -->
				<div class="col-lg-3">
					<!--Category Menu Start-->
					<div class="category-menu">
						<div class="category-heading">
							<h2 class="categories-toggle">
								<span>Danh mục</span>
							</h2>
						</div>
						<div id="cate-toggle" class="category-menu-list">
							<ul id="danhMuc" >

							</ul>
						</div>
					</div>
					<!--Category Menu End-->
				</div>
				<!-- Category Menu Area End Here -->
				<!-- Begin Slider Area -->
				<div class="col-lg-9">
					<div class="slider-area pt-sm-30 pt-xs-30">
						<div class="slider-active owl-carousel">
							<!-- Begin Single Slide Area -->
							<div
								class="single-slide align-center-left animation-style-02 bg-4">
								<div class="slider-progress"></div>
								<div class="slider-content">
									<h5>
										Giảm giá <span>-20% Off</span> Tuần này
									</h5>
									<h2>Chamcham Galaxy S9 | S9+</h2>
									<h3>
										Giá chỉ từ <span>9.900.000 VNĐ</span>
									</h3>
									<div class="default-btn slide-btn">
										<a class="links" href="shop-left-sidebar.html">Mua ngay</a>
									</div>
								</div>
							</div>
							<!-- Single Slide Area End Here -->
							<!-- Begin Single Slide Area -->
							<div
								class="single-slide align-center-left animation-style-01 bg-5">
								<div class="slider-progress"></div>
								<div class="slider-content">
									<h5>
										Giảm giá <span>Chúc mừng năm mới</span> Đến hết ngày
										20/02/2021
									</h5>
									<h2>Laptop văn phòng</h2>
									<h3>
										Giá chỉ từ <span>6.000.000 VNĐ</span>
									</h3>
									<div class="default-btn slide-btn">
										<a class="links" href="shop-left-sidebar.html">Mua ngay</a>
									</div>
								</div>
							</div>
							<!-- Single Slide Area End Here -->
							<!-- Begin Single Slide Area -->
							<div
								class="single-slide align-center-left animation-style-02 bg-6">
								<div class="slider-progress"></div>
								<div class="slider-content">
									<h5>
										Giảm giá <span>-10% Off</span> Tuần này
									</h5>
									<h2>Phantom 4 Pro+ Obsidian</h2>
									<h3>
										Giá chỉ từ <span>10.000.000 VNĐ</span>
									</h3>
									<div class="default-btn slide-btn">
										<a class="links" href="shop-left-sidebar.html">Mua ngay</a>
									</div>
								</div>
							</div>
							<!-- Single Slide Area End Here -->
						</div>
					</div>
				</div>
				<!-- Slider Area End Here -->
			</div>
		</div>
	</div>
	<!-- Slider With Category Menu Area End Here -->
	<!-- Begin Li's Static Banner Area -->
	<div class="li-static-banner pt-20 pt-sm-30 pt-xs-30">
		<div class="container">
			<div class="row">
				<!-- Begin Single Banner Area -->
				<div class="col-lg-4 col-md-4">
					<div class="single-banner pb-xs-30">
						<a href="#"> <img src="resources/images/banner/1_3.jpg"
							alt="Li's Static Banner">
						</a>
					</div>
				</div>
				<!-- Single Banner Area End Here -->
				<!-- Begin Single Banner Area -->
				<div class="col-lg-4 col-md-4">
					<div class="single-banner pb-xs-30">
						<a href="#"> <img src="resources/images/banner/1_4.jpg"
							alt="Li's Static Banner">
						</a>
					</div>
				</div>
				<!-- Single Banner Area End Here -->
				<!-- Begin Single Banner Area -->
				<div class="col-lg-4 col-md-4">
					<div class="single-banner">
						<a href="#"> <img src="resources/images/banner/1_5.jpg"
							alt="Li's Static Banner">
						</a>
					</div>
				</div>
				<!-- Single Banner Area End Here -->
			</div>
		</div>
	</div>
	<!-- Li's Static Banner Area End Here -->
	<!-- Begin Li's Special Product Area -->

	<br>
	<br>
	<!-- Li's Special Product Area End Here -->
	<!-- Begin Li's Laptops Product | Home V2 Area -->
	<section
		class="product-area li-laptop-product li-laptop-product-2 pb-45">
		<div class="container">
			<div class="row">
				<!-- Begin Li's Section Area -->
				<div class="col-lg-12">
					<div class="li-section-title">
						<h2>
							<span>Laptops</span>
						</h2>
						<ul class="li-sub-category-list">
							<li class="active"><a href="shop-left-sidebar.html">Macbook</a></li>
							<li><a href="shop-left-sidebar.html">ASUS</a></li>
							<li><a href="shop-left-sidebar.html">DELL</a></li>
						</ul>
					</div>
					<div class="li-banner-2 pt-15">
						<div class="row">
							<!-- Begin Single Banner Area -->
							<div class="col-lg-6 col-md-6">
								<div class="single-banner">
									<a href="#"> <img src="resources/images/banner/2_1.jpg"
										alt="Li's Static Banner">
									</a>
								</div>
							</div>
							<!-- Single Banner Area End Here -->
							<!-- Begin Single Banner Area -->
							<div class="col-lg-6 col-md-6">
								<div class="single-banner pt-xs-30">
									<a href="#"> <img src="resources/images/banner/2_2.jpg"
										alt="Li's Static Banner">
									</a>
								</div>
							</div>
							<!-- Single Banner Area End Here -->
						</div>
					</div>
					<div class="row">
					
						<div class="product-active owl-carousel">
							<c:forEach var ="laptop" items="${lstLT }">
							<div class="col-lg-12">
								<!-- single-product-wrap start -->
								
								<div class="single-product-wrap">
									<div class="product-image">
										<a href="${pageContext.request.contextPath}/home/chitietsanpham/${laptop.id}"> <img
											src='<c:url value="/images/${laptop.lstAnhSP.get(0).anh }"/>'
											alt="Li's Product Image">
										</a> <span class="sticker">New</span>
									</div>
									<div class="product_desc">
										<div class="product_desc_info">
											<div class="product-review">
												<h5 class="manufacturer">
													<a href="shop-left-sidebar.html">Graphic Corner</a>
												</h5>
												<div class="rating-box">
													<ul class="rating">
														<li><i class="fa fa-star-o"></i></li>
														<li><i class="fa fa-star-o"></i></li>
														<li><i class="fa fa-star-o"></i></li>
														<li class="no-star"><i class="fa fa-star-o"></i></li>
														<li class="no-star"><i class="fa fa-star-o"></i></li>
													</ul>
												</div>
											</div>
											<h4>
												<a class="product_name" href="${pageContext.request.contextPath}/home/chitietsanpham/${laptop.id}"  style=" display: -webkit-box; -webkit-line-clamp: 2;  -webkit-box-orient: vertical; overflow: hidden;">${laptop.tenSanPham }</a>
											</h4>
											<div class="price-box">
												<c:set var="giaTien" value='${laptop.lstGTTT.get(0).giaTien }'></c:set>
												<span class="new-price"><fmt:formatNumber type="number" pattern="###,###.###" value="${giaTien}" /> VNĐ</span>
											</div>
										</div>
										<div class="add-actions">
											<ul class="add-actions-link">
												<li class="add-cart active"><a onclick='themVaoGio(${laptop.lstGTTT.get(0).id},1)'>Thêm vào giỏ</a></li>
												<li><a class="links-details" href="#"><i
														class="fa fa-heart-o"></i></a></li>
												<li><a href="#" title="quick view"
													class="quick-view-btn" data-toggle="modal"
													data-target="#exampleModalCenter" data-id="${laptop.id}"><i class="fa fa-eye" ></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-wrap end -->
								
							</div>
							</c:forEach>
						</div>
						
					</div>
				</div>
				<!-- Li's Section Area End Here -->
			</div>
		</div>
	</section>
	<!-- Li's Laptops Product | Home V2 Area End Here -->
	<!-- Begin Li's TV & Audio Product Area -->
	<section
		class="product-area li-laptop-product li-tv-audio-product-2 pb-45">
		<div class="container">
			<div class="row">
				<!-- Begin Li's Section Area -->
				<div class="col-lg-12">
					<div class="li-section-title">
						<h2>
							<span>Ti vi</span>
						</h2>
						<ul class="li-sub-category-list">
							<li class="active"><a href="shop-left-sidebar.html">Sony</a></li>
							<li><a href="shop-left-sidebar.html">Toshiba</a></li>
							<li><a href="shop-left-sidebar.html">Samsung</a></li>
						</ul>
					</div>
					<div class="li-banner-2 pt-15">
						<div class="row">
							<!-- Begin Single Banner Area -->
							<div class="col-lg-6 col-md-6">
								<div class="single-banner">
									<a href="#"> <img src="resources/images/banner/2_3.jpg"
										alt="Li's Static Banner">
									</a>
								</div>
							</div>
							<!-- Single Banner Area End Here -->
							<!-- Begin Single Banner Area -->
							<div class="col-lg-6 col-md-6">
								<div class="single-banner pt-xs-30">
									<a href="#"> <img src="resources/images/banner/2_4.jpg"
										alt="Li's Static Banner">
									</a>
								</div>
							</div>
							<!-- Single Banner Area End Here -->
						</div>
					</div>
					<div class="row">
					
						<div class="product-active owl-carousel">
							<c:forEach var ="laptop" items="${lstLT }">
							<div class="col-lg-12">
								<!-- single-product-wrap start -->
								
								<div class="single-product-wrap">
									<div class="product-image">
										<a href="${pageContext.request.contextPath}/home/chitietsanpham/${laptop.id}"> <img
											src='<c:url value="/images/${laptop.lstAnhSP.get(0).anh }"/>'
											alt="Li's Product Image">
										</a> <span class="sticker">New</span>
									</div>
									<div class="product_desc">
										<div class="product_desc_info">
											<div class="product-review">
												<h5 class="manufacturer">
													<a href="shop-left-sidebar.html">Graphic Corner</a>
												</h5>
												<div class="rating-box">
													<ul class="rating">
														<li><i class="fa fa-star-o"></i></li>
														<li><i class="fa fa-star-o"></i></li>
														<li><i class="fa fa-star-o"></i></li>
														<li class="no-star"><i class="fa fa-star-o"></i></li>
														<li class="no-star"><i class="fa fa-star-o"></i></li>
													</ul>
												</div>
											</div>
											<h4>
												<a class="product_name" href="${pageContext.request.contextPath}/home/chitietsanpham/${laptop.id}"  style=" display: -webkit-box; -webkit-line-clamp: 2;  -webkit-box-orient: vertical; overflow: hidden;">${laptop.tenSanPham }</a>
											</h4>
											<div class="price-box">
												<c:set var="giaTien" value='${laptop.lstGTTT.get(0).giaTien }'></c:set>
												<span class="new-price"><fmt:formatNumber type="number" pattern="###,###.###" value="${giaTien}" /> VNĐ</span>
											</div>
										</div>
										<div class="add-actions">
											<ul class="add-actions-link">
												<li class="add-cart active"><a onclick='themVaoGio(${laptop.lstGTTT.get(0).id},1)'>Thêm vào giỏ</a></li>
												<li><a class="links-details" href="#"><i
														class="fa fa-heart-o"></i></a></li>
												<li><a href="#" title="quick view"
													class="quick-view-btn" data-toggle="modal"
													data-target="#exampleModalCenter" data-id="${laptop.id}"><i class="fa fa-eye" ></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-wrap end -->
								
							</div>
							</c:forEach>
						</div>
						
					</div>
				</div>
				<!-- Li's Section Area End Here -->
			</div>
		</div>
	</section>
	<!-- Li's TV & Audio Product Area End Here -->
	<!-- Begin Li's Smart Phone Product Area -->
	<section
		class="product-area li-laptop-product li-smart-phone-product-2 pb-50">
		<div class="container">
			<div class="row">
				<!-- Begin Li's Section Area -->
				<div class="col-lg-12">
					<div class="li-section-title">
						<h2>
							<span>Điện thoại</span>
						</h2>
						<ul class="li-sub-category-list">
							<li class="active"><a href="shop-left-sidebar.html">Iphone</a></li>
							<li><a href="shop-left-sidebar.html">SAMSUNG</a></li>
						</ul>
					</div>
					<div class="li-banner-2 pt-15">
						<div class="row">
							<!-- Begin Single Banner Area -->
							<div class="col-lg-6 col-md-6">
								<div class="single-banner">
									<a href="#"> <img src="resources/images/banner/2_5.jpg"
										alt="Li's Static Banner">
									</a>
								</div>
							</div>
							<!-- Single Banner Area End Here -->
							<!-- Begin Single Banner Area -->
							<div class="col-lg-6 col-md-6">
								<div class="single-banner pt-xs-30">
									<a href="#"> <img src="resources/images/banner/2_6.jpg"
										alt="Li's Static Banner">
									</a>
								</div>
							</div>
							<!-- Single Banner Area End Here -->
						</div>
					</div>
					<div class="row">
					
						<div class="product-active owl-carousel">
							<c:forEach var ="laptop" items="${lstLT }">
							<div class="col-lg-12">
								<!-- single-product-wrap start -->
								
								<div class="single-product-wrap">
									<div class="product-image">
										<a href="${pageContext.request.contextPath}/home/chitietsanpham/${laptop.id}"> <img
											src='<c:url value="/images/${laptop.lstAnhSP.get(0).anh }"/>'
											alt="Li's Product Image">
										</a> <span class="sticker">New</span>
									</div>
									<div class="product_desc">
										<div class="product_desc_info">
											<div class="product-review">
												<h5 class="manufacturer">
													<a href="shop-left-sidebar.html">Graphic Corner</a>
												</h5>
												<div class="rating-box">
													<ul class="rating">
														<li><i class="fa fa-star-o"></i></li>
														<li><i class="fa fa-star-o"></i></li>
														<li><i class="fa fa-star-o"></i></li>
														<li class="no-star"><i class="fa fa-star-o"></i></li>
														<li class="no-star"><i class="fa fa-star-o"></i></li>
													</ul>
												</div>
											</div>
											<h4>
												<a class="product_name" href="${pageContext.request.contextPath}/home/chitietsanpham/${laptop.id}"  style=" display: -webkit-box; -webkit-line-clamp: 2;  -webkit-box-orient: vertical; overflow: hidden;">${laptop.tenSanPham }</a>
											</h4>
											<div class="price-box">
												<c:set var="giaTien" value='${laptop.lstGTTT.get(0).giaTien }'></c:set>
												<span class="new-price"><fmt:formatNumber type="number" pattern="###,###.###" value="${giaTien}" /> VNĐ</span>
											</div>
										</div>
										<div class="add-actions">
											<ul class="add-actions-link">
												<li class="add-cart active"><a onclick='themVaoGio(${laptop.lstGTTT.get(0).id},1)'>Thêm vào giỏ</a></li>
												<li><a class="links-details" href="#"><i
														class="fa fa-heart-o"></i></a></li>
												<li><a href="#" title="quick view"
													class="quick-view-btn" data-toggle="modal"
													data-target="#exampleModalCenter" data-id="${laptop.id}"><i class="fa fa-eye" ></i></a></li>
											</ul>
										</div>
									</div>
								</div>
								<!-- single-product-wrap end -->
								
							</div>
							</c:forEach>
						</div>
						
					</div>
				</div>
				<!-- Li's Section Area End Here -->
			</div>
		</div>
	</section>
	<!-- Li's Smart Phone Product Area End Here -->
	<!-- Begin Li's Static Home Area -->
	<div class="li-static-home">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Begin Li's Static Home Image Area -->
					<div class="li-static-home-image"></div>
					<!-- Li's Static Home Image Area End Here -->
					<!-- Begin Li's Static Home Content Area -->
					<div class="li-static-home-content">
						<p>
							Giảm giá<span> -20% Off</span> Tuần này
						</p>
						<h2>Sản phẩm nổi bật</h2>
						<h2>Meito Accessories 2018</h2>
						<p class="schedule">
							Chỉ từ <span> $1209.00</span>
						</p>
						<div class="default-btn">
							<a href="shop-left-sidebar.html" class="links">Mua ngay</a>
						</div>
					</div>
					<!-- Li's Static Home Content Area End Here -->
				</div>
			</div>
		</div>
	</div>
	<!-- Li's Static Home Area End Here -->
	
	<!-- Begin Quick View | Modal Area -->
	<div class="modal fade modal-wrapper" id="exampleModalCenter">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="modal-inner-area row">
						<div class="col-lg-5 col-md-6 col-sm-6">
							<!-- Product Details Left -->
							<div class="product-details-left">
								
							</div>
							<!--// Product Details Left -->
						</div>

						<div class="col-lg-7 col-md-6 col-sm-6">
							<div class="product-details-view-content pt-60">
								<div class="product-info">
									<h2 class = "name-quick-view"></h2>
									<input class="lstGTTT-sp" style="display: none;">
									<input class="thuocTinhId-sp" style="display: none;">
									<span class="product-details-ref">Reference: demo_15</span>
									<div class="rating-box pt-20">
										<ul class="rating rating-with-review-item">
											<li><i class="fa fa-star-o"></i></li>
											<li><i class="fa fa-star-o"></i></li>
											<li><i class="fa fa-star-o"></i></li>
											<li class="no-star"><i class="fa fa-star-o"></i></li>
											<li class="no-star"><i class="fa fa-star-o"></i></li>
											<li class="review-item"><a href="#">Read Review</a></li>
											<li class="review-item"><a href="#">Write Review</a></li>
										</ul>
									</div>
									<div class="price-box pt-20">
										<span class="new-price new-price-2 price-quick-view"></span>
									</div>
									<div class="product-variants">
										<div class="row thuocTinh">
											<div class="col-md-6">
												<div class="produt-variants-size thuoc-tinh-1" style="display: block;">
													<label></label> 
												</div>
											</div>
											<div class="col-md-6">
												<div class="produt-variants-size thuoc-tinh-2" style="display: block;">
													<label></label> 
												</div>
											</div>
										</div>
									</div>
									<div class="single-add-to-cart">
										<form action="#" class="cart-quantity">
											<div class="quantity">
												<label>Số lượng</label>
												<div class="cart-plus-minus">
													<input class="cart-plus-minus-box so-luong-modal" value="1" type="text">
													<div class="dec qtybutton">
														<i class="fa fa-angle-down"></i>
													</div>
													<div class="inc qtybutton">
														<i class="fa fa-angle-up"></i>
													</div>
												</div>
											</div>
											<a class="add-to-cart modal-add-to-cart">Thêm vào giỏ hàng</a>
										</form>
									</div>
									<div class="product-additional-info pt-25">
										<a class="wishlist-btn" href="wishlist.html"><i
											class="fa fa-heart-o"></i>Add to wishlist</a>
										<div class="product-social-sharing pt-25">
											<ul>
												<li class="facebook"><a href="#"><i
														class="fa fa-facebook"></i>Facebook</a></li>
												<li class="twitter"><a href="#"><i
														class="fa fa-twitter"></i>Twitter</a></li>
												<li class="google-plus"><a href="#"><i
														class="fa fa-google-plus"></i>Google +</a></li>
												<li class="instagram"><a href="#"><i
														class="fa fa-instagram"></i>Instagram</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Quick View | Modal Area End Here -->
</body>
</html>