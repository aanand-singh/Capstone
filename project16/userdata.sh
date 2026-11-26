#!/bin/bash
dnf install -y nginx
echo "<h1>Project 16 - HTTPS via ACM</h1>" > /usr/share/nginx/html/index.html
systemctl enable --now nginx
