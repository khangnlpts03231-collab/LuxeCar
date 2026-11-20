<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="vn.luxe.util.*,vn.luxe.model.*,java.util.*" %>
<% String base=request.getContextPath(); User currentUser=AuthUtil.getUser(request); %>
<!doctype html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LuxeMotor — The art of automotive</title>
<link rel="stylesheet" href="<%=base%>/assets/style.css">
</head>
<body>
<header class="header">
<a class="identity" href="<%=base%>/home">
<span class="monogram">LM</span>
<span>LUXEMOTOR<small>THE ART OF AUTOMOTIVE</small>
</span>
</a>
<nav aria-label="Điều hướng chính">
<a href="<%=base%>/home#collection">Bộ sưu tập</a>
<a href="<%=base%>/home#story">Về LuxeMotor</a>
<a href="<%=base%>/home#experience">Không gian trải nghiệm</a>
</nav>
<a class="login-link" href="<%=base%>/<%=currentUser==null?"login":currentUser.getRole()+"/home"%>">
<%=currentUser==null?"Đăng nhập":ParamUtil.html(currentUser.getFullName())%> ↗</a>
</header>
<main class="portal">
<p class="eyebrow">
<%=currentUser.getRole().equals("manager")?"KHU VỰC QUẢN LÝ":currentUser.getRole().equals("employee")?"KHU VỰC NHÂN VIÊN":"TÀI KHOẢN KHÁCH HÀNG"%>
</p>
<h1>Xin chào,<br>
<em>
<%=ParamUtil.html(currentUser.getFullName())%>.</em>
</h1>
<p>
<%=ParamUtil.html(currentUser.getEmail())%>
</p>
<p class="muted">Bạn đã đăng nhập thành công. Chọn một khu vực bên dưới để tiếp tục.</p>
<div class="portal-actions">
<a class="button dark" href="<%=base%>/home">Khám phá bộ sưu tập ↗</a>
<% if(AuthUtil.isManager(request)){ %>
<a class="button outline" href="<%=base%>/manager/categories">Quản lý danh mục ↗</a>
<a class="text-link" href="<%=base%>/employee/home">Khu vực nhân viên ↗</a>
<% } %>
</div>
<form method="post" action="<%=base%>/logout">
<input type="hidden" name="csrf" value="<%=AuthUtil.csrf(request)%>">
<button class="text-link logout">Đăng xuất ↗</button>
</form>
</main>
<footer>
<a class="wordmark" href="<%=base%>/home">LUXEMOTOR</a>
<p>Đam mê chuyển động. Dấu ấn của riêng bạn.</p>
<small>Dự án học tập • <a href="<%=base%>/credits.html">Nguồn ảnh và giấy phép ↗</a>
</small>
</footer>
</body>
</html>
