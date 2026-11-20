package vn.luxe.util;

import jakarta.servlet.http.*;
import java.util.UUID;
import vn.luxe.model.User;

public class AuthUtil {
  public static void setUser(HttpServletRequest r, User u) {
    r.getSession()
        .setAttribute(
            "user", new User(u.getId(), u.getEmail(), u.getFullName(), u.getRole(), null));
  }

  public static User getUser(HttpServletRequest r) {
    HttpSession s = r.getSession(false);
    return s == null ? null : (User) s.getAttribute("user");
  }

  public static boolean isAuthenticated(HttpServletRequest r) {
    return getUser(r) != null;
  }

  public static boolean isManager(HttpServletRequest r) {
    return isAuthenticated(r) && "manager".equals(getUser(r).getRole());
  }

  public static void clear(HttpServletRequest r) {
    HttpSession s = r.getSession(false);
    if (s != null) s.invalidate();
  }

  public static String csrf(HttpServletRequest r) {
    HttpSession s = r.getSession();
    String token = (String) s.getAttribute("csrf");
    if (token == null) {
      token = UUID.randomUUID().toString();
      s.setAttribute("csrf", token);
    }
    return token;
  }
}
