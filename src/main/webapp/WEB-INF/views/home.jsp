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
<main id="collection">
<section class="hero">
<div class="hero-top">
<div>
<p class="eyebrow">THE LUXEMOTOR COLLECTION / 2026</p>
<h1>Đam mê.<br>
<em>Không giới hạn.</em>
</h1>
</div>
<p class="intro">Một tuyển chọn dành cho những người<br>không chỉ tìm kiếm một chiếc xe.<br>Mà tìm thấy chính mình trong đó.</p>
</div>
<div class="stage" aria-live="polite">
<span class="backtype" id="backtype">TEMERARIO</span>
<img id="hero-car" src="<%=base%>/assets/hero.png" alt="Lamborghini Temerario màu vàng">
<button class="arrow prev" id="previous" aria-label="Xe trước">←</button>
<button class="arrow next" id="next" aria-label="Xe tiếp theo">→</button>
</div>
<div class="hero-bottom">
<div>
<span class="eyebrow" id="car-brand">LAMBORGHINI</span>
<h2 id="car-name">Temerario</h2>
</div>
<div class="hero-middle">
<p id="car-note">Một góc nhìn mới về đam mê.</p>
<div class="dots" id="dots" aria-label="Chọn xe">
</div>
</div>
<a class="button dark" id="detail-link" href="<%=base%>/vehicle?id=101">Khám phá chi tiết <span>↗</span>
</a>
</div>
</section>
<div class="brands">
<span>LAMBORGHINI</span>
<span>ROLLS-ROYCE</span>
<span>McLAREN</span>
</div>
<section class="story" id="story">
<p class="eyebrow">01 / TINH THẦN LUXEMOTOR</p>
<div>
<h2>Hơn một chiếc xe.<br>
<em>Một dấu ấn riêng.</em>
</h2>
<p>Từ những đường nét đầu tiên đến cảm giác sau vô lăng, mỗi chiếc xe là một cách thể hiện cá tính. Khám phá bộ sưu tập, lựa chọn sắc màu và tìm một thiết kế khiến bạn muốn lên đường.</p>
<a class="text-link" href="#collection">Tìm cảm hứng của bạn ↗</a>
</div>
</section>
<section id="experience" class="experience">
<div>
<p class="eyebrow">KHÔNG GIAN TRẢI NGHIỆM</p>
<h2>Chậm lại.<br>
<em>Cảm nhận sự khác biệt.</em>
</h2>
<p>Một cuộc gặp gỡ với thiết kế, chất liệu và chuyển động.</p>
<a class="button light" href="<%=base%>/register">Bắt đầu cùng LuxeMotor ↗</a>
</div>
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
