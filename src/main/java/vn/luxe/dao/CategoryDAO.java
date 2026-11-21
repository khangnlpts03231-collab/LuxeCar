package vn.luxe.dao;

import java.sql.*;
import java.util.*;
import vn.luxe.model.Category;
import vn.luxe.util.JdbcUtil;

public class CategoryDAO {
  private Category map(ResultSet r) throws SQLException {
    return new Category(
        r.getInt("id"), r.getString("name"), r.getString("description"), r.getBoolean("active"));
  }

  public List<Category> findAll() throws SQLException {
    List<Category> list = new ArrayList<>();
    try (Connection c = JdbcUtil.getConnection();
        PreparedStatement s = c.prepareStatement("SELECT * FROM categories ORDER BY id");
        ResultSet r = s.executeQuery()) {
      while (r.next()) list.add(map(r));
    }
    return list;
  }

  public Category findById(int id) throws SQLException {
    try (Connection c = JdbcUtil.getConnection();
        PreparedStatement s = c.prepareStatement("SELECT * FROM categories WHERE id=?")) {
      s.setInt(1, id);
      try (ResultSet r = s.executeQuery()) {
        return r.next() ? map(r) : null;
      }
    }
  }

  public int create(Category c) throws SQLException {
    return JdbcUtil.update(
        "INSERT INTO categories(name,description,active) VALUES(?,?,?)",
        c.getName(),
        c.getDescription(),
        c.isActive());
  }

  public int update(Category c) throws SQLException {
    return JdbcUtil.update(
        "UPDATE categories SET name=?,description=?,active=? WHERE id=?",
        c.getName(),
        c.getDescription(),
        c.isActive(),
        c.getId());
  }

  public int delete(int id) throws SQLException {
    return JdbcUtil.update("DELETE FROM categories WHERE id=?", id);
  }
}
