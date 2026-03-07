FROM nginx:alpine

# 复制前端文件到nginx默认目录
COPY index.html /usr/share/nginx/html/index.html
COPY libs/ /usr/share/nginx/html/libs/

# 使用环境变量PORT（Railway要求）
RUN echo 'server { \
    listen $PORT; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { \
        try_files $uri $uri/ /index.html; \
    } \
}' > /etc/nginx/conf.d/default.conf.template

# 启动脚本：用envsubst替换PORT变量后启动nginx
CMD ["/bin/sh", "-c", "envsubst '$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
