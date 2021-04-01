<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside id="leftsidebar" class="sidebar">
    <div class="navbar-brand">
        <button class="btn-menu ls-toggle-btn" type="button"><i class="zmdi zmdi-menu"></i></button>
        <a href="index.html"><img src="<c:url value="/resources/admin/assets/images/logo.svg"/>" width="25" alt="Aero"><span class="m-l-10">Aero</span></a>
    </div>
    <div class="menu">
        <ul class="list">
            <li>
                <div class="user-info">
                    <a class="image" href="profile.html"><img src="<c:url value="/resources/admin/assets/images/profile_av.jpg"/>" alt="User"></a>
                    <div class="detail">
                        <h4>${taikhoan.hoTen }</h4>
                        <small></small>                        
                    </div>
                </div>
            </li>
            <li class="leftSidebar"><a href="index.html"><i class="zmdi zmdi-home"></i><span>Dashboard</span></a></li>
            <li class="leftSidebar"><a href="${pageContext.request.contextPath}/admin/captaikhoan/${taikhoan.id}"><i class="zmdi zmdi-account"></i><span>Tài khoản</span></a></li>
            <li class="active open leftSidebar"><a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-shopping-cart"></i><span>Sản phẩm</span></a>
                <ul class="ml-menu">
                    <li class="active "><a href="${pageContext.request.contextPath}/admin/sanphamadd">Thêm mới sản phẩm</a></li>
                    <li ><a href="${pageContext.request.contextPath}/admin/dssanpham">Danh sách sản phẩm</a></li>                   
                </ul>
            </li>
            <li class="leftSidebar"> <a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-assignment"></i><span>Khách hàng</span></a>
                <ul class="ml-menu">
                    <li><a href="${pageContext.request.contextPath}/admin/dskhachhang">Danh sách khách hàng</a></li>
                </ul>
            </li>
            <li class="leftSidebar"> <a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-folder"></i><span>Đơn hàng</span></a>
                <ul class="ml-menu">
                    <li><a href="${pageContext.request.contextPath}/admin/dsdonhang">Danh sách đơn hàng</a></li>
                </ul>
            </li>
            <li class="leftSidebar"> <a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-blogger"></i><span>Quản lý thuộc tính</span></a>
                <ul class="ml-menu">
                    <li><a href="${pageContext.request.contextPath}/admin/dsdanhmuc">Danh sách Danh mục</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/hangsanxuat">Danh sách hãng sản xuất</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/dsxuatxu">Danh sách xuất xứ</a></li>
                </ul>
            </li>
            <li class="leftSidebar"><a href="javascript:void(0);" class="menu-toggle"><i class="zmdi zmdi-shopping-cart"></i><span>Quản trị hệ thống</span></a>
                <ul class="ml-menu">
                    <li><a href="${pageContext.request.contextPath}/admin/captaikhoan">Cấp tài khoản</a></li>
                    <li><a href="ec-product.html">Phân quyền</a></li>
                    
                </ul>
            </li>
            
        </ul>
    </div>
</aside>