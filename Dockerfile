# https://github.com/jorge07/alpine-php

FROM bravist/php-cli-alpine-aliyun-app:1.13

MAINTAINER bravist <chenghuiyong1987@gmail.com>

# https://pkgs.alpinelinux.org/packages

# Mirror mirror switch to Ali-OSM (Alibaba Open Source Mirror Site) - http://mirrors.aliyun.com/
RUN echo 'https://mirrors.aliyun.com/alpine/latest-stable/main' > /etc/apk/repositories \
	&& echo '@community https://mirrors.aliyun.com/alpine/latest-stable/community' >> /etc/apk/repositories \
	&& echo '@testing https://mirrors.aliyun.com/alpine/edge/testing' >> /etc/apk/repositories

# ensure www-data user exists
RUN set -x \
	&& addgroup -g 82 -S www-data \
	&& adduser -u 82 -D -S -G www-data www-data

# Mirror mirror switch to Alpine Linux - http://dl-4.alpinelinux.org/alpine/
RUN apk update \
	&& apk upgrade \
	&& apk add \
		tzdata \
	    php7-fpm@community \
	&& cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
	&& echo "${TIMEZONE}" > /etc/timezone \
	&& apk del tzdata \
 	&& rm -rf /var/cache/apk/*

RUN mkdir -p /usr/share/nginx/html
RUN mkdir -p /usr/local/var/log/php7
RUN mkdir -p /usr/local/var/run

COPY ./php-fpm.conf /etc/php7/

COPY ./www.conf /etc/php7/php-fpm.d/

# Expose volumes
VOLUME ["/usr/share/nginx/html", "/usr/local/var/log/php7", "/var/run/"]

WORKDIR /usr/share/nginx/html

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]
