#!/bin/bash
set -ex

dnf update -y
dnf install -y nginx
systemctl enable nginx
systemctl start nginx

cat > /usr/share/nginx/html/index.html <<'EOF'
<!DOCTYPE html>
<html>
<head><title>Terraform EC2 Web Server</title></head>
<body style="font-family:Arial;text-align:center;margin-top:100px;background:#0b1f3a;color:white;">
  <h1>Hello from Terraform on AWS!</h1>
  <p>Nginx web server deployed using Infrastructure as Code.</p>
</body>
</html>
EOF

systemctl restart nginx
