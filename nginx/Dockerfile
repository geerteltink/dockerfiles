FROM nginx:stable-alpine

RUN mkdir -p /opt/media/images

# config
COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY favicon.ico /opt/media/images/favicon.ico
COPY favicon.png /opt/media/images/favicon.png

RUN chown -R www-data:www-data /opt/media/images/*

