<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="vn.luxe.util.*,vn.luxe.model.*,java.util.*" %>
<% String base=request.getContextPath(); User currentUser=AuthUtil.getUser(request); %>
<% Category editing=(Category)request.getAttribute("editing"); List<Category> categories=(List<Category>)request.getAttribute("categories"); %>
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
<main class="admin">
<a class="back" href="<%=base%>/manager/home">← Khu vực quản lý</a>
<p class="eyebrow">QUẢN LÝ NỘI DUNG</p>
<h1>Danh mục xe.</h1>
<p class="muted">Thêm, sửa và xóa nhóm danh mục hiển thị. Danh mục đã có xe cần được giữ lại.</p>
<% if(request.getAttribute("error")!=null){ %>
<p class="message error" role="alert">
<%=ParamUtil.html(request.getAttribute("error"))%>
</p>
<% } %>
<% if(request.getParameter("saved")!=null){ %>
<p class="message success">Đã cập nhật danh mục.</p>
<% } %>
<div class="admin-grid">
<form method="post" action="<%=base%>/manager/categories" class="category-form">
<h2>
<%=editing==null?"Thêm danh mục":"Sửa danh mục"%>
</h2>
<input type="hidden" name="csrf" value="<%=AuthUtil.csrf(request)%>">
<input type="hidden" name="id" value="<%=editing==null?0:editing.getId()%>">
<input type="hidden" name="action" value="save">
<label>Tên danh mục<input name="name" required maxlength="100" value="<%=editing==null?"":ParamUtil.html(editing.getName())%>">
</label>
<label>Mô tả<textarea name="description" maxlength="255" rows="3">
<%=editing==null?"":ParamUtil.html(editing.getDescription())%>
</textarea>
</label>
<label class="check">
<input type="checkbox" name="active" <%=editing==null||editing.isActive()?"checked":""%>> Hiển thị</label>
<button class="button dark wide">Lưu danh mục ↗</button>
<% if(editing!=null){ %>
<a class="back" href="<%=base%>/manager/categories">Hủy sửa</a>
<% } %>
</form>
<div class="table-scroll">
<table>
<thead>
<tr>
<th>Mã</th>
<th>Danh mục</th>
<th>Trạng thái</th>
<th>Thao tác</th>
</tr>
</thead>
<tbody>
<% if(categories!=null)for(Category c:categories){ %>
<tr>
<td>
<%=c.getId()%>
</td>
<td>
<strong>
<%=ParamUtil.html(c.getName())%>
</strong>
<small>
<%=ParamUtil.html(c.getDescription())%>
</small>
</td>
<td>
<%=c.isActive()?"Hiển thị":"Ẩn"%>
</td>
<td>
<a href="<%=base%>/manager/categories?edit=<%=c.getId()%>">Sửa</a>
<form method="post" action="<%=base%>/manager/categories" onsubmit="return confirm('Xóa danh mục này?')">
<input type="hidden" name="csrf" value="<%=AuthUtil.csrf(request)%>">
<input type="hidden" name="id" value="<%=c.getId()%>">
<input type="hidden" name="action" value="delete">
<button class="delete">Xóa</button>
</form>
</td>
</tr>
<% } %>
</tbody>
</table>
</div>
</div>
</main>
<footer>
<a class="wordmark" href="<%=base%>/home">LUXEMOTOR</a>
<p>Đam mê chuyển động. Dấu ấn của riêng bạn.</p>
<small>Dự án học tập • <a href="<%=base%>/credits.html">Nguồn ảnh và giấy phép ↗</a>
</small>
</footer>
</body>
</html>
