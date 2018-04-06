FROM docker.io/alpine

LABEL maintainer="Travis Ralston <travis@t2bot.io>"

COPY res/start.sh /start.sh
COPY ./res/nginx.conf /tmp/nginx.conf
RUN apk update \
    && apk add nginx \
    && apk add dos2unix \
    && apk add tar \
    && dos2unix /start.sh \
    && dos2unix /etc/nginx/nginx.conf \
    && chmod +x /start.sh \
    && adduser -D -g 'www' www \
    && mkdir /www \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /www \
    && mv /tmp/nginx.conf /etc/nginx/nginx.conf \
    && echo '<h1>riot-web failed to install</h1>' > /www/index.html

STOPSIGNAL SIGTERM
CMD ["/start.sh"]