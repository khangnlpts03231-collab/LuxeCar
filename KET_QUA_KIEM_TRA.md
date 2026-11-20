# Kiểm tra Lab 4

Ngày kiểm tra: 19/11/2026.

## Đã chạy thực tế
Biên dịch Maven WAR bằng JDK 21, target Java 17. Chạy Servlet, Filter và JSP trên Tomcat 11.0.14 với H2 2.3.232 ở chế độ MSSQLServer cho dữ liệu thử nghiệm. Script kiểm tra gửi yêu cầu HTTP, giữ cookie session và đọc dữ liệu qua JDBC thật. Không phải chỉ đọc mã nguồn.

37/37 trường hợp HTTP đạt trong môi trường trên. H2 chỉ phục vụ kiểm tra nội bộ, không thêm vào dự án nộp; cấu hình dự án vẫn là SQL Server.

| STT | Trường hợp | Kết quả |
|---|---|---|
| 1 | Trang chủ render JSP 200 | Đạt |
| 2 | Trang login 200 | Đạt |
| 3 | Trang register 200 | Đạt |
| 4 | Trang vehicle?id=101 200 | Đạt |
| 5 | Khách chưa đăng nhập bị chặn customer/home | Đạt |
| 6 | Khách chưa đăng nhập bị chặn employee/home | Đạt |
| 7 | Khách chưa đăng nhập bị chặn manager/home | Đạt |
| 8 | Khách chưa đăng nhập bị chặn manager/categories | Đạt |
| 9 | Khách chưa đăng nhập bị chặn %6danager/categories | Đạt |
| 10 | POST thiếu CSRF 403 | Đạt |
| 11 | Mật khẩu sai | Đạt |
| 12 | Mật khẩu xác nhận sai | Đạt |
| 13 | Đăng ký thành công | Đạt |
| 14 | Email trùng | Đạt |
| 15 | Không thể giả mạo role khi đăng ký | Đạt |
| 16 | Khách vào khu vực khách | Đạt |
| 17 | Khách bị chặn employee/home | Đạt |
| 18 | Khách bị chặn manager/categories | Đạt |
| 19 | Khách bị chặn %6danager/categories | Đạt |
| 20 | Đăng xuất POST | Đạt |
| 21 | Session đã hủy | Đạt |
| 22 | Nhân viên đăng nhập | Đạt |
| 23 | Nhân viên truy cập đúng quyền | Đạt |
| 24 | Nhân viên không vào quản lý | Đạt |
| 25 | Nhân viên không vào tài khoản khách | Đạt |
| 26 | Quản lý đăng nhập | Đạt |
| 27 | Quản lý kế thừa nhân viên | Đạt |
| 28 | Danh mục đọc từ JDBC | Đạt |
| 29 | Thêm danh mục | Đạt |
| 30 | Hiển thị tên tiếng Việt | Đạt |
| 31 | Sửa danh mục | Đạt |
| 32 | Lưu nội dung sửa | Đạt |
| 33 | Xóa danh mục chưa có xe | Đạt |
| 34 | Không xóa danh mục có xe | Đạt |
| 35 | Chặn tên danh mục trùng | Đạt |
| 36 | Chặn JSP trực tiếp | Đạt |
| 37 | GET không đăng xuất | Đạt |

## Chưa xác nhận
Chưa chạy với SQL Server trên máy thành viên. Chưa xác nhận toàn bộ giao diện bằng trình duyệt: môi trường xem trước chặn URL tệp cục bộ. Trang JSP đã render thành công qua Tomcat; điều này không thay thế kiểm tra bố cục và tương tác trong trình duyệt.

## Thành viên kiểm tra trên máy
1. Mở /home: kiểm tra ảnh tách nền, nút trái/phải, vuốt, liên kết chi tiết và hiển thị ở màn hình điện thoại.
2. Mở chi tiết Temerario: bấm từng màu và góc, kiểm tra cả 6 hình. Hai xe khác đổi ảnh theo màu.
3. Đăng ký một email mới rồi đăng nhập; kiểm tra sai mật khẩu và trùng email.
4. Dùng từng tài khoản mẫu truy cập trực tiếp ba URL /customer/home, /employee/home, /manager/categories để đối chiếu quyền.
5. Quản lý thêm danh mục có dấu tiếng Việt, sửa tên, ẩn/hiện, xóa danh mục mới. Không được xóa danh mục Siêu xe đang có xe mẫu.
6. Đăng xuất rồi quay lại URL riêng: phải trở về login.

Ghi kết quả và ảnh chụp từ lần chạy thực tế của nhóm; không dùng kết quả môi trường thử nghiệm thay cho bằng chứng SQL Server của nhóm.
