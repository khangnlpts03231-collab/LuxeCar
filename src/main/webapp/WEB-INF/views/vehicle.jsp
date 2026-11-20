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
<main class="vehicle-page">
<a class="back" href="<%=base%>/home">← Bộ sưu tập</a>
<p id="detail-brand" class="eyebrow">
</p>
<h1 id="detail-title">Khám phá xe</h1>
<section class="configurator">
<div class="studio">
<div id="sprite" role="img" aria-label="Ảnh phối màu xe">
</div>
<img id="photo" alt="Ảnh xe được chọn" hidden>
<div id="angles">
<button class="selected" data-angle="0">Góc trước</button>
<button data-angle="1">Góc sau</button>
</div>
<small id="image-note">Ảnh phối màu minh họa</small>
</div>
<div class="configuration">
<p class="eyebrow">THIẾT KẾ CỦA RIÊNG BẠN</p>
<h2>Sắc màu.<br>
<em>Cá tính.</em>
</h2>
<p id="color-name">
</p>
<div class="swatches" id="swatches">
</div>
<div class="price">
<small>Giá tham khảo</small>
<strong id="price">
</strong>
</div>
<a class="button dark" href="<%=base%>/register">Đăng ký để kết nối ↗</a>
<p class="muted">Chọn một sắc màu phù hợp với bạn và khám phá từng chi tiết thiết kế.</p>
</div>
</section>
<section class="spec-section">
<div>
<p class="eyebrow">CHI TIẾT THIẾT KẾ</p>
<h2>Ấn tượng từ<br>
<em>từng góc nhìn.</em>
</h2>
</div>
<dl id="specs">
</dl>
</section>
<section class="photo-gallery" id="gallery">
</section>
</main>
<footer>
<a class="wordmark" href="<%=base%>/home">LUXEMOTOR</a>
<p>Đam mê chuyển động. Dấu ấn của riêng bạn.</p>
<small>Dự án học tập • <a href="<%=base%>/credits.html">Nguồn ảnh và giấy phép ↗</a>
</small>
</footer>
<script>const BASE = '<%=base%>/';</script>
<script src="<%=base%>/assets/catalog.js">
</script>
<script src="<%=base%>/assets/showroom.js">
</script>
</body>
</html>
