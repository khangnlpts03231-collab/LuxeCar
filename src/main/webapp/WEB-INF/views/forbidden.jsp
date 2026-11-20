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
<p class="eyebrow">403 / GIỚI HẠN TRUY CẬP</p>
<h1>Khu vực này<br>
<em>chưa dành cho bạn.</em>
</h1>
<p>Tài khoản hiện tại không có quyền truy cập đường dẫn này.</p>
<a class="button dark" href="<%=base%>/home">Trở về trang chủ ↗</a>
</main>
<footer>
<a class="wordmark" href="<%=base%>/home">LUXEMOTOR</a>
<p>Đam mê chuyển động. Dấu ấn của riêng bạn.</p>
<small>Dự án học tập • <a href="<%=base%>/credits.html">Nguồn ảnh và giấy phép ↗</a>
</small>
</footer>
</body>
</html>
