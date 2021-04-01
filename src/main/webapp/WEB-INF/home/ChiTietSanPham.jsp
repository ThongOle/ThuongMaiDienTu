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
	var sanphamid = $('.sanPhamId-ct').val();
	$.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/home/laylistGTTT/"+sanphamid,
		dataType : 'json',
		contentType : "application/json; charset=utf-8",
		async : true,
		success: function(lstGTTT){
			var thongtin ="";
			$('.lstGTTT-sp').val(JSON.stringify(lstGTTT));
			$('.thuocTinhId-sp').val(lstGTTT[0].id);
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
		}
		
	})
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
		$('.sp-price').html(formatTien.format(lstGTTT[dem-1].giaTien));
		
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
		$('.sp-price').html(formatTien.format(lstGTTT[dem-1].giaTien));
		
	});
	
	$('.btn-add-to-cart').click( function(){
		var soLuong = $('.soLuongSanPham').val();
		var thuocTinhId = $('.thuocTinhId-sp').val();
		themVaoGio(thuocTinhId, soLuong);
	});
	
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
});

</script>
<c:url var="UrlAnh" value="/images"> </c:url>
<!-- Begin Li's Breadcrumb Area -->
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li class="active">Single Product</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- content-wraper start -->
            <div class="content-wraper">
                <div class="container">
                    <div class="row single-product-area">
                        <div class="col-lg-5 col-md-6">
                           <!-- Product Details Left -->
                            <div class="product-details-left">
                                <div class="product-details-images slider-navigation-1">
                                	<input value="${objSanPham.id }" style="display: none;" class="sanPhamId-ct">
                                     <c:forEach var="anhSP" items="${objSanPham.lstAnhSP }">
                                    <div class="lg-image">
                                        <a class="popup-img venobox vbox-item" href="${UrlAnh }/${anhSP.anh}" data-gall="myGallery">
                                            <img src="${UrlAnh }/${anhSP.anh}" alt="product image">
                                        </a>
                                    </div>
                    				</c:forEach>
                                </div>
                                <div class="product-details-thumbs slider-thumbs-1">                                        
                                    <c:forEach var="anhSP" items="${objSanPham.lstAnhSP }">
                                    <div class="sm-image"><img src="${UrlAnh }/${anhSP.anh}" alt="product image thumb"></div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!--// Product Details Left -->
                        </div>

                        <div class="col-lg-7 col-md-6">
                            <div class="product-details-view-content pt-60">
                                <div class="product-info">
                                    <h2>${objSanPham.tenSanPham }</h2>
                                    <input style="display: none;" class="lstGTTT-sp">
                                    <input style="display: none;" class="thuocTinhId-sp">
                                    
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
                                    	<c:set var="giaTien" value='${objSanPham.lstGTTT.get(0).giaTien }'></c:set>
                                        <span class="new-price new-price-2 sp-price"><fmt:formatNumber type="number" pattern="###,###.###" value="${giaTien}" /> đ</span>
                                    </div>
                                    
                                    <div class="product-variants">
                                        <div class="produt-variants-size">
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
                                    </div>
                                    <div class="single-add-to-cart">
                                        <form action="#" class="cart-quantity">
                                            <div class="quantity">
                                                <label>Số lượng</label>
                                                <div class="cart-plus-minus">
                                                    <input class="cart-plus-minus-box soLuongSanPham" value="1" type="text">
                                                    <div class="dec qtybutton"><i class="fa fa-angle-down"></i></div>
                                                    <div class="inc qtybutton"><i class="fa fa-angle-up"></i></div>
                                                </div>
                                            </div>
                                            <button class="add-to-cart btn-add-to-cart" >Thêm vào giỏ hàng</button>
                                        </form>
                                    </div>
                                    <div class="product-additional-info pt-25">
                                        <a class="wishlist-btn" href="wishlist.html"><i class="fa fa-heart-o"></i>Add to wishlist</a>
                                        <div class="product-social-sharing pt-25">
                                            <ul>
                                                <li class="facebook"><a href="#"><i class="fa fa-facebook"></i>Facebook</a></li>
                                                <li class="twitter"><a href="#"><i class="fa fa-twitter"></i>Twitter</a></li>
                                                <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i>Google +</a></li>
                                                <li class="instagram"><a href="#"><i class="fa fa-instagram"></i>Instagram</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="block-reassurance">
                                        <ul>
                                            <li>
                                                <div class="reassurance-item">
                                                    <div class="reassurance-icon">
                                                        <i class="fa fa-check-square-o"></i>
                                                    </div>
                                                    <p>Hoàn tiền 111% nếu phát hiện hàng giả</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="reassurance-item">
                                                    <div class="reassurance-icon">
                                                        <i class="fa fa-truck"></i>
                                                    </div>
                                                    <p>Giao hàng nhanh chóng</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="reassurance-item">
                                                    <div class="reassurance-icon">
                                                        <i class="fa fa-exchange"></i>
                                                    </div>
                                                    <p>Hoàn trả hàng nhanh chóng</p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
            <!-- content-wraper end -->
            <!-- Begin Product Area -->
            <div class="product-area pt-35">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="li-product-tab">
                                <ul class="nav li-product-menu">
                                   <li><a class="active" data-toggle="tab" href="#description"><span>Description</span></a></li>
                                   <li><a data-toggle="tab" href="#product-details"><span>Product Details</span></a></li>
                                   <li><a data-toggle="tab" href="#reviews"><span>Reviews</span></a></li>
                                </ul>               
                            </div>
                            <!-- Begin Li's Tab Menu Content Area -->
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="description" class="tab-pane active show" role="tabpanel">
                            <div class="product-description">
                                ${objSanPham.moTa }
                            </div>
                        </div>
                        <div id="product-details" class="tab-pane" role="tabpanel">
                            <div class="product-details-manufacturer">
                                <a href="#">
                                    <img src="images/product-details/1.jpg" alt="Product Manufacturer Image">
                                </a>
                                <p><span>Reference</span> demo_7</p>
                                <p><span>Reference</span> demo_7</p>
                            </div>
                        </div>
                        <div id="reviews" class="tab-pane" role="tabpanel">
                            <div class="product-reviews">
                                <div class="product-details-comment-block">
                                    <div class="comment-review">
                                        <span>Grade</span>
                                        <ul class="rating">
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li><i class="fa fa-star-o"></i></li>
                                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                                            <li class="no-star"><i class="fa fa-star-o"></i></li>
                                        </ul>
                                    </div>
                                    <div class="comment-author-infos pt-25">
                                        <span>HTML 5</span>
                                        <em>01-12-18</em>
                                    </div>
                                    <div class="comment-details">
                                        <h4 class="title-block">Demo</h4>
                                        <p>Plaza</p>
                                    </div>
                                    <div class="review-btn">
                                        <a class="review-links" href="#" data-toggle="modal" data-target="#mymodal">Write Your Review!</a>
                                    </div>
                                    <!-- Begin Quick View | Modal Area -->
                                    <div class="modal fade modal-wrapper" id="mymodal" >
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-body">
                                                    <h3 class="review-page-title">Write Your Review</h3>
                                                    <div class="modal-inner-area row">
                                                        <div class="col-lg-6">
                                                           <div class="li-review-product">
                                                               <img src="images/product/large-size/3.jpg" alt="Li's Product">
                                                               <div class="li-review-product-desc">
                                                                   <p class="li-product-name">Today is a good day Framed poster</p>
                                                                   <p>
                                                                       <span>Beach Camera Exclusive Bundle - Includes Two Samsung Radiant 360 R3 Wi-Fi Bluetooth Speakers. Fill The Entire Room With Exquisite Sound via Ring Radiator Technology. Stream And Control R3 Speakers Wirelessly With Your Smartphone. Sophisticated, Modern Design </span>
                                                                   </p>
                                                               </div>
                                                           </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <div class="li-review-content">
                                                                <!-- Begin Feedback Area -->
                                                                <div class="feedback-area">
                                                                    <div class="feedback">
                                                                        <h3 class="feedback-title">Our Feedback</h3>
                                                                        <form action="#">
                                                                            <p class="your-opinion">
                                                                                <label>Your Rating</label>
                                                                                <span>
                                                                                    <select class="star-rating">
                                                                                      <option value="1">1</option>
                                                                                      <option value="2">2</option>
                                                                                      <option value="3">3</option>
                                                                                      <option value="4">4</option>
                                                                                      <option value="5">5</option>
                                                                                    </select>
                                                                                </span>
                                                                            </p>
                                                                            <p class="feedback-form">
                                                                                <label for="feedback">Your Review</label>
                                                                                <textarea id="feedback" name="comment" cols="45" rows="8" aria-required="true"></textarea>
                                                                            </p>
                                                                            <div class="feedback-input">
                                                                                <p class="feedback-form-author">
                                                                                    <label for="author">Name<span class="required">*</span>
                                                                                    </label>
                                                                                    <input id="author" name="author" value="" size="30" aria-required="true" type="text">
                                                                                </p>
                                                                                <p class="feedback-form-author feedback-form-email">
                                                                                    <label for="email">Email<span class="required">*</span>
                                                                                    </label>
                                                                                    <input id="email" name="email" value="" size="30" aria-required="true" type="text">
                                                                                    <span class="required"><sub>*</sub> Required fields</span>
                                                                                </p>
                                                                                <div class="feedback-btn pb-15">
                                                                                    <a href="#" class="close" data-dismiss="modal" aria-label="Close">Close</a>
                                                                                    <a href="#">Submit</a>
                                                                                </div>
                                                                            </div>
                                                                        </form>
                                                                    </div>
                                                                </div>
                                                                <!-- Feedback Area End Here -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>   
                                    <!-- Quick View | Modal Area End Here -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Product Area End Here -->
            <!-- Begin Li's Laptop Product Area -->
            <section class="product-area li-laptop-product pt-30 pb-50">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Section Area -->
                        <div class="col-lg-12">
                            <div class="li-section-title">
                                <h2>
                                    <span>Các sản phẩm cùng danh mục:</span>
                                </h2>
                            </div>
                            <div class="row">
                                <div class="product-active owl-carousel">
                                <c:forEach var="sp" items="${lstSanPham }">
                                    <div class="col-lg-12">
                                        <!-- single-product-wrap start -->
                                        <div class="single-product-wrap">
                                            <div class="product-image">
                                                <a href="${pageContext.request.contextPath}/home/chitietsanpham/${sp.id}">
                                                    <img src="${UrlAnh }/${sp.lstAnhSP[0].anh}" alt="Li's Product Image">
                                                </a>
                                                <span class="sticker">New</span>
                                            </div>
                                            <div class="product_desc">
                                                <div class="product_desc_info">
                                                    <div class="product-review">
                                                        
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
                                                    <h4><a class="product_name" href="${pageContext.request.contextPath}/home/chitietsanpham/${sp.id}">${sp.tenSanPham }</a></h4>
                                                    <div class="price-box">
                                                    	<c:set var="giaTien" value='${sp.lstGTTT.get(0).giaTien }'></c:set>
                                                        <span class="new-price"><fmt:formatNumber type="number" pattern="###,###.###" value="${giaTien}" /> VNĐ</span>
                                                    </div>
                                                </div>
                                                <div class="add-actions">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart active"><a onclick='themVaoGio(${sp.lstGTTT.get(0).id},1)'>Thêm vào giỏ</a></li>
                                                        
                                                        <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li>
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
</body>
</html>