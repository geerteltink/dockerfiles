FROM nginx:stable-alpine

RUN \
  mkdir -p /opt/media/images \
  && mkdir -p /tmp/nginx-image-cache/

# Config
COPY config/ /etc/nginx/
COPY assets/ /opt/media/images/

RUN nginx -V
