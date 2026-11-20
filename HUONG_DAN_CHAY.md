# Lab 4 LuxeMotor

## Chạy web trên Eclipse
1. Giải nén vào thư mục mới. Không chồng lên Lab 3. Import → Maven → Existing Maven Projects, chọn thư mục có pom.xml.
2. Dùng JDK 21 và Tomcat 11. Dự án dùng Jakarta Servlet/JSP, JDBC; không dùng JPA trong Lab 4.
3. Mở SSMS, chạy sql/Lab4.sql một lần. Script tạo CSDL riêng LuxeMotorLab4. Nếu đã tồn tại, không chạy lại câu CREATE DATABASE hoặc xóa dữ liệu cũ.
4. Sửa src/main/resources/db.properties theo SQL Server của máy. Bật TCP/IP, kiểm tra cổng 1433 và tài khoản SQL Authentication. Điền password của tài khoản SQL Server, không phải mật khẩu web.
5. Eclipse: Maven → Update Project. Chọn Run As → Run on Server → Tomcat 11. Đây là web, không chạy Java Application.
6. Mở http://localhost:8080/LuxeMotor-Lab4/home. Nếu Eclipse đặt context root khác, thay LuxeMotor-Lab4 theo Modules của server.
7. Nếu đóng gói bằng Maven: mvn clean package; chép target/LuxeMotor-Lab4.war vào webapps của Tomcat.

## Tài khoản mẫu
Mật khẩu chung: Luxe@123 (chỉ dùng trong bài thực hành).

| Vai trò | Email | Đường dẫn sau đăng nhập |
|---|---|---|
| Khách hàng | customer@luxemotor.vn | /customer/home |
| Nhân viên | staff@luxemotor.vn | /employee/home |
| Quản lý | manager@luxemotor.vn | /manager/home |

Tài khoản tự đăng ký luôn là khách hàng. Nhân viên/quản lý chỉ có dữ liệu mẫu, chưa làm màn hình tạo nhân viên trong lab này.

## Đọc code theo đề
- Bài 1: util/AuthUtil.java và ParamUtil.java.
- Bài 2: filter/Utf8Filter.java, AuthFilter.java; thứ tự filter khai báo trong WEB-INF/web.xml.
- Bài 3: dao/UserDAO.java và servlet/AuthServlet.java, views/auth.jsp. Login dùng findByEmail, kiểm tra mật khẩu rồi lưu session; logout hủy session.
- Bài 4: CategoryDAO → CategoryServlet → categories.jsp. SQL trực tiếp và PreparedStatement, không dùng framework phức tạp.
- Bài 5: chờ yêu cầu bổ sung của giảng viên.
- model/User chỉ là đối tượng session chung, không phải bảng Account. CSDL vẫn tách customers, employees, managers.
- Passwords băm mật khẩu; CSRF là mã kiểm tra biểu mẫu. Không cần học thuộc thuật toán băm để giải thích luồng login.

## Phân quyền
Trang chủ, chi tiết xe, đăng ký và đăng nhập là công khai. Khách chưa login vào URL riêng sẽ được chuyển đến login. Đăng nhập sai vai trò bị trả HTTP 403. Quản lý được vào /employee/*, nhưng nhân viên và quản lý không dùng /customer/*: muốn mua xe dùng tài khoản khách hàng riêng như đã thống nhất.

## Phạm vi giao diện
Trang chủ có bộ sưu tập 3 xe, nút trái/phải, vuốt trên điện thoại và trang chi tiết. Temerario có 3 màu × 2 góc minh họa; xe khác đổi ảnh theo màu có sẵn. Ảnh phối màu tạo bằng AI, ảnh thực tế ghi nguồn ở credits.html. Giá/thông số lấy từ ZIP giao diện mẫu, chỉ dùng minh họa học tập.
Bộ sưu tập dùng assets/catalog.js, chưa đồng bộ từ CSDL. CRUD danh mục thực sự lưu SQL Server; màn hình danh mục và dữ liệu trưng bày sẽ nối nhau khi làm quản lý xe ở lab sau. Bảng vehicles trong script chỉ để thử ràng buộc danh mục đang có xe.
Chưa làm giỏ hàng, đặt cọc, hóa đơn, nhắn tin, hoàn tiền, quản lý kho, quên mật khẩu hoặc tải ảnh lên. FileUtil có trong mục giới thiệu slide nhưng không nằm trong yêu cầu triển khai Bài 1 của đề Lab 4; chưa thêm upload ngoài phạm vi.

## Lỗi thường gặp
- Trang 404: kiểm tra context root, dự án đã Add vào Tomcat chưa; dùng /home.
- Trang 503: kiểm tra CSDL, user/password, cổng SQL Server trong db.properties.
- Trang 403 sau khi để form lâu: tải lại form rồi gửi lại; session hết hạn sau 30 phút.
- Không xóa được danh mục: danh mục có xe hoặc có dữ liệu liên quan. Thử thêm một danh mục mới rồi xóa danh mục vừa tạo.
- Email của ba nhóm cần duy nhất toàn hệ thống. Đăng ký kiểm tra cả ba bảng; khi nhập nhân viên/quản lý bằng SQL cũng phải giữ quy tắc đó.

Hướng dẫn kiểm tra và kết quả nằm riêng trong KET_QUA_KIEM_TRA.md.
