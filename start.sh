#!/bin/bash
# Railway静态文件服务启动脚本
PORT=${PORT:-8080}
echo "Starting HTTP server on port $PORT"
exec python3 -m http.server $PORT
