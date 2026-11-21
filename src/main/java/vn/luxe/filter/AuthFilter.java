package vn.luxe.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import vn.luxe.model.User;
import vn.luxe.util.AuthUtil;

public class AuthFilter implements Filter {
  public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
      throws IOException, ServletException {
    HttpServletRequest r = (HttpServletRequest) req;
    HttpServletResponse s = (HttpServletResponse) res;
    String path = r.getServletPath();
    if (r.getPathInfo() != null) path += r.getPathInfo();
    String area =
        path.startsWith("/manager/") || path.equals("/manager")
            ? "manager"
            : path.startsWith("/employee/") || path.equals("/employee")
                ? "employee"
                : path.startsWith("/customer/") || path.equals("/customer") ? "customer" : "";
    if (!area.isEmpty()) {
      s.setHeader("Cache-Control", "no-store");
      User u = AuthUtil.getUser(r);
      if (u == null) {
        r.getSession().setAttribute("returnTo", path);
        s.sendRedirect(r.getContextPath() + "/login");
        return;
      }
      boolean allowed =
          area.equals(u.getRole()) || area.equals("employee") && u.getRole().equals("manager");
      if (!allowed) {
        s.setStatus(403);
        r.getRequestDispatcher("/WEB-INF/views/forbidden.jsp").forward(r, s);
        return;
      }
    }
    if ("POST".equals(r.getMethod())) {
      HttpSession session = r.getSession(false);
      Object token = session == null ? null : session.getAttribute("csrf");
      if (token == null || !token.equals(r.getParameter("csrf"))) {
        s.sendError(403, "Phiên biểu mẫu không hợp lệ. Hãy tải lại trang.");
        return;
      }
    }
    chain.doFilter(r, s);
  }
}
