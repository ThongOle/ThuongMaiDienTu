<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$(document).on("click", "#themMoi", function(){
			$(".modal-body #hsxId").val("0");
			$(".modal-body #tenHSX").val("");
		
			
		});
		
		$(document).on("click", "#chiTiet", function(){
			
			var hsxId = $(this).data('value');
			var tenhsx = $(this).children('.tenHangSX').text();
			$(".modal-body #hsxId").val(hsxId);
			$(".modal-body #tenHSX").val(tenhsx);
		});
		
	});
	function tdclick(e){ 
	    if (!e) var e = window.event;                // Get the window event
	    e.cancelBubble = true;                       // IE Stop propagation
	    if (e.stopPropagation) e.stopPropagation();  // Other Broswers
	    
	}; 
	
</script>
<c:url value="/admin/xoahsx" var="urlXoa"></c:url>
<c:url value="/admin/hsxadd" var="urlThemMoiCapNhat"></c:url>
<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<s:form modelAttribute="hangsanxuat" action="${urlThemMoiCapNhat}">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Modal Header</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Tên Hãng Sản Xuất</label>
							<s:input style="display: none;" class="form-control" type="text" id="hsxId" path="id" />
							<s:input class="form-control" type="text" path="tenHangSX" id ="tenHSX" required="true"/>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default" >Xác nhận</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</s:form>
		</div>
	</div>
	<section class="content">
		<div class="body_scroll">
			<div class="block-header">
				<div class="row">
					<div class="col-lg-7 col-md-6 col-sm-12">
						<h2>Normal Tables</h2>
						<ul class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html"><i
									class="zmdi zmdi-home"></i> Aero</a></li>
							<li class="breadcrumb-item"><a href="javascript:void(0);">Tables</a></li>
							<li class="breadcrumb-item active">Normal Tables</li>
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
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="card">
							<div class="header">
								<h2>
									<strong>Danh sách Hãng Sản xuất</strong> 
								</h2>
							</div>
							<div class="body" style="padding: 10px">
							<a id="themMoi" class="btn btn-primary" style="float: right;"  data-toggle="modal" data-target="#myModal"><i class="zmdi zmdi-hc-fw"></i>Thêm mới</a>
								<div class="table-responsive">
									<table class="table table-hover table-bordered js-basic-example dataTable ">
										<thead>
											<tr>
												<th>Id</th>
												<th>Tên Hãng Sãn Xuất</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty lstHsx}">
												<c:forEach var="hsx" items="${lstHsx}">
													<tr id="chiTiet" data-value ="${hsx.id}" data-toggle="modal" data-target="#myModal">
														<th scope="row">${hsx.id}</th>
														<td class="tenHangSX" >${hsx.tenHangSX }</td>
														<td onclick='tdclick(event)'><a href="${urlXoa}/${hsx.id}">Xóa</a></td>
													</tr>
												</c:forEach>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- #END# Hover Rows -->
			</div>
		</div>
	</section>
</body>
</html>