FROM nginx:stable-alpine

RUN mkdir -p /opt/media/images

# config
COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY favicon.ico /opt/media/images/favicon.ico
COPY apple-touch-icon.png /opt/media/images/apple-touch-icon.png

RUN nginx -V
