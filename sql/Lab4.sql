-- LAB 4: CSDL riêng để thực hành đăng nhập và CRUD danh mục.
-- Chạy một lần trong SSMS; không xóa hoặc sửa CSDL Lab 3.
CREATE DATABASE LuxeMotorLab4;
GO
USE LuxeMotorLab4;
GO
CREATE TABLE managers (id INT IDENTITY PRIMARY KEY, email VARCHAR(100) NOT NULL UNIQUE, full_name NVARCHAR(100) NOT NULL, phone VARCHAR(10) NOT NULL, password_hash VARCHAR(255) NOT NULL, active BIT NOT NULL DEFAULT 1);
INSERT INTO managers(email,full_name,phone,password_hash) VALUES ('manager@luxemotor.vn',N'Quản lý mẫu','0901234567','THV4ZU1vdG9yTGFiNGRlbW8=.uPh93WJ9zDDN+AZJP1xw6s4tO+5NEuwr6eJg76aklnk=');
CREATE TABLE employees (id INT IDENTITY PRIMARY KEY, email VARCHAR(100) NOT NULL UNIQUE, full_name NVARCHAR(100) NOT NULL, phone VARCHAR(10) NOT NULL, password_hash VARCHAR(255) NOT NULL, active BIT NOT NULL DEFAULT 1, manager_id INT REFERENCES managers(id));
INSERT INTO employees(email,full_name,phone,password_hash) VALUES ('staff@luxemotor.vn',N'Nhân viên mẫu','0901234567','THV4ZU1vdG9yTGFiNGRlbW8=.uPh93WJ9zDDN+AZJP1xw6s4tO+5NEuwr6eJg76aklnk=');
CREATE TABLE customers (id INT IDENTITY PRIMARY KEY, email VARCHAR(100) NOT NULL UNIQUE, full_name NVARCHAR(100) NOT NULL, phone VARCHAR(10) NOT NULL, password_hash VARCHAR(255) NOT NULL);
INSERT INTO customers(email,full_name,phone,password_hash) VALUES ('customer@luxemotor.vn',N'Khách hàng mẫu','0901234567','THV4ZU1vdG9yTGFiNGRlbW8=.uPh93WJ9zDDN+AZJP1xw6s4tO+5NEuwr6eJg76aklnk=');
CREATE TABLE categories(id INT IDENTITY PRIMARY KEY,name NVARCHAR(100) NOT NULL UNIQUE,description NVARCHAR(255),active BIT NOT NULL DEFAULT 1);
CREATE TABLE vehicles(id INT IDENTITY PRIMARY KEY,name NVARCHAR(100) NOT NULL,category_id INT NOT NULL REFERENCES categories(id));
INSERT INTO categories(name,description) VALUES(N'Siêu xe',N'Những dấu ấn hiệu năng'),(N'Grand Touring',N'Những hành trình tinh tế'),(N'SUV hạng sang',N'Tự do khám phá');
INSERT INTO vehicles(name,category_id) VALUES(N'Temerario',1);
-- Tài khoản mẫu đều dùng mật khẩu Luxe@123. Chỉ dùng để học.
-- Email giữa ba bảng phải được kiểm tra trùng khi tạo tài khoản.
