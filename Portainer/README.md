# Portainer cho OwnCloud

Thư mục này chứa cấu hình để chạy và quản lý OwnCloud thông qua Portainer.

## Cấu trúc thư mục

- `docker-compose.yml`: File cấu hình để chạy Portainer
- `owncloud-stack.yml`: File stack mẫu để triển khai OwnCloud trong Portainer

## Hướng dẫn sử dụng

### Bước 1: Khởi động Portainer

```bash
docker-compose up -d
```

### Bước 2: Truy cập Portainer

Mở trình duyệt và truy cập: `http://localhost:9000`

Khi đăng nhập lần đầu:
1. Tạo tài khoản quản trị viên
2. Chọn môi trường Local để quản lý

### Bước 3: Tạo và triển khai OwnCloud Stack

1. Từ menu bên trái, chọn `Stacks`
2. Nhấp vào `Add stack`
3. Đặt tên stack (ví dụ: "owncloud")
4. Copy nội dung từ file `owncloud-stack.yml` vào trường Web editor
5. Nhấp vào `Deploy the stack`

### Bước 4: Truy cập OwnCloud

Sau khi triển khai thành công, bạn có thể truy cập OwnCloud tại:
- `http://localhost:8080` (nếu giữ cổng mặc định)
- `http://localhost:8081` (nếu đã cấu hình trong biến môi trường)

### Quản lý OwnCloud trong Portainer

Với Portainer bạn có thể:
- Giám sát tài nguyên sử dụng
- Xem logs của các container
- Quản lý volumes và networks
- Khởi động lại, dừng và cập nhật các container
- Mở terminal console vào các container

## Biến môi trường

Các biến môi trường có thể được cấu hình trong Portainer khi triển khai stack:

### OwnCloud
- `OWNCLOUD_VERSION`: Phiên bản OwnCloud (mặc định: latest)
- `OWNCLOUD_PORT`: Cổng để truy cập OwnCloud (mặc định: 8080)
- `OWNCLOUD_DOMAIN`: Domain của OwnCloud (mặc định: localhost:8080)
- `OWNCLOUD_ADMIN_USERNAME`: Tên người dùng admin (mặc định: admin)
- `OWNCLOUD_ADMIN_PASSWORD`: Mật khẩu admin (mặc định: admin_password)

### Database
- `MARIADB_VERSION`: Phiên bản MariaDB (mặc định: 10.6)
- `DB_ROOT_PASSWORD`: Mật khẩu root của MariaDB (mặc định: root_password)
- `DB_NAME`: Tên database (mặc định: owncloud)
- `DB_USER`: Tên người dùng database (mặc định: owncloud)
- `DB_PASSWORD`: Mật khẩu database (mặc định: owncloud_password)

### Redis
- `REDIS_VERSION`: Phiên bản Redis (mặc định: 6) 