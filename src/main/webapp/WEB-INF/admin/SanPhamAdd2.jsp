<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

	
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btnThem:hover {
	cursor: pointer;
	background-color: #cff5ff;
}
.hidden{
	display: none !important;
}

input{width:100%}
</style>
<script>
	$(document)
			.ready(
					function() {
						hienThiThuocTinhSanPham();
						
						//Xóa toàn bộ nhóm phân loại hàng 2
						$('#close2').on(
								"click",
								function(e) {
									e.preventDefault();
									$('#nhomphanloaihang2 #close').parent()
											.parent().remove();
									$('#nhomphanloai2').css('display', 'none');
									$('#tennhomphanloai2').val('');
									$('#tenphanloai2').val('');
									$('#themphanloaihang2').css('display',
											'block');
									$('#themphanloaihang2').data('value', 0);
									$('#themnhomphanloai2').css('display',
											'block');
									
									$('#close1').css('display', 'block');
									$('#ten2').text("Tên");
									$('#ten2').addClass('hidden');
									
									$('#tbody #loai2').text("Loại Hàng");
									$('#tbody #loai2').addClass('hidden');
									for(var i =5 ; i>1; i--){
										$('tr[data-value$="' + i + '"]')
									.remove();
									}
									
									$('#tbody #tdloaihang').attr('rowspan', 1);
									
								});
						// xóa toàn bộ nhóm phân loại hàng 1
						$('#close1').on(
								"click",
								function(e) {
									e.preventDefault();
									$('#nhomphanloaihang1 #close').parent()
											.parent().remove();
									$('#tennhomphanloai1').val('');
									$('#tenphanloai1').val('');
									$('#themphanloaihang1').css('display',
											'block');
									$('#themphanloaihang1').data('value', 1);
									$('#ten1').text("Tên");
									$('#tbody #tdloaihang').text("Loại Hàng");
									for(var i =5 ; i>1; i--){
										$('tr[data-gt1$="' + i + '"]').remove();
									}
									$('#gia').val('');
									$('#mahang').val('');
									$('#khohang').val('');
									
									
								});
						//xóa phần từ phân loại hàng 1
						$('#nhomphanloaihang1')
								.on(
										"click",
										'#close',
										function(e) {
											e.preventDefault();
											var data = $(this).data('value') - 10;
											if (data == 5) {
												$('#themphanloaihang1').css(
														'display', 'block');
											}
											$(
													'a[data-value$="'
															+ (data + 9)
															+ '"]').css(
													'display', 'block');
											$('#themphanloaihang1').data(
													'value', data-1);
											$('tr[data-gt1$="' + (data) + '"]')
											.remove();
											$(this).parent().parent().remove();
										});
						// xóa phần tử phân loại hàng 2
						$('#nhomphanloaihang2')
								.on(
										"click",
										'#close',
										function(e) {
											e.preventDefault();
											var data = $(this).data('value') - 20;
											if (data == 5) {
												$('#themphanloaihang2').css(
														'display', 'block');
											}
											$(
													'a[data-value$="'
															+ (data + 19)
															+ '"]').css(
													'display', 'block');
											$('tr[data-value$="' + data + '"]')
													.remove();
											$('#tbody #tdloaihang').attr('rowspan', data-1);
											$('#themphanloaihang2').data(
													'value', data-1);
											$(this).parent().parent().remove();
											
										});
						// thêm cột phần loại hàng 1
						$('#themphanloaihang1')
								.click(
										function(e) {
											e.preventDefault();
											var datavalue = $(this).data(
													'value');
											var datavalue2 = $('.inputhanghoa2').length;
											var display = "table-cell";
											if($('#themphanloaihang2').data('value')==0){
												display = "none";
											}
											
											var numItems = $('.inputhanghoa1').length;
											var noidung = "";
											
											if (numItems < 5) {
												var ttlabel = $('input[data-value$="'+21+'"]').val();
												noidung += "<tr id='trloai1' data-gt1='"+(numItems+1)+"' data-value='1'><td rowspan='"
													+ datavalue2
													+ "' style='width: 20%;' id='tdloaihang' data-loai1='"+(numItems+1)+"'><label>Loại Hàng</label></td><td data-loai2='1' style='width: 20%; display: "+display+"' id='loai2'><label >"+ttlabel+"</label></td><td style='width: 20%;'><input name='gia' id='gia' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td><td style='width: 20%;'><input name='khohang' id='khohang' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td><td style='width: 20%;'><input placeholder='Nhập vào' name='mahang' id='mahang' type='text' class='from-control' style='border: none;'></td></tr>"
											for (var j = datavalue2; j > 1; j--) {
												noidung += "<tr data-gt1='"+(numItems+1)+"' data-value='"
														+ (j)
														+ "'><td style='width: 20%; display: "+display+"' data-loai2='"+j+"'><label >Loại Hàng</label></td><td style='width: 20%;'><input name='gia' id='gia' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td><td style='width: 20%;'><input name='khohang'  id='khohang' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td><td style='width: 20%;'><input name='mahang' id='mahang' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td></tr>";
											}
												$('#themphanloaihang1').data(
														'value', datavalue + 1);
												$(
														'a[data-value$="'
																+ (datavalue + 10)
																+ '"]').css(
														'display', 'none');
												$('#tbody').append(noidung);
												$('#nhomphanloaihang1')
														.append(
																"<div class='row'><div class='col-sm-11'><div><input name='tenphanloai1' id='tenphanloai1' type='text' class='form-control inputhanghoa1' style='margin-bottom: 5px' data-value='"
																		+ (datavalue + 11)
																		+ "' /></div></div><div class='col-sm-1'><a  style='border: none; background: none' id ='close' data-value='"
																		+ (datavalue + 11)
																		+ "'><i class='zmdi zmdi-close'></i></a></div></div>");
												if (numItems == 4) {
													$('#themphanloaihang1')
															.css('display',
																	'none');
												}
											}

										});
						// thêm cột phân loại hàng 2
						$('#themphanloaihang2')
								.click(
										function(e) {
											e.preventDefault();
											var datavalue = $(this).data(
													'value');
											var numItems = $('.inputhanghoa2').length;
											if (numItems < 5) {
												$('#themphanloaihang2').data(
														'value', datavalue + 1);
												$('#tbody #tdloaihang').attr(
														'rowspan',
														datavalue + 1);
												$("#tbody #trloai1").after("<tr data-value='"
																+ (datavalue + 1)
																+ "'><td style='width: 20%;' data-loai2 ='"+(numItems+1)+"'><label >Loại Hàng</label></td><td style='width: 20%;'><input name='gia' id='gia' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td><td style='width: 20%;'><input name='khohang'  id='khohang' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td><td style='width: 20%;'><input name='mahang' id='mahang' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td></tr>");
												$(
														'a[data-value$="'
																+ (datavalue + 20)
																+ '"]').css(
														'display', 'none');
												$('#nhomphanloaihang2')
														.append(
																"<div class='row'><div class='col-sm-11'><div><input name='tenphanloai2' type='text' id ='tenphanloai2' class='form-control inputhanghoa2' style='margin-bottom: 5px' data-value='"
																		+ (datavalue + 21)
																		+ "'/></div></div><div class='col-sm-1'><a style='border: none; background: none' id='close' data-value='"
																		+ (datavalue + 21)
																		+ "'><i class='zmdi zmdi-close'></i></a></div></div>");
												if (numItems == 4) {
													$('#themphanloaihang2')
															.css('display',
																	'none');
												}
											}

										});
						// Thêm nhóm phân loại hàng 2
						$('#themnhomphanloai2').click(function(e) {
							e.preventDefault();
							$('#themnhomphanloai2').css('display', 'none');
							$('#themphanloaihang2').data('value', 1);
							$('#nhomphanloai2').css('display', 'block');
							$('#ten2').removeClass('hidden');
							$('#tbody #loai2').removeClass('hidden');
							$('#tbody #loai2').css('display', 'table-cell');
							$('#close1').css('display', 'none');

						});
						$('#tennhomphanloai1').keyup(function() {
							var x = $('#tennhomphanloai1').val();
							$('#ten1').text(x);
						});
						$('#tennhomphanloai2').keyup(function() {
							var x = $('#tennhomphanloai2').val();
							$('#ten2').text(x);
						});
						$("#nhomphanloaihang1").on("keyup",'#tenphanloai1', function(){
							var x = $(this).val();
							var data = $(this).data('value');
							$('td[data-loai1$="'+ (data -10)+ '"]').text(x);
						});
						$("#nhomphanloaihang2").on("keyup",'#tenphanloai2', function(){
							var x = $(this).val();
							var data = $(this).data('value');
							$('td[data-loai2$="'+ (data -20)+ '"]').text(x);
						});
						
					})
	function hienThiThuocTinhSanPham(){
		var jsonSP = $('#jsonSP').val();
		 
		if(jsonSP != ""){
			jsonSP = JSON.parse(jsonSP);
			console.log(jsonSP);
			$('#tennhomphanloai1').val(jsonSP[0].objSanPham.thuocTinh1);
			$('#ten1').text(jsonSP[0].objSanPham.thuocTinh1);
			var thuocTinh2 = jsonSP[0].objSanPham.thuocTinh2;
			console.log(thuocTinh2);
			var lstThuocTinh1 = new Set();
			var lstThuocTinh2 = new Set();
			for (var i = 0 ; i<jsonSP.length; i++){
				lstThuocTinh1.add(jsonSP[i].thuocTinh1);
			}
			lstThuocTinh1 = [...lstThuocTinh1];
			$('#themphanloaihang1').data('value', lstThuocTinh1.length);
			//tạo input_1
			
			for (var i =1 ; i<lstThuocTinh1.length; i++){
				$('#nhomphanloaihang1')
				.append(
						"<div class='row'><div class='col-sm-11'><div><input name='tenphanloai1' id='tenphanloai1' type='text' class='form-control inputhanghoa1' style='margin-bottom: 5px' data-value='"
								+ (i + 11)
								+ "' /></div></div><div class='col-sm-1'><a  style='border: none; background: none' id ='close' data-value='"
								+ (i + 11)
								+ "'><i class='zmdi zmdi-close'></i></a></div></div>");
				$(
						'a[data-value$="'
								+ (i + 10)
								+ '"]').css(
						'display', 'none');
				
				$('input[data-value$="'+(i+11)+'"]').val(lstThuocTinh1[i]);
				
				if (i == 4) {
						$('#themphanloaihang1').css('display','none');
			}
			}
			
			var display = "none";
			
			if(thuocTinh2 != null ){
				console.log("a");
				for (var i = 0 ; i<jsonSP.length; i++){
					lstThuocTinh2.add(jsonSP[i].thuocTinh2);
				}
				lstThuocTinh2 = [...lstThuocTinh2];
				$('#tennhomphanloai2').val(thuocTinh2);
				$('#ten2').text(thuocTinh2);
				$('#themnhomphanloai2').css('display', 'none');
				$('#nhomphanloai2').css('display', 'block');
				$('#ten2').removeClass('hidden');
				$('#tbody #loai2').removeClass('hidden');
				$('#tbody #loai2').css('display', 'table-cell');
				$('#close1').css('display', 'none');
				//tạo input thuộc nhóm 2
				
				
				for (var i = 1; i <lstThuocTinh2.length; i++){
					$(
							'a[data-value$="'
									+ (i + 20)
									+ '"]').css(
							'display', 'none');
					$('#nhomphanloaihang2')
							.append(
									"<div class='row'><div class='col-sm-11'><div><input name='tenphanloai2' type='text' id ='tenphanloai2' class='form-control inputhanghoa2' style='margin-bottom: 5px' data-value='"
											+ (i + 21)
											+ "'/></div></div><div class='col-sm-1'><a style='border: none; background: none' id='close' data-value='"
											+ (i + 21)
											+ "'><i class='zmdi zmdi-close'></i></a></div></div>");
					$('input[data-value$="'+(21+i)+'"]').val(lstThuocTinh2[i]);
					
					if (i == 4) {
						$('#themphanloaihang2')
								.css('display',
										'none');
					}
				}
				$('#themphanloaihang2').data('value', lstThuocTinh2.length);
				display = "table-cell";
			}
			//tạo bảng phân loại hàng
			var noidung = "";
			var rowspan = 1;
			if(display == "table-cell"){
				rowspan = lstThuocTinh2.length;
			}
			$('#tbody #tdloaihang').attr('rowspan', rowspan);

			for (var j = rowspan; j > 1; j--) {
				noidung += "<tr data-gt1='"+(1)+"' data-value='"
				+ (j)
				+ "'><td style='width: 20%; display: "+display+"' data-loai2='"+j+"'><label >Loại Hàng</label></td><td style='width: 20%;'><input id='gia' name='gia' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td><td style='width: 20%;'><input name='khohang'  id='khohang' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td><td style='width: 20%;'><input name='mahang' id='mahang' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td></tr>";
			}


			for (var i = 1 ; i <lstThuocTinh1.length; i++){
				noidung += "<tr id='trloai1' data-gt1='"+(i+1)+"' data-value='1'><td rowspan='"
				+ rowspan
				+ "' style='width: 20%;' id='tdloaihang' data-loai1='"+(i+1)+"'><label>Loại Hàng</label></td><td data-loai2='1' style='width: 20%; display: "+display+"' id='loai2'><label ></label></td><td style='width: 20%;'><input name='gia' id='gia' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td><td style='width: 20%;'><input name='khohang'  id='khohang' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td><td style='width: 20%;'><input placeholder='Nhập vào' name='mahang' id='mahang' type='text' class='from-control' style='border: none;'></td></tr>"
				for (var j = rowspan; j > 1; j--) {
					noidung += "<tr data-gt1='"+(i+1)+"' data-value='"
						+ (j)
						+ "'><td style='width: 20%; display: "+display+"' data-loai2='"+j+"'><label >Loại Hàng</label></td><td style='width: 20%;'><input id='gia' name='gia' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td><td style='width: 20%;'><input name='khohang'  id='khohang' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td><td style='width: 20%;'><input name='mahang'  id='mahang' placeholder='Nhập vào' type='text' class='from-control' style='border: none;'></td></tr>";
				}

			}
			$('#tbody').append(noidung);
			
			// hiern thị thông tin table
			$('input[data-value$="'+(21)+'"]').val(lstThuocTinh2[0]);
			$('td[data-loai2$="'+ (1)+ '"]').text(lstThuocTinh2[0]);
			$('input[data-value$="'+11+'"]').val(lstThuocTinh1[0]);
			$('td[data-loai1$="'+ (1)+ '"]').text(lstThuocTinh1[0]);
			for(var i = 1; i< lstThuocTinh1.length; i++){
				$('td[data-loai1$="'+ (i+1)+ '"]').text(lstThuocTinh1[i]);
			}
			if(display == "table-cell"){
				for(var i = 1; i< lstThuocTinh2.length; i++){
					$('td[data-loai2$="'+ (i+1)+ '"]').text(lstThuocTinh2[i]);
				}
			}
			var dem = 0;
			for (var i = 1; i <= lstThuocTinh1.length; i++){
				if(display == "table-cell"){
					for(var j = 1; j<= lstThuocTinh2.length; j++){
						
						$('tr[data-gt1="' + i + '"][data-value="'+j+'"]').find("#gia").val(jsonSP[dem].giaTien);
						$('tr[data-gt1="' + i + '"][data-value="'+j+'"]').find("#khohang").val(jsonSP[dem].soLuong);
						$('tr[data-gt1="' + i + '"][data-value="'+j+'"]').find("#mahang").val(jsonSP[dem].maSanPham);
						dem += 1;
					}
				}else{
					$('tr[data-gt1="' + i + '"]').find("#gia").val(jsonSP[dem].giaTien);
					$('tr[data-gt1="' + i + '"]').find("#khohang").val(jsonSP[dem].maSanPham);
					$('tr[data-gt1="' + i + '"]').find("#mahang").val(jsonSP[dem].soLuong);
					dem += 1;
				}
			}
			
			
		}

	}
					
</script>

</head>
<c:url value="/admin/themmoisanpham" var="urlThemMoi" />

<section class="content">
	<div class="body_scroll">
		<div class="block-header">
			<div class="row">
				<div class="col-lg-7 col-md-6 col-sm-12">
					<h2>Thêm mới 1 sản phẩm</h2>
					<ul class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.html"><i
								class="zmdi zmdi-home"></i> Aero</a></li>
						<li class="breadcrumb-item"><a href="javascript:void(0);">Forms</a></li>
						<li class="breadcrumb-item active">Basic Form</li>
					</ul>
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
		<s:form action="${urlThemMoi }" method="post" modelAttribute="sanPham" enctype="multipart/form-data">
		<div class="container-fluid">
			<!-- Input -->
			<div class="row clearfix">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="card">
						<div class="header">
							<h2>
								<strong>Thông tin cơ bản</strong>
							</h2>
						</div>
						<div class="body">
							<h2 class="card-inside-title">Tên sản phẩm*</h2>
							<div class="row clearfix">
								<div class="col-sm-12">
									<div class="form-group">
										<s:input path="id" type="text" class="form-control" style="display: none;"/>
										<s:input path="tenSanPham" type="text" class="form-control" id="tensanpham" value="${tensanpham }" />
									</div>
								</div>
							</div>

							<label>Mô tả sản phẩm*</label>
							<div class="row clearfix">
								<div class="col-sm-12">
									<div class="form-group">
										<s:textarea id="ckeditor" path="moTa"></s:textarea>
									</div>
								</div>
							</div>
							<div class="row clearfix">
								<div class="col-sm-6">
									<label>Danh mục*</label>
								</div>
								<div class="col-sm-6">
									<label>Loại sản phẩm*</label>
								</div>
							</div>
							<div class="row clearfix">
								<div class="col-sm-6">
									<div class="form-group">
										<input type="text" class="form-control" value="${tendanhmuc }" readonly="readonly">
										<s:input type="text" style="display: none;" value="${dmId }" path="danhMucId"/> 
										<input type="text" style="display: none;" value='${jsonSP }' id="jsonSP"/> 
									</div>
								</div>
								<div class ="col-sm-6">
									<div class ="form-group">
										<s:select class="form-control selectpicker"  data-live-search="true" path="LoaiSPId">
										<s:option value="0" >-- Chọn loại sản phẩm --</s:option>
										<s:options items="${lstLSP }" />
									</s:select>
									</div>
								</div>
							</div>
							<div class="row clearfix">
								<div class="col-sm-6">
									<label>Thương hiệu*</label>
								</div>
								<div class="col-sm-6">
									<label>Xuất xứ*</label>
								</div>
							</div>
							<div class="row clearfix">
								<div class="col-sm-6">
									<s:select class="form-control selectpicker"  data-live-search="true" path="hangSXId">
										<s:option value="0" >-- Chọn thương hiệu --</s:option>
										<s:options items="${lstHSX }" />
									</s:select>
								</div>
								<div class="col-sm-6">
									<s:select class="form-control selectpicker" data-live-search="true" path="xuatXuId">
										<s:option value="0" >-- Chọn Xuất xứ --</s:option>
										<s:options items="${lstXX }" />
									</s:select>
								</div>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="header">
							<h2>
								<strong>Thông tin bán hàng</strong>
							</h2>
						</div>
						
						<s:form>
						<div class="body" id="phanLoaiHang">
							<div class="row clearfix">
								<div class="col-sm-3">
									<label>Nhóm phân loại 1</label>
								</div>
								<div class="col-sm-7" style="background-color: #fafafa">
									<div class="row clearfix">
										<div class="col-sm-3">
											<label>Tên nhóm phân loại</label>
										</div>
										<div class="col-sm-9">
											<div class="row">
												<div class="col-sm-11">
													<input type="text" class="form-control" id="tennhomphanloai1" name="tennhomphanloai1"/>
												</div>
												<div class="col-sm-1">
													<button id="close1" style="border: none; background: none">
														<i class="zmdi zmdi-close"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
									<br>
									<div class="row clearfix">
										<div class="col-sm-3">
											<label>Phân loại hàng</label>
										</div>
										<div class="col-sm-9">
											<div id="nhomphanloaihang1">
												<div class="row">
													<div class="col-sm-11">
														<div>
															<input type="text" class="form-control inputhanghoa1"
																style="margin-bottom: 5px" data-value="11" id="tenphanloai1" name="tenphanloai1"/>
														</div>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-sm-11">
													<button id="themphanloaihang1"
														style="border-color: #46b6fe; border-style: dotted; border-width: thick; color: #46b6fe;"
														class="form-control btnThem" data-value='1'>
														<i class="zmdi zmdi-hc-fw"></i>Thêm phân loại hàng
													</button>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
							<br>
							<div class="row clearfix">
								<div class="col-sm-3">
									<label>Nhóm phân loại 2</label>
								</div>
								<div class="col-sm-7" style="background-color: #fafafa;">
									<button id="themnhomphanloai2"
										style="border-color: #46b6fe; border-style: dotted; border-width: thick; color: #46b6fe;"
										class="form-control">
										<i class="zmdi zmdi-hc-fw"></i>Thêm
									</button>

									<div style="display: none;" id="nhomphanloai2">
										<div class="row clearfix">
											<div class="col-sm-3">
												<label>Tên nhóm phân loại</label>
											</div>
											<div class="col-sm-9">
												<div class="row">
													<div class="col-sm-11">
														<input name="tennhomphanloai2" type="text" class="form-control"
															style="margin-bottom: 5px" data-value='1' id="tennhomphanloai2"/>
													</div>
													<div class="col-sm-1">
														<button id="close2" style="border: none; background: none">
															<i class="zmdi zmdi-close"></i>
														</button>
													</div>
												</div>
											</div>
										</div>
										<br>
										<div class="row clearfix">
											<div class="col-sm-3">
												<label>Phân loại hàng</label>
											</div>
											<div class="col-sm-9">
												<div id="nhomphanloaihang2">
													<div class="row">
														<div class="col-sm-11">
															<div>
																<input id="tenphanloai2" type="text" class="form-control inputhanghoa2"
																	style="margin-bottom: 5px" data-value="21" name="tenphanloai2"/>
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-sm-11">
														<button id="themphanloaihang2"
															style="border-color: #46b6fe; border-style: dotted; border-width: thick; color: #46b6fe;"
															class="form-control btnThem" data-value="0">
															<i class="zmdi zmdi-hc-fw"></i>Thêm phân loại hàng
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<br>
							<div class="row clearfix">
								<div class="col-sm-3">
									<label>Danh sách phân loại hàng</label>
								</div>
								<div class="col-sm-9" style="padding-left: 0px">

									<table class="table table-bordered"
										style="width: 100%; table-layout: fixed;">
										
										<tbody id="tbody">
										<tr>
												<th style="width: 20%;"  id="ten1">Tên</th>
												<th style="width: 20%;"  id="ten2" class="hidden">Tên</th>
												<th style="width: 20%" >Giá</th>
												<th style="width: 20%" >Kho hàng</th>
												<th style="width: 20%" >Mã hàng</th>
											</tr>
											<tr id="trloai1" data-gt1="1" data-value="1">
												<td rowspan="1" style="width: 20%;" id="tdloaihang" data-loai1="1"><label>Loại
														Hàng</label></td>
												<td style="width: 20%;" id="loai2" data-loai2="1" class="hidden"><label>Loại
														Hàng</label></td>
												<td style="width: 20%;"><input placeholder="Nhập vào"
													type="text" class="from-control" style="border: none;" name="gia" id="gia"></td>
												<td style="width: 20%;"><input placeholder="Nhập vào"
													type="text" class="from-control" style="border: none;" name="khohang" id="khohang"></td>
												<td style="width: 20%;"><input placeholder="Nhập vào"
													type="text" class="from-control" style="border: none;" name="mahang" id="mahang"></td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
						</s:form>
					</div>
					<div class="card">
						<div class="header">
							<h2 >
								<strong >Quản lý ảnh</strong>
							</h2>
							<div class="body" id="quanlyanh" >
								<div class="row" >
									<div class="col-sm-2">
										<input type="file" class="dropify" name="fUpload" data-default-file="<c:url value="/images/${lstASP.get(0).anh }"/>" >
									</div>
									<div class="col-sm-2">
										<input type="file" class="dropify" name="fUpload" data-default-file="<c:url value="/images/${lstASP.get(1).anh }"/>" >
									</div>
									<div class="col-sm-2">
										<input type="file" class="dropify" name="fUpload" data-default-file="<c:url value="/images/${lstASP.get(2).anh }"/>" >
									</div>
									<div class="col-sm-2">
										<input type="file" class="dropify" name="fUpload" data-default-file="<c:url value="/images/${lstASP.get(3).anh }"/>" >
									</div>
									<div class="col-sm-2">
										<input type="file" class="dropify" name="fUpload" data-default-file="<c:url value="/images/${lstASP.get(4).anh }"/>">
									</div>
									<div class="col-sm-2">
										<input type="file" class="dropify" name="fUpload"  data-default-file="<c:url value="/images/${lstASP.get(5).anh }"/>">
									</div>
								</div>
                            
                        </div>
						</div>
					</div>	
					<div class="card">
						<div class="body">
							<button class="btn btn-primary">
								Xác nhận<i class="fa fa-fw fa-lg fa-check-circle"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		</s:form>
	</div>
</section>
<script src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>
<script>
		ClassicEditor.create(document.querySelector('#ckeditor'));
</script>

