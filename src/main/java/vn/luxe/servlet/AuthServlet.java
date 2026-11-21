package vn.luxe.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Locale;
import vn.luxe.dao.UserDAO;
import vn.luxe.model.User;
import vn.luxe.util.*;

@WebServlet({"/login", "/register", "/logout"})
public class AuthServlet extends HttpServlet {
  private final UserDAO dao = new UserDAO();

  protected void doGet(HttpServletRequest r, HttpServletResponse s)
      throws ServletException, IOException {
    if (r.getServletPath().equals("/logout")) {
      s.sendError(405);
      return;
    }
    r.setAttribute("register", r.getServletPath().equals("/register"));
    r.getRequestDispatcher("/WEB-INF/views/auth.jsp").forward(r, s);
  }

  protected void doPost(HttpServletRequest r, HttpServletResponse s)
      throws ServletException, IOException {
    if (r.getServletPath().equals("/logout")) {
      AuthUtil.clear(r);
      s.sendRedirect(r.getContextPath() + "/home");
      return;
    }
    boolean register = r.getServletPath().equals("/register");
    String email = ParamUtil.getString(r, "email").toLowerCase(Locale.ROOT);
    String password = r.getParameter("password");
    if (password == null) password = "";
    try {
      if (!email.matches("^[^\\s@]+@[^\\s@]+[.][^\\s@]+$") || email.length() > 100)
        throw new IllegalArgumentException("Email không hợp lệ.");
      if (register) {
        String name = ParamUtil.getString(r, "name"), phone = ParamUtil.getString(r, "phone");
        if (name.length() < 2 || name.length() > 100)
          throw new IllegalArgumentException("Họ tên cần từ 2 đến 100 ký tự.");
        if (!phone.matches("0[0-9]{9}"))
          throw new IllegalArgumentException("Số điện thoại cần 10 chữ số, bắt đầu bằng 0.");
        if (password.length() < 8 || password.length() > 72)
          throw new IllegalArgumentException("Mật khẩu cần từ 8 đến 72 ký tự.");
        if (!password.equals(r.getParameter("confirm")))
          throw new IllegalArgumentException("Mật khẩu nhập lại chưa khớp.");
        if (dao.emailExists(email)) throw new IllegalArgumentException("Email đã được sử dụng.");
        dao.register(name, email, phone, password);
        s.sendRedirect(r.getContextPath() + "/login?registered=1");
        return;
      }
      User u = dao.findByEmail(email);
      if (u == null || !Passwords.matches(password, u.getPasswordHash()))
        throw new IllegalArgumentException("Email hoặc mật khẩu không đúng.");
      String target = (String) r.getSession().getAttribute("returnTo");
      AuthUtil.clear(r);
      AuthUtil.setUser(r, u);
      if (target == null
          || !(target.startsWith("/" + u.getRole() + "/")
              || u.getRole().equals("manager") && target.startsWith("/employee/")))
        target = "/" + u.getRole() + "/home";
      s.sendRedirect(r.getContextPath() + target);
      return;
    } catch (IllegalArgumentException e) {
      r.setAttribute("error", e.getMessage());
    } catch (SQLException e) {
      log("Lỗi kết nối hoặc thao tác tài khoản", e);
      s.setStatus(503);
      r.setAttribute("error", "Chưa kết nối được dữ liệu. Kiểm tra SQL Server và db.properties.");
    }
    doGet(r, s);
  }
}
