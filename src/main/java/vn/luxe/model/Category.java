package vn.luxe.model;

public class Category {
  private final int id;
  private final String name, description;
  private final boolean active;

  public Category(int id, String name, String description, boolean active) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.active = active;
  }

  public int getId() {
    return id;
  }

  public String getName() {
    return name;
  }

  public String getDescription() {
    return description;
  }

  public boolean isActive() {
    return active;
  }
}
