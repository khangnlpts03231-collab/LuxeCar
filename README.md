# LuxeMotor — Lab 4

Code dự án đặt ngay tại thư mục gốc của nhánh `main`: `src/`, `sql/`, `pom.xml`.
Tài liệu PDF nằm ở [nhánh lab](https://github.com/khangnlpts03231-collab/LuxeCar/tree/lab).

## Tiến độ
Commit khởi tạo chỉ có giao diện mẫu/ảnh và hướng dẫn. Các thành viên bổ sung Java, SQL và cấu hình theo bảng phân công Lab 4. Chỉ chạy đầy đủ sau khi đã tích hợp đủ 6 phần; không coi khung ban đầu là bản hoàn thiện.

## Cách chạy sau khi tích hợp
Xem HUONG_DAN_CHAY.md. Import Maven vào Eclipse, JDK 21, Tomcat 11, SQL Server. Không commit thư mục target, file .class hoặc cấu hình Eclipse cá nhân. db.properties trên repo là cấu hình mẫu, không chứa mật khẩu SQL Server cá nhân.

## Phân công file
| Thành viên | File phụ trách |
|---|---|
| Khang | AuthUtil.java; kiểm tra session ở Bài 2 |
| Đạt | Lab4.sql, JdbcUtil.java, db.properties, pom.xml, User.java, Passwords.java |
| Quốc Anh | ParamUtil.java, Category.java, CategoryDAO.java |
| Khải | Utf8Filter.java, web.xml, CategoryServlet.java |
| Huyền | AuthFilter.java, UserDAO.java |
| Khiêm | AuthServlet.java, PageServlet.java; kiểm tra CRUD ở Bài 4 |

Giao diện dùng mẫu chung có hỗ trợ AI, không tính thành phần Java của từng người. Thành viên phải đọc, hiểu, kiểm tra và tự push phần được giao bằng tài khoản của mình. Commit thể hiện việc đóng góp lên repo, không thay thế kết quả kiểm tra thực tế.
