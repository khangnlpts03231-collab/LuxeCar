package vn.luxe.servlet;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet({"/home", "/vehicle", "/customer/home", "/employee/home", "/manager/home"})
public class PageServlet extends HttpServlet {
  protected void doGet(HttpServletRequest r, HttpServletResponse s)
      throws ServletException, IOException {
    String p = r.getServletPath();
    String view = p.equals("/home") ? "home" : p.equals("/vehicle") ? "vehicle" : "account";
    r.getRequestDispatcher("/WEB-INF/views/" + view + ".jsp").forward(r, s);
  }
}
