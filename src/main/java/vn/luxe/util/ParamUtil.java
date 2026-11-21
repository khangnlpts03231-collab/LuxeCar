package vn.luxe.util;

import jakarta.servlet.http.HttpServletRequest;

public class ParamUtil {
  public static String getString(HttpServletRequest r, String key) {
    String v = r.getParameter(key);
    return v == null ? "" : v.trim();
  }

  public static int getInt(HttpServletRequest r, String key) {
    try {
      return Integer.parseInt(getString(r, key));
    } catch (NumberFormatException e) {
      return 0;
    }
  }

  public static boolean getBoolean(HttpServletRequest r, String key) {
    String v = getString(r, key);
    return "true".equalsIgnoreCase(v) || "on".equalsIgnoreCase(v);
  }

  public static String html(Object value) {
    return value == null
        ? ""
        : value
            .toString()
            .replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;")
            .replace("'", "&#39;");
  }
}
