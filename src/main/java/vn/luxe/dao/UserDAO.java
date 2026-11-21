package vn.luxe.dao;

import java.sql.*;
import vn.luxe.model.User;
import vn.luxe.util.*;

public class UserDAO {
  public User findByEmail(String email) throws SQLException {
    String sql =
        "SELECT id,email,full_name,password_hash,'customer' AS role FROM customers WHERE email=?"
            + " UNION ALL SELECT id,email,full_name,password_hash,'employee' AS role FROM employees"
            + " WHERE email=? AND active=1 UNION ALL SELECT"
            + " id,email,full_name,password_hash,'manager' AS role FROM managers WHERE email=? AND"
            + " active=1";
    try (Connection c = JdbcUtil.getConnection();
        PreparedStatement s = c.prepareStatement(sql)) {
      for (int i = 1; i <= 3; i++) s.setString(i, email);
      try (ResultSet rs = s.executeQuery()) {
        if (rs.next())
          return new User(
              rs.getInt("id"),
              rs.getString("email"),
              rs.getString("full_name"),
              rs.getString("role"),
              rs.getString("password_hash"));
      }
    }
    return null;
  }

  public boolean emailExists(String email) throws SQLException {
    try (Connection c = JdbcUtil.getConnection();
        PreparedStatement s =
            c.prepareStatement(
                "SELECT email FROM customers WHERE email=? UNION ALL SELECT email FROM employees"
                    + " WHERE email=? UNION ALL SELECT email FROM managers WHERE email=?")) {
      for (int i = 1; i <= 3; i++) s.setString(i, email);
      try (ResultSet rs = s.executeQuery()) {
        return rs.next();
      }
    }
  }

  public void register(String name, String email, String phone, String password)
      throws SQLException {
    JdbcUtil.update(
        "INSERT INTO customers(full_name,email,phone,password_hash) VALUES(?,?,?,?)",
        name,
        email,
        phone,
        Passwords.hash(password));
  }
}
