<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:url var="home" value="/" scope="request" />
<style type="text/css">
.scroll-item {
	flex: 1;
	height: 320px;
	border-left: 1px solid #fff;
	overflow-y: scroll;
	background: #ffffff;
	padding-inline-start: 0px;
	margin-bottom: 0px;
}

.category-item {
	display: flex;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: justify;
	justify-content: space-between;
	line-height: 32px;
	padding: 0 16px;
	color: #666;
	margin-top: 5px;
}

.category-item:hover {
	background-color: #f6f6f6;
}

.selected {
	color: red !important;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$('.scroll-item').on("click",'.category-item', function(e) {
			e.preventDefault();
			var dmId = $(this).data('value');
			var cap =$(this).data('cap');			
			var name = $('#daChon').text();
			var dem =0;
			for (var i =0; i<name.length;i++){
				if (name.charAt(i) === ">"){
					dem +=1;
					if (dem === 2){
						var viTri2 =i;
					}
				}
			}
			if (cap == 0) {
				$('.scroll-item li').removeClass("selected");
				name = $(this).data('name');
			}
			if (cap == 1) {
				$('.danhmuc1 li').removeClass("selected");
				if (dem != 0){
					name = name.substring(0, name.indexOf(">"));
				}
				name += " > " + $(this).data('name');
			}
			if (cap == 2) {
				$('.danhmuc2 li').removeClass("selected");
				if (dem != 1){
					name = name.substring(0, viTri2);
				}
				name += " > " + $(this).data('name');
			}
			if (cap == 3) {
				$('.danhmuc3 li').removeClass("selected");
				if (dem != 2){
					name = name.substring(0, name.lastIndexOf(">"));
				}
				name += " > " + $(this).data('name');
			}
			$(this).closest('li').addClass('selected');
			$('#daChon').text(name);

			hienThiDanhMuc(dmId, cap);
		});
	});
	function hienThiDanhMuc(dmId, cap) {

		var ajaxCall = $.ajax({
			type : "GET",
			url : "${home}admin/sanphamadd/" + dmId,
			data : {
				dmId : dmId
			},
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
			async : true,

		})
		ajaxCall
				.done(function(lstDanhMuc1) {
					var thongtin = "";
					if(lstDanhMuc1.length === 0){
						$('.tieptheo').prop("disabled", false);
					}else(
						$('.tieptheo').prop("disabled", true)	
					)
					$
							.each(
									lstDanhMuc1,
									function(index, danhmuc) {
										thongtin += "<li class='category-item'data-value= '"
												+ danhmuc.id
												+ "'data-name='"
												+ danhmuc.tenDanhMuc
												+ "'data-cap='"
												+ (cap + 1)
												+ "'>";
										thongtin += "<p style='margin-top: 0px; margin-bottom: 0px'>"
												+ danhmuc.tenDanhMuc
												+ "</p>";
										if(danhmuc.dem == true){
											thongtin +=" <i class='ti-angle-right'aria-hidden='true'></i>"
										}
										thongtin += "</li>"
									})
					if (cap == 0) {
						$('.danhmuc1').empty();
						$('.danhmuc2').empty();
						$('.danhmuc3').empty();
						$('.danhmuc1').append(thongtin);
					}
					if (cap == 1) {
						$('.danhmuc2').empty();
						$('.danhmuc3').empty();
						$('.danhmuc2').append(thongtin);
					}
					if (cap == 2) {
						$('.danhmuc3').empty();
						$('.danhmuc3').append(thongtin);
					}
					
				});
	}
</script>
</head>

<section class="content">
	<div class="body_scroll">
		<div class="block-header">
			<div class="row">
				<div class="col-lg-7 col-md-6 col-sm-12">
					<h2>Thêm mới sản phẩm</h2>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html"><i
								class="zmdi zmdi-home"></i> Aero</a></li>
						<li class="breadcrumb-item">eCommerce</li>
						<li class="breadcrumb-item active">Product List</li>
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
			<div class="row clearfix">
				<div class="col-lg-12">
					<div>
						<label>Vui lòng chọn một ngành hàng phù hợp với sản phẩm
							của bạn</label>
					</div>
					<div class="card">
						<div class="body">
							<h2 class="card-inside-title">Tên sản phẩm</h2>
							<div class="row clearfix">
								<div class="col-sm-12">
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="Xin hãy nhập tên sản phẩm" />
									</div>
								</div>
							</div>
							<br>

							<div class="form-group"
								style="background-color: #fafafa; padding-bottom: 15px">
								<div class="row">
									<div class="col-md-6">
										<i class="ti-search" aria-hidden="true"
											style="position: absolute; padding: 20px; margin-top: 10px"></i>
										<input type="text" placeholder="Tên Ngành Hàng"
											class="form-control"
											style="padding-inline-start: 30px; border-radius: 25px; margin-top: 20px; margin-left: 10px">
									</div>
									<div class="col-md-6"></div>
								</div>
								<div class="row"
									style="margin-left: 20px; margin-right: 20px; margin-top: 20px; background: white">
									<div class="col-md-3"
										style="padding-right: 0px; padding-left: 0px;">
										<ul class="scroll-item danhmuc0">
											<c:if test="${not empty lstDanhMuc0}">
											<c:forEach var="dm" items="${lstDanhMuc0}">
											<li class="category-item" data-value=${dm.id } data-name="${dm.tenDanhMuc }" data-cap="0" >
												<p style="margin-top: 0px; margin-bottom: 0px">${dm.tenDanhMuc }</p> <i class="ti-angle-right"
												aria-hidden="true"></i>
											</li>
											</c:forEach>
											</c:if>
										</ul>
									</div>
									<div class="col-md-3"
										style="padding-right: 0px; padding-left: 0px;">
										<ul class="scroll-item danhmuc1">
											
										</ul>
									</div>
									<div class="col-md-3"
										style="padding-right: 0px; padding-left: 0px">
										<ul class="scroll-item danhmuc2">
											
										</ul>
									</div>
									<div class="col-md-3"
										style="padding-right: 0px; padding-left: 0px">
										<ul class="scroll-item danhmuc3">
											
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="body">
							<label>Đã chọn:</label>&nbsp;&nbsp;&nbsp;<label id="daChon"
								style="color: red;"></label> <br>
							<button class="btn btn-primary tieptheo" disabled="disabled">
								Tiếp theo<i class="fa fa-fw fa-lg fa-check-circle"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>