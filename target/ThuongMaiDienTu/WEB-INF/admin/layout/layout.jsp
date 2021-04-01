<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<html class="no-js " lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">

<title><tiles:getAsString name="title" /></title>
<link rel="icon" href="../resources/admin/favicon.ico" type="image/x-icon">
<!-- Favicon-->
<link rel="stylesheet" href="../resources/admin/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/admin/assets/plugins/footable-bootstrap/css/footable.bootstrap.min.css">
<link rel="stylesheet" href="../resources/admin/assets/plugins/footable-bootstrap/css/footable.standalone.min.css">

<!-- Custom Css -->
<link rel="stylesheet" href="../resources/admin/assets/css/style.min.css">
</head>

<body class="theme-blush">
<script src="../resources/admin/jquery-3.5.1.min.js"></script>
<!-- Page Loader -->
<tiles:insertAttribute name = "pageLoader"/>
<!-- Icon Right Sidebar-->
<tiles:insertAttribute name = "iconRightSidebar"/>
<!-- Left Sidebar -->
<tiles:insertAttribute name = "leftSidebar"/>

<!-- Right Sidebar -->
<tiles:insertAttribute name = "rightSidebar"/>
<!-- body-->
<tiles:insertAttribute name = "body"/>
<!-- Jquery Core Js --> 

<script src="../resources/admin/assets/bundles/libscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 
<script src="../resources/admin/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js --> 

<script src="../resources/admin/assets/bundles/footable.bundle.js"></script> <!-- Lib Scripts Plugin Js -->

<script src="../resources/admin/assets/bundles/mainscripts.bundle.js"></script><!-- Custom Js -->
<script src="../resources/admin/assets/js/pages/tables/footable.js"></script><!-- Custom Js --> 
<script src="../resources/admin/assets/plugins/momentjs/moment.js"></script>
<!-- Bootstrap Material Datetime Picker Plugin Js -->
<script
	src="../resources/admin/assets/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
<script
	src="../resources/admin/assets/js/pages/forms/basic-form-elements.js"></script>
</body>
</html>
 	