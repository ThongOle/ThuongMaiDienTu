<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html class="no-js " lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<meta name="description" content="Responsive Bootstrap 4 and web Application ui kit.">
<c:url value="/resources/admin" var="resources"></c:url>
<title>Đăng nhập trang quản trị</title>
<!-- Favicon-->
<link rel="icon" href="${resources }/favicon.ico" type="image/x-icon">
<!-- Custom Css -->
<link rel="stylesheet" href="${resources }/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${resources }/assets/css/style.min.css">    
</head>


<body class="theme-blush">
<c:url value="/dangnhap" var="dangnhap"> </c:url>
<div class="authentication">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-sm-12">
                <s:form class="card auth_form" modelAttribute="taikhoan" action="${dangnhap }" id="login">
                    <div class="header">
                        <img class="logo" src="assets/images/logo.svg" alt="">
                        <h5>Đăng nhập</h5>
                    </div>
                    <div class="body">
                    <span style="color:red;">${thongbao }</span>
                        <div class="input-group mb-3">
                           <s:input type="text" class="form-control" placeholder="Username" path="taiKhoan"  required="true"></s:input>
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="zmdi zmdi-account-circle"></i></span>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                        <s:input type="password" class="form-control" placeholder="Password" path="matKhau" required="true" ></s:input>
                            <div class="input-group-append">                                
                                <span class="input-group-text"><a href="forgot-password.html" class="forgot" title="Forgot Password"><i class="zmdi zmdi-lock"></i></a></span>
                            </div>                            
                        </div>
                        <div class="checkbox">
                            <input id="remember_me" type="checkbox">
                            <label for="remember_me">Ghi nhớ</label>
                        </div>
                        <button class="btn btn-primary btn-block waves-effect waves-light dangnhap" type="submit">Đăng nhập</button>                        
                        <div class="signin_with mt-3">
                            <p class="mb-0">hoặc Đăng ký bằng</p>
                            <button class="btn btn-primary btn-icon btn-icon-mini btn-round facebook"><i class="zmdi zmdi-facebook"></i></button>
                            <button class="btn btn-primary btn-icon btn-icon-mini btn-round twitter"><i class="zmdi zmdi-twitter"></i></button>
                            <button class="btn btn-primary btn-icon btn-icon-mini btn-round google"><i class="zmdi zmdi-google-plus"></i></button>
                        </div>
                    </div>
                </s:form>
                <div class="copyright text-center">
                    &copy;
                    <script>document.write(new Date().getFullYear())</script>,
                    <span>Designed by <a href="https://thememakker.com/" target="_blank">ThemeMakker</a></span>
                </div>
            </div>
            <div class="col-lg-8 col-sm-12">
                <div class="card">
                    <img src="${resources }/assets/images/signin.svg" alt="Sign In"/>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Jquery Core Js -->
<script src="${resources }/assets/bundles/libscripts.bundle.js"></script>
<script src="${resources }/assets/bundles/vendorscripts.bundle.js"></script> <!-- Lib Scripts Plugin Js -->

</body>
</html>