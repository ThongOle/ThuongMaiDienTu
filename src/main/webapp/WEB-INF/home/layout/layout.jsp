<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">

<!-- index-231:32-->
<head>
<c:url value="/resources" var="resources"></c:url>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<!-- Title Page-->
<title><tiles:getAsString name="title" /></title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${resources }/images/favicon.png">
<!-- Material Design Iconic Font-V2.2.0 -->
<link rel="stylesheet"
	href="${resources }/css/material-design-iconic-font.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="${resources }/css/font-awesome.min.css">
<!-- Font Awesome Stars-->
<link rel="stylesheet" href="${resources }/css/fontawesome-stars.css">
<!-- Meanmenu CSS -->
<link rel="stylesheet" href="${resources }/css/meanmenu.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="${resources }/css/owl.carousel.min.css">
<!-- Slick Carousel CSS -->
<link rel="stylesheet" href="${resources }/css/slick.css">
<!-- Animate CSS -->
<link rel="stylesheet" href="${resources }/css/animate.css">
<!-- Jquery-ui CSS -->
<link rel="stylesheet" href="${resources }/css/jquery-ui.min.css">
<!-- Venobox CSS -->
<link rel="stylesheet" href="${resources }/css/venobox.css">
<!-- Nice Select CSS -->
<link rel="stylesheet" href="${resources }/css/nice-select.css">
<!-- Magnific Popup CSS -->
<link rel="stylesheet" href="${resources }/css/magnific-popup.css">
<!-- Bootstrap V4.1.3 Fremwork CSS -->
<link rel="stylesheet" href="${resources }/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"/>
<!-- Helper CSS -->
<link rel="stylesheet" href="${resources }/css/helper.css">
<!-- Main Style CSS -->
<link rel="stylesheet" href="${resources }/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="${resources }/css/responsive.css">
<!-- Modernizr js -->
<script src="${resources }/js/vendor/modernizr-2.8.3.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
	<script type="text/javascript">
	//format tiền 
	
	var formatTien = new Intl.NumberFormat('de-DE', {
		  style: 'currency',
		  currency: 'VND',
		});
	var ajaxgiohang = function(data){
		return $.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/home/giohang-preview",
		dataType : 'json',
		data: data,
		contentType : "application/json; charset=utf-8",
		async : true
	})
	}
	
	// tạo preview giỏ hàng
	function previewgiohang(){
		$('.minicart-product-list').empty();
		
		//lấy local
		var lstId = localStorage.getItem('TTSP');
		var ajaxgiohangpreview = ajaxgiohang({
			lstId: lstId
		})
		
	ajaxgiohangpreview.done(function(lstTT){
		var dem =0;
		lstId = JSON.parse(lstId);
		for (var i =0; i< lstId.length; i++){
			dem += lstId[i].soLuong;
		}
		
		 $('.soluongtronggio').text(dem);
		 var gia =0;
		 var sanpham="";
		 for (var i =0; i<lstTT.length; i++){
			 gia += lstTT[i].giaTien * lstId[i].soLuong;
			 sanpham += "<li><a href='single-product.html'class='minicart-product-image'>"
			 		+"<img src='<c:url value='/images/"+lstTT[i].objSanPham.lstAnhSP[0].anh+"'/>'>"
					 +"</a><div class='minicart-product-details'><h6>"
					 + "<a href='single-product.html'>"+lstTT[i].objSanPham.tenSanPham+"</a></h6>"
					+ "<span>"+ formatTien.format(lstTT[i].giaTien)+" x "+lstId[i].soLuong+"</span></div>"
					+ "<button class='close' data-value='"+lstTT[i].id+"'><i class='fa fa-close'></i></button></li>";
		
		 }
		 $('.tong-cong-minicart').text(formatTien.format(gia));
		 $('.minicart-product-list').append(sanpham);
		  
	});
	}
	//tạo function gio hang
	function giohang(){
		$('.tbodygiohang').empty();
		var lstId = localStorage.getItem('TTSP');
		var ajaxgiohangfull = ajaxgiohang({
			lstId: lstId
		})
		var sanpham="";
		ajaxgiohangfull.done(function(lstTT){
			lstId = JSON.parse(lstId);
			var tongGia = 0;
			for (var i = 0 ; i <lstTT.length; i++){
				 tongGia += lstTT[i].giaTien * lstId[i].soLuong;
				 var thuocTinh = lstTT[i].thuocTinh1;
				 if (lstTT[i].thuocTinh2 != null){
					 thuocTinh += "; "+ lstTT[i].thuocTinh2;
				 }
				sanpham += "<tr><td class='li-product-thumbnail' style='width: 150px'><a><img style='width: 100%' src='<c:url value='/images/"+lstTT[i].objSanPham.lstAnhSP[0].anh+"'/>'></a></td>" 
						+ " <td class='li-product-name'><a>"+lstTT[i].objSanPham.tenSanPham +"</a></td>"
                		+ " <td class='li-product-name'><a>"+thuocTinh+"</a></td> "
                		+ "<td class='li-product-price'><span class='amount donGia'>"+formatTien.format(lstTT[i].giaTien)+"</span></td> "
                		+ "<td class='quantity'><div class='cart-plus-minus'>"
                		+ " <input class='cart-plus-minus-box' value='"+lstId[i].soLuong+"' type='text' data-gia='"+lstTT[i].giaTien+"' data-value='"+lstTT[i].id+"'> "
                		+ " <div class='dec qtybutton'><i class='fa fa-angle-down'></i></div>"
                		+"<div class='inc qtybutton'><i class='fa fa-angle-up'></i></div>"
                		+ "</div> </td>"
                		+ "<td class='product-subtotal'><span class='amount tongDonGia'>"+formatTien.format(lstTT[i].giaTien*lstId[i].soLuong) +"</span></td> "
              			+ "<td class='li-product-remove'><a><i class='fa fa-times xoagiohang' data-gia='"+lstTT[i].giaTien +"' data-value='"+lstTT[i].id+"'></i></a></td></tr>"
			}
			$('.tbodygiohang').append(sanpham);
			 $('.giohangtamtinh').text(formatTien.format(tongGia));
			 $('.giohangtamtinh').data('value', tongGia);
			 $('.giohangthanhtien').text(formatTien.format(tongGia));
			 
		})
	
	}
	// tạo function đơn hàng 
	function donhang(){
		var lstId = localStorage.getItem('TTSP');
		var ajaxgiohangfull = ajaxgiohang({
			lstId: lstId
		})
		ajaxgiohangfull.done(function(lstTT){
			lstId = JSON.parse(lstId);
			var tonggia = 0;
			for (var i = 0 ; i <lstTT.length; i++){
				tonggia += lstTT[i].giaTien *lstId[i].soLuong;
				$('.tbodydonhang')
				.append($('<tr>', {class: 'cart_item'})
					.append($('<td>', {class: 'cart-product-name'}).text(lstTT[i].objSanPham.tenSanPham)
							.append($('<strong>', {class:'product-quantity'}).text(" x " + lstId[i].soLuong)))
					.append($('<td>', {class: 'cart-product-total'})
							.append($('<span>', {class: 'amount'}).text(formatTien.format(lstTT[i].giaTien *lstId[i].soLuong)))))
			}
			$('.donhangtamtinh').text(formatTien.format(tonggia));
			$('.donhangtongcong').text(formatTien.format(tonggia));
		});
	}
	// tạo ajax lấy địa chỉ
	var ajaxdiachi = function(data){
		return $.ajax({
		type : "GET",
		url : "${pageContext.request.contextPath}/home/laydiachi",
		dataType : 'json',
		data: data,
		contentType : "application/json; charset=utf-8",
		async : true
	})
	}
	function layTinh(tinhId){
		var ajaxTinh = ajaxdiachi({
			diaChiId: 0
			})
			ajaxTinh.done(function(lstDC){
				var thongtin= "<select class='nice-select wide select-tinh'>"
							+"<option value='0'>-- Chọn tỉnh --</option>";
				for (var i = 0 ; i < lstDC.length ; i++){
					thongtin += "<option value='"+lstDC[i].id+"'>"+lstDC[i].ten+"</option>"
				}
				thongtin+= "</select>";
				
				$('.label-tinh').after(thongtin);
				$('.country-select .select-tinh').val(tinhId);
				
			})
	}
	function layHuyen(tinhId, huyenId){
		var ajaxHuyen = ajaxdiachi({
			diaChiId: tinhId
			})
			ajaxHuyen.done(function(lstDC){
				var thongtin= "<select class='nice-select wide select-huyen' >"
							+"<option value='0'>-- Chọn huyện --</option>";
				for (var i = 0 ; i < lstDC.length ; i++){
					thongtin += "<option value='"+lstDC[i].id+"'>"+lstDC[i].ten+"</option>"
				}
				thongtin+= "</select>";
				$('.country-select .select-huyen').remove();
				$('.label-huyen').after(thongtin);
				$('.country-select .select-huyen').val(huyenId);
				
			})
	}
	function layXa(huyenId, xaId){
		var ajaxXa = ajaxdiachi({
			diaChiId: huyenId
			})
			ajaxXa.done(function(lstDC){
				var thongtin= "<select class='nice-select wide select-xa' >"
							+"<option value='0'>-- Chọn xã --</option>";
				for (var i = 0 ; i < lstDC.length ; i++){
					thongtin += "<option value='"+lstDC[i].id+"'>"+lstDC[i].ten+"</option>"
				}
				thongtin+= "</select>";
				$('.country-select .select-xa').remove();
				$('.label-xa').after(thongtin);
				$('.country-select .select-xa').val(xaId);
				
			})
	}
	// function lưu dữ lieu lên local storeage
	function themVaoGio(idTT, soluong){
		soluong = parseInt(soluong);
		if (localStorage) {
			
		    var ttSP = localStorage.getItem('TTSP');
		    
		    if (ttSP == null){
		    	var objSP={
				idTT: idTT,
				soLuong: soluong
				}
		    	var objSPs = [];
		    	objSPs[0] = objSP;
		    	ttSP = JSON.stringify(objSPs);
		    }else{
		    	ttSP = JSON.parse(ttSP);
		    	var xacnhan = false;
		    	for (var i = 0 ; i< ttSP.length; i++){
		    		
		    		if(ttSP[i].idTT == idTT ){
		    			
		    			ttSP[i].soLuong = ttSP[i].soLuong + soluong;
		    			xacnhan = true;
		    			break;
		    		}
		    		
		    	}
		    	if (!xacnhan){
		    		var objSP={
		    			idTT: idTT,
		    			soLuong: soluong
		    		}
		    		
			    	ttSP.push(objSP);
			    	
		    	}
		    	ttSP = JSON.stringify(ttSP);
		    }
		    
			localStorage.setItem('TTSP', ttSP);
			// modal thêm mới thành công SweetAlert
			swal({
  				text: "Thêm mới giỏ hàng thành công",
 				icon: "success",
 				button: false,
 				timer: 1500
			});
			previewgiohang();
		} else {
		    alert('Trình duyệt của bạn không hỗ trợ localStorage. Hãy nâng cấp trình duyệt để sử dụng!');
		}
		
		
	}
	
	
	
	</script>
	<!-- jQuery-V1.12.4 -->
	<script src="${resources }/js/vendor/jquery-1.12.4.min.js"></script>
	
	
	
	<!--[if lt IE 8]>
		<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
	<![endif]-->
	<!-- Begin Body Wrapper -->
	<div class="body-wrapper">

		<!--  Header -->
		<tiles:insertAttribute name="header" />
		<!-- Body -->
		<tiles:insertAttribute name="body" />
		<!-- Begin Footer Area -->
		<tiles:insertAttribute name="footer" />
		<!-- Footer Area End Here -->

	</div>
	<!-- Body Wrapper End Here -->
	<!-- Popper js -->
	<script src="${resources }/js/vendor/popper.min.js"></script>  
	<!-- Bootstrap V4.1.3 Fremwork js -->
	<script src="${resources }/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" ></script>
	<!-- Jquery-ui -->
	<script src="${resources }/js/jquery-ui.min.js"></script>
	
	
	<!-- Ajax Mail js -->
	<script src="${resources }/js/ajax-mail.js"></script>
	<!-- Meanmenu js -->
	<script src="${resources }/js/jquery.meanmenu.min.js"></script>
	<!-- Wow.min js -->
	<script src="${resources }/js/wow.min.js"></script>
	<!-- Slick Carousel js -->
	<script src="${resources }/js/slick.min.js"></script>
	<!-- Owl Carousel-2 js -->
	<script src="${resources }/js/owl.carousel.min.js"></script>
	<!-- Magnific popup js -->
	<script src="${resources }/js/jquery.magnific-popup.min.js"></script>
	<!-- Isotope js -->
	<script src="${resources }/js/isotope.pkgd.min.js"></script>
	<!-- Imagesloaded js -->
	<script src="${resources }/js/imagesloaded.pkgd.min.js"></script>
	<!-- Mixitup js -->
	<script src="${resources }/js/jquery.mixitup.min.js"></script>
	<!-- Countdown -->
	<script src="${resources }/js/jquery.countdown.min.js"></script>
	<!-- Counterup -->
	<script src="${resources }/js/jquery.counterup.min.js"></script>
	<!-- Waypoints -->
	<script src="${resources }/js/waypoints.min.js"></script>
	<!-- Barrating -->
	<script src="${resources }/js/jquery.barrating.min.js"></script>
	
	<!-- Venobox -->
	<script src="${resources }/js/venobox.min.js"></script>
	<!-- Nice Select js -->
	<script src="${resources }/js/jquery.nice-select.min.js"></script>
	<!-- ScrollUp js -->
	<script src="${resources }/js/scrollUp.min.js"></script>
	<!-- Main/Activator js -->
	<script src="${resources }/js/main.js"></script>
	
	

</body>

<!-- index-231:38-->
</html>
