#!/bin/bash
# Script để thiết lập OwnCloud thông qua Portainer

set -e

echo "=== Thiết lập OwnCloud với Portainer ==="
echo ""

# Kiểm tra Portainer đã chạy chưa
if ! docker ps | grep -q portainer; then
  echo "Khởi động Portainer..."
  docker-compose up -d
  # Đợi Portainer khởi động
  sleep 5
  echo "Portainer đã khởi động!"
else
  echo "Portainer đang chạy."
fi

echo ""
echo "=== Thông tin Portainer ==="
echo "URL: http://localhost:9000"
echo ""
echo "Tại lần đăng nhập đầu tiên, bạn cần:"
echo "1. Tạo tài khoản admin"
echo "2. Chọn môi trường 'Local'"
echo ""

echo "=== Để triển khai OwnCloud trong Portainer ==="
echo "1. Từ menu, chọn 'Stacks'"
echo "2. Nhấp 'Add stack'"
echo "3. Đặt tên: 'owncloud'"
echo "4. Copy nội dung từ file: $(pwd)/owncloud-stack.yml"
echo "5. Dán vào trình soạn thảo web"
echo "6. Nhấp 'Deploy the stack'"
echo ""

echo "=== Các cổng quan trọng ==="
echo "Portainer:  http://localhost:9000"
echo "OwnCloud:   http://localhost:8080 (hoặc cổng bạn đã cấu hình)"
echo ""

echo "=== Để truy cập OwnCloud ==="
echo "Tên người dùng mặc định: admin"
echo "Mật khẩu mặc định: admin_password"
echo ""

echo "Script hoàn tất. Mở trình duyệt và truy cập Portainer tại http://localhost:9000" 