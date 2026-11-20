<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="vn.luxe.util.*,vn.luxe.model.*,java.util.*" %>
<% String base=request.getContextPath(); User currentUser=AuthUtil.getUser(request); %>
<% boolean register=Boolean.TRUE.equals(request.getAttribute("register")); %>
<!doctype html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>LuxeMotor — The art of automotive</title>
<link rel="stylesheet" href="<%=base%>/assets/style.css">
</head>
<body>
<main class="auth-layout">
<section class="auth-art">
<a class="wordmark" href="<%=base%>/home">LUXEMOTOR</a>
<p class="eyebrow">THE ART OF AUTOMOTIVE</p>
<h1>Mỗi hành trình.<br>
<em>Một dấu ấn.</em>
</h1>
<img src="<%=base%>/assets/hero.png" alt="Lamborghini Temerario">
<p>Khám phá những thiết kế đánh thức đam mê.</p>
<a class="text-link" href="<%=base%>/home">← Trở về bộ sưu tập</a>
</section>
<section class="auth-form">
<a class="back" href="<%=base%>/home">← Trang chủ</a>
<p class="eyebrow">CHÀO MỪNG ĐẾN LUXEMOTOR</p>
<h1>
<%=register?"Khởi đầu mới.":"Chào mừng trở lại."%>
</h1>
<p class="muted">
<%=register?"Tạo tài khoản khách hàng để bắt đầu hành trình.":"Đăng nhập để tiếp tục cùng LuxeMotor."%>
</p>
<% if(request.getAttribute("error")!=null){ %>
<p class="message error" role="alert">
<%=ParamUtil.html(request.getAttribute("error"))%>
</p>
<% } %>
<% if(request.getParameter("registered")!=null){ %>
<p class="message success">Đăng ký thành công. Hãy đăng nhập.</p>
<% } %>
<form method="post" action="<%=base%>/<%=register?"register":"login"%>">
<input type="hidden" name="csrf" value="<%=AuthUtil.csrf(request)%>">
<% if(register){ %>
<label>Họ và tên<input name="name" required minlength="2" maxlength="100" autocomplete="name" value="<%=ParamUtil.html(request.getParameter("name"))%>">
</label>
<label>Số điện thoại<input name="phone" required pattern="0[0-9]{9}" maxlength="10" inputmode="tel" autocomplete="tel" value="<%=ParamUtil.html(request.getParameter("phone"))%>">
</label>
<% } %>
<label>Email<input name="email" type="email" required maxlength="100" autocomplete="email" value="<%=ParamUtil.html(request.getParameter("email"))%>">
</label>
<label>Mật khẩu<span class="password-wrap">
<input id="password" name="password" type="password" required <%=register?"minlength='8' maxlength='72' autocomplete='new-password'":"autocomplete='current-password'"%>>
<button type="button" id="show-password" aria-label="Hiện mật khẩu">Hiện</button>
</span>
</label>
<% if(register){ %>
<label>Nhập lại mật khẩu<input name="confirm" type="password" required minlength="8" maxlength="72" autocomplete="new-password">
</label>
<% } %>
<button class="button dark wide" type="submit">
<%=register?"Tạo tài khoản":"Đăng nhập"%> ↗</button>
</form>
<p class="auth-switch">
<%=register?"Đã có tài khoản?":"Chưa có tài khoản?"%> <a href="<%=base%>/<%=register?"login":"register"%>">
<%=register?"Đăng nhập":"Đăng ký"%>
</a>
</p>
<small class="muted">Thông tin được sử dụng trong phạm vi dự án học tập.</small>
</section>
</main>
<script>document.getElementById('show-password').onclick=function(){const p=document.getElementById('password');p.type=p.type==='password'?'text':'password';this.textContent=p.type==='password'?'Hiện':'Ẩn';};</script>
</body>
</html>
