<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js " lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<meta name="description"
	content="Responsive Bootstrap 4 and web Application ui kit.">

<title><tiles:getAsString name="title" /></title>

<link rel="icon" href="<c:url value="/resources/admin/favicon.ico"/>"
	type="image/x-icon">
<!-- Favicon-->
<link rel="stylesheet"
	href="<c:url value="/resources/admin/assets/plugins/bootstrap/css/bootstrap.min.css"/>">

<!-- Custom Css -->
<link rel="stylesheet"
	href="<c:url value="/resources/admin/assets/css/style.min.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/admin/assets/plugins/jquery-datatable/dataTables.bootstrap4.min.css"/>">

<link
	href="<c:url value="/resources/admin/assets/plugins/bootstrap-select/css/bootstrap-select.css"/>"
	rel="stylesheet" />
<link rel="stylesheet"
	href="<c:url value="/resources/admin/assets/plugins/dropify/css/dropify.min.css"/>">
</head>

<body class="theme-blush">
	<script src="<c:url value="/resources/admin/jquery-3.5.1.min.js"/>"></script>
	<!-- Page Loader -->
	<tiles:insertAttribute name="pageLoader" />
	<!-- Icon Right Sidebar-->
	<tiles:insertAttribute name="iconRightSidebar" />
	
	<!-- Left Sidebar -->
	<tiles:insertAttribute name="leftSidebar" />

	<!-- Right Sidebar -->
	<tiles:insertAttribute name="rightSidebar" />
	<!-- body-->
	<tiles:insertAttribute name="body" />
	
	
	<script
		src="<c:url value="/resources/admin/assets/bundles/libscripts.bundle.js"/>"></script>
		<script
		src="<c:url value="/resources/admin/assets/bundles/vendorscripts.bundle.js"/>"></script>
	<!-- Lib Scripts Plugin Js -->
	<!-- Lib Scripts Plugin Js -->
	<script
		src="<c:url value="/resources/admin/assets/bundles/mainscripts.bundle.js"/>"></script>
	
	
	<!-- Custom Js -->
	<script
		src="<c:url value="/resources/admin/assets/bundles/footable.bundle.js"/>"></script>
	<!-- Lib Scripts Plugin Js -->

	
	<script
		src="<c:url value="/resources/admin/assets/plugins/momentjs/moment.js"/>"></script>
	<!-- Bootstrap Material Datetime Picker Plugin Js -->
	<script
		src="<c:url value="/resources/admin/assets/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/assets/js/pages/forms/basic-form-elements.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/assets/plugins/dropify/js/dropify.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/assets/js/pages/forms/dropify.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/assets/bundles/datatablescripts.bundle.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/assets/plugins/jquery-datatable/buttons/dataTables.buttons.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/assets/plugins/jquery-datatable/buttons/buttons.bootstrap4.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/assets/plugins/jquery-datatable/buttons/buttons.colVis.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/assets/plugins/jquery-datatable/buttons/buttons.flash.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/assets/plugins/jquery-datatable/buttons/buttons.html5.min.js"/>"></script>
	<script
		src="<c:url value="/resources/admin/assets/plugins/jquery-datatable/buttons/buttons.print.min.js"/>"></script>
	
	<!-- Custom Js -->
	<script
		src="<c:url value="/resources/admin/assets/js/pages/tables/jquery-datatable.js"/>"></script>
</body>
</html>
