<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		giohang();
		$('.tbodygiohang').on('click', '.xoagiohang',function(){
			var idTTXoa =  $(this).data('value');
			var giaSanPham = $(this).data('gia');
			var ttSP = localStorage.getItem('TTSP');
			ttSP = JSON.parse(ttSP);
			var soLuong = 0;
			for (var i = 0; i< ttSP.length; i++){
				if(ttSP[i].idTT == idTTXoa){
					soLuong = ttSP[i].soLuong;
					ttSP.splice(i,1);
					break;
				}
			}
			ttSP = JSON.stringify(ttSP);
			localStorage.setItem('TTSP', ttSP);
			previewgiohang();
			$(this).parent().parent().parent().remove();
			var tongGia = $('.giohangtamtinh').data('value');
			tongGia = tongGia - giaSanPham *soLuong;
			 $('.giohangtamtinh').text(formatTien.format(tongGia));
			 $('.giohangthanhtien').text(formatTien.format(tongGia));
			 $('.giohangtamtinh').data('value', tongGia)
		});
		 $('.tbodygiohang').on('click', '.qtybutton' , function() {
			
			 var $button = $(this);
			    var oldValue = $button.parent().find("input").val();
			    var idTT = $button.parent().find("input").data('value');
			    var gia =  $button.parent().find("input").data('gia');
			    var ttSP = localStorage.getItem('TTSP');   
				 ttSP = JSON.parse(ttSP);
				
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
			 
			    for (var i = 0 ; i< ttSP.length; i++){
		    		if(ttSP[i].idTT == idTT ){
		    			
		    			ttSP[i].soLuong = newVal;
		    			break;
		    		}
		    		
		    	}
			 
			    ttSP = JSON.stringify(ttSP);
			    localStorage.setItem('TTSP', ttSP);
			    previewgiohang();
			    $button.parent().find("input").val(newVal);
			    var giaSanPham = gia * newVal;
			    $button.parent().parent().parent().find('.tongDonGia').text(formatTien.format(giaSanPham));
			   
			     var tongGia = $('.giohangtamtinh').data('value');
			     tongGia = tongGia - gia* oldValue + gia* newVal;
			     $('.giohangtamtinh').text(formatTien.format(tongGia));
				 $('.giohangthanhtien').text(formatTien.format(tongGia));
				 $('.giohangtamtinh').data('value', tongGia);
			     
			  	
			    
		});
	});
	

</script>
<!-- Begin Li's Breadcrumb Area -->
            <div class="breadcrumb-area">
                <div class="container">
                    <div class="breadcrumb-content">
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li class="active">Shopping Cart</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- Li's Breadcrumb Area End Here -->
            <!--Shopping Cart Area Strat-->
            <div class="Shopping-cart-area pt-60 pb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <form action="#">
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
                                                 <th class="li-product-remove">Xóa</th>
                                            </tr>
                                        </thead>
                                        <tbody class="tbodygiohang">
                                            
                                           
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="coupon-all">
                                            <div class="coupon">
                                                <input id="coupon_code" class="input-text" name="coupon_code" value="" placeholder="Coupon code" type="text">
                                                <input class="button" name="apply_coupon" value="Apply coupon" type="submit">
                                            </div>
                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-5 ml-auto">
                                        <div class="cart-page-total">
                                            <h2>Tổng tiền</h2>
                                            <ul>
                                                <li>Tạm tính <span class="giohangtamtinh"></span></li>
                                                <li>Thành tiền <span class="giohangthanhtien"></span></li>
                                            </ul>
                                            <a href="${pageContext.request.contextPath}/home/checkout">Tiến hành thanh toán</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--Shopping Cart Area End-->
</body>
</html>