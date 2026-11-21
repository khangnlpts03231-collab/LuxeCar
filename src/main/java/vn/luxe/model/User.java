package vn.luxe.model;

// DTO lưu người đang đăng nhập; không tạo bảng Account chung.
public class User {
  private final int id;
  private final String email, fullName, role, passwordHash;

  public User(int id, String email, String fullName, String role, String passwordHash) {
    this.id = id;
    this.email = email;
    this.fullName = fullName;
    this.role = role;
    this.passwordHash = passwordHash;
  }

  public int getId() {
    return id;
  }

  public String getEmail() {
    return email;
  }

  public String getFullName() {
    return fullName;
  }

  public String getRole() {
    return role;
  }

  public String getPasswordHash() {
    return passwordHash;
  }
}
