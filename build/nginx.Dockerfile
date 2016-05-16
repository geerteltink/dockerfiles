FROM nginx:stable-alpine

# config
COPY build/nginx.conf /etc/nginx/conf.d/default.conf
