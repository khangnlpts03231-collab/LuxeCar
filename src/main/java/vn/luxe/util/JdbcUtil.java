package vn.luxe.util;

import java.io.*;
import java.sql.*;
import java.util.Properties;

public class JdbcUtil {
  public static Connection getConnection() throws SQLException {
    Properties p = new Properties();
    try (InputStream in = JdbcUtil.class.getResourceAsStream("/db.properties")) {
      if (in == null) throw new IOException("Thiếu db.properties");
      p.load(in);
      Class.forName(
          System.getProperty("lab4.jdbc.driver", "com.microsoft.sqlserver.jdbc.SQLServerDriver"));
    } catch (IOException | ClassNotFoundException e) {
      throw new SQLException(e);
    }
    return DriverManager.getConnection(
        System.getProperty("lab4.jdbc.url", p.getProperty("url")),
        System.getProperty("lab4.jdbc.user", p.getProperty("user")),
        System.getProperty("lab4.jdbc.password", p.getProperty("password")));
  }

  public static int update(String sql, Object... values) throws SQLException {
    try (Connection c = getConnection();
        PreparedStatement s = c.prepareStatement(sql)) {
      for (int i = 0; i < values.length; i++) s.setObject(i + 1, values[i]);
      return s.executeUpdate();
    }
  }
}
