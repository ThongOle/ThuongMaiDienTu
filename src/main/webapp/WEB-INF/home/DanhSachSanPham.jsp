<%@ page language="java" contentType="text/html; charset=UFT-8"
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
							+"<img src='${pageContext.request.contextPath}/images/"+lstGTTT[0].objSanPham.lstAnhSP[i].anh+"' alt='product image'>"
							+"</div>";
				}
				
				for (var i = 0; i< sizeASP ; i++){
					anhnho += "<div class='sm-image'>"
							+"<img src='${pageContext.request.contextPath}/images/"+lstGTTT[0].objSanPham.lstAnhSP[i].anh+ "'>"
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
})
</script>
<c:url value="/resources" var="resources"></c:url>
 <!-- Begin Li's Breadcrumb Area -->
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li class="active">Shop Left Sidebar</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!-- Begin Li's Content Wraper Area -->
            <div class="content-wraper pt-60 pb-60 pt-sm-30">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 order-1 order-lg-2">
                            <!-- Begin Li's Banner Area -->
                            <div class="single-banner shop-page-banner">
                                <a href="#">
                                    <img src="${resources }/images/bg-banner/2.jpg" alt="Li's Static Banner">
                                </a>
                            </div>
                            <!-- Li's Banner Area End Here -->
                            <!-- shop-top-bar start -->
                            <div class="shop-top-bar mt-30">
                                <div class="shop-bar-inner">
                                    <div class="product-view-mode">
                                        <!-- shop-item-filter-list start -->
                                        <ul class="nav shop-item-filter-list" role="tablist">
                                            <li class="active" role="presentation"><a aria-selected="true" class="active show" data-toggle="tab" role="tab" aria-controls="grid-view" href="#grid-view"><i class="fa fa-th"></i></a></li>
                                            <li role="presentation"><a data-toggle="tab" role="tab" aria-controls="list-view" href="#list-view"><i class="fa fa-th-list"></i></a></li>
                                        </ul>
                                        <!-- shop-item-filter-list end -->
                                    </div>
                                    <div class="toolbar-amount">
                                        <span>Showing 1 to 9 of 15</span>
                                    </div>
                                </div>
                                <!-- product-select-box start -->
                                <div class="product-select-box">
                                    <div class="product-short">
                                        <p>Sort By:</p>
                                        <select class="nice-select">
                                            <option value="trending">Relevance</option>
                                            <option value="sales">Name (A - Z)</option>
                                            <option value="sales">Name (Z - A)</option>
                                            <option value="rating">Price (Low &gt; High)</option>
                                            <option value="date">Rating (Lowest)</option>
                                            <option value="price-asc">Model (A - Z)</option>
                                            <option value="price-asc">Model (Z - A)</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- product-select-box end -->
                            </div>
                            <!-- shop-top-bar end -->
                            <!-- shop-products-wrapper start -->
                            <div class="shop-products-wrapper">
                                <div class="tab-content">
                                    <div id="grid-view" class="tab-pane fade active show" role="tabpanel">
                                        <div class="product-area shop-product-area">
                                            <div class="row">
                                            <c:if test="${not empty shopSP }">
                                            <c:forEach var ="sanphamshop" items="${shopSP }">
                                            
                                                <div class="col-lg-4 col-md-4 col-sm-6 mt-40">
                                                    <!-- single-product-wrap start -->
                                                    <div class="single-product-wrap">
                                                        <div class="product-image">
                                                            <a href="${pageContext.request.contextPath}/home/chitietsanpham/${sanphamshop.id}">
                                                                <img src="<c:url value="/images/${sanphamshop.lstAnhSP.get(0).anh }"/>" alt="Li's Product Image">
                                                            </a>
                                                            <span class="sticker">New</span>
                                                        </div>
                                                        <div class="product_desc">
                                                            <div class="product_desc_info">
                                                                <div class="product-review">
                                                                    <h5 class="manufacturer">
                                                                        <a href="product-details.html">Graphic Corner</a>
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
                                                                <h4><a class="product_name" href="${pageContext.request.contextPath}/home/chitietsanpham/${sanphamshop.id}" style=" display: -webkit-box; -webkit-line-clamp: 2;  -webkit-box-orient: vertical; overflow: hidden;">${sanphamshop.tenSanPham }</a></h4>
                                                                <div class="price-box">
                                                                <c:set var="giaTien" value='${sanphamshop.lstGTTT.get(0).giaTien }'></c:set>
                                                                    <span class="new-price"><fmt:formatNumber type="number" pattern="###,###.###" value="${giaTien}" /> VNĐ</span>
                                                                </div>
                                                            </div>
                                                            <div class="add-actions">
                                                                <ul class="add-actions-link">
                                                                    <li class="add-cart active"><a onclick='themVaoGio(${sanphamshop.lstGTTT.get(0).id},1)'>Thêm vào giỏ</a></li>
                                                                    <li><a href="#" title="quick view" class="quick-view-btn" data-toggle="modal" data-target="#exampleModalCenter" data-id="${sanphamshop.id}"><i class="fa fa-eye"></i></a></li>
                                                                    <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- single-product-wrap end -->
                                                </div>
                                                </c:forEach>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="paginatoin-area">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 pt-xs-15">
                                                <p>Showing 1-12 of 13 item(s)</p>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <ul class="pagination-box pt-xs-20 pb-xs-15">
                                                    <li><a href="#" class="Previous"><i class="fa fa-chevron-left"></i> Previous</a>
                                                    </li>
                                                    <li class="active"><a href="#">1</a></li>
                                                    <li><a href="#">2</a></li>
                                                    <li><a href="#">3</a></li>
                                                    <li>
                                                      <a href="#" class="Next"> Next <i class="fa fa-chevron-right"></i></a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- shop-products-wrapper end -->
                        </div>
                        <div class="col-lg-3 order-2 order-lg-1">
                            <!--sidebar-categores-box start  -->
                            <div class="sidebar-categores-box mt-sm-30 mt-xs-30">
                                <div class="sidebar-title">
                                    <h2>Laptop</h2>
                                </div>
                                <!-- category-sub-menu start -->
                                <div class="category-sub-menu">
                                    <ul>
                                        <li class="has-sub"><a href="# ">Prime Video</a>
                                            <ul>
                                                <li><a href="#">All Videos</a></li>
                                                <li><a href="#">Blouses</a></li>
                                                <li><a href="#">Evening Dresses</a></li>
                                                <li><a href="#">Summer Dresses</a></li>
                                                <li><a href="#">T-Rent or Buy</a></li>
                                                <li><a href="#">Your Watchlist</a></li>
                                                <li><a href="#">Watch Anywhere</a></li>
                                                <li><a href="#">Getting Started</a></li>  
                                            </ul>
                                        </li>
                                        <li class="has-sub"><a href="#">Computer</a>
                                            <ul>
                                                <li><a href="#">TV & Video</a></li>
                                                <li><a href="#">Audio & Theater</a></li>
                                                <li><a href="#">Camera, Photo</a></li>
                                                <li><a href="#">Cell Phones</a></li>
                                                <li><a href="#">Headphones</a></li>
                                                <li><a href="#">Video Games</a></li>
                                                <li><a href="#">Wireless Speakers</a></li> 
                                            </ul>
                                        </li>
                                        <li class="has-sub"><a href="#">Electronics</a>
                                            <ul>
                                                <li><a href="#">Amazon Home</a></li>
                                                <li><a href="#">Kitchen & Dining</a></li>
                                                <li><a href="#">Bed & Bath</a></li>
                                                <li><a href="#">Appliances</a></li>    
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <!-- category-sub-menu end -->
                            </div>
                            <!--sidebar-categores-box end  -->
                            <!--sidebar-categores-box start  -->
                            <div class="sidebar-categores-box">
                                <div class="sidebar-title">
                                    <h2>Filter By</h2>
                                </div>
                                <!-- btn-clear-all start -->
                                <button class="btn-clear-all mb-sm-30 mb-xs-30">Clear all</button>
                                <!-- btn-clear-all end -->
                                <!-- filter-sub-area start -->
                                <div class="filter-sub-area">
                                    <h5 class="filter-sub-titel">Brand</h5>
                                    <div class="categori-checkbox">
                                        <form action="#">
                                            <ul>
                                                <li><input type="checkbox" name="product-categori"><a href="#">Prime Video (13)</a></li>
                                                <li><input type="checkbox" name="product-categori"><a href="#">Computers (12)</a></li>
                                                <li><input type="checkbox" name="product-categori"><a href="#">Electronics (11)</a></li>
                                            </ul>
                                        </form>
                                    </div>
                                 </div>
                                <!-- filter-sub-area end -->
                                <!-- filter-sub-area start -->
                                <div class="filter-sub-area pt-sm-10 pt-xs-10">
                                    <h5 class="filter-sub-titel">Categories</h5>
                                    <div class="categori-checkbox">
                                        <form action="#">
                                            <ul>
                                                <li><input type="checkbox" name="product-categori"><a href="#">Graphic Corner (10)</a></li>
                                                <li><input type="checkbox" name="product-categori"><a href="#"> Studio Design (6)</a></li>
                                            </ul>
                                        </form>
                                    </div>
                                 </div>
                                <!-- filter-sub-area end -->
                                <!-- filter-sub-area start -->
                                <div class="filter-sub-area pt-sm-10 pt-xs-10">
                                    <h5 class="filter-sub-titel">Size</h5>
                                    <div class="size-checkbox">
                                        <form action="#">
                                            <ul>
                                                <li><input type="checkbox" name="product-size"><a href="#">S (3)</a></li>
                                                <li><input type="checkbox" name="product-size"><a href="#">M (3)</a></li>
                                                <li><input type="checkbox" name="product-size"><a href="#">L (3)</a></li>
                                                <li><input type="checkbox" name="product-size"><a href="#">XL (3)</a></li>
                                            </ul>
                                        </form>
                                    </div>
                                </div>
                                <!-- filter-sub-area end -->
                                <!-- filter-sub-area start -->
                                <div class="filter-sub-area pt-sm-10 pt-xs-10">
                                    <h5 class="filter-sub-titel">Color</h5>
                                    <div class="color-categoriy">
                                        <form action="#">
                                            <ul>
                                                <li><span class="white"></span><a href="#">White (1)</a></li>
                                                <li><span class="black"></span><a href="#">Black (1)</a></li>
                                                <li><span class="Orange"></span><a href="#">Orange (3) </a></li>
                                                <li><span class="Blue"></span><a href="#">Blue  (2) </a></li>
                                            </ul>
                                        </form>
                                    </div>
                                </div>
                                <!-- filter-sub-area end -->
                                <!-- filter-sub-area start -->
                                <div class="filter-sub-area pt-sm-10 pb-sm-15 pb-xs-15">
                                    <h5 class="filter-sub-titel">Dimension</h5>
                                    <div class="categori-checkbox">
                                        <form action="#">
                                            <ul>
                                                <li><input type="checkbox" name="product-categori"><a href="#">40x60cm (6)</a></li>
                                                <li><input type="checkbox" name="product-categori"><a href="#">60x90cm (6)</a></li>
                                                <li><input type="checkbox" name="product-categori"><a href="#">80x120cm (6)</a></li>
                                            </ul>
                                        </form>
                                    </div>
                                 </div>
                                <!-- filter-sub-area end -->
                            </div>
                            <!--sidebar-categores-box end  -->
                            <!-- category-sub-menu start -->
                            <div class="sidebar-categores-box mb-sm-0 mb-xs-0">
                                <div class="sidebar-title">
                                    <h2>Laptop</h2>
                                </div>
                                <div class="category-tags">
                                    <ul>
                                        <li><a href="# ">Devita</a></li>
                                        <li><a href="# ">Cameras</a></li>
                                        <li><a href="# ">Sony</a></li>
                                        <li><a href="# ">Computer</a></li>
                                        <li><a href="# ">Big Sale</a></li>
                                        <li><a href="# ">Accessories</a></li>
                                    </ul>
                                </div>
                                <!-- category-sub-menu end -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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