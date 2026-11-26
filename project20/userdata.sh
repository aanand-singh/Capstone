#!/bin/bash
dnf install -y httpd
echo "Hello from $(hostname -f)" > /var/www/html/index.html
systemctl enable --now httpd
