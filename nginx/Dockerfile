FROM nginx:stable-alpine

RUN mkdir -p /opt/media/images

# config
COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY docker.ico /opt/media/images/docker.ico
COPY docker.png /opt/media/images/docker.png

RUN chown -R www-data:www-data /opt/media/images/*

