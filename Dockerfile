# https://github.com/jorge07/alpine-php

FROM bravist/php-cli-alpine-aliyun-app:1.11

MAINTAINER bravist <chenghuiyong1987@gmail.com>

# https://pkgs.alpinelinux.org/packages

# Mirror mirror switch to Ali-OSM (Alibaba Open Source Mirror Site) - http://mirrors.aliyun.com/
RUN echo 'http://mirrors.aliyun.com/alpine/latest-stable/main' > /etc/apk/repositories \
	&& echo '@community http://mirrors.aliyun.com/alpine/latest-stable/community' >> /etc/apk/repositories \
	&& echo '@testing http://mirrors.aliyun.com/alpine/edge/testing' >> /etc/apk/repositories



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

COPY ./php-fpm.conf /etc/php7/

COPY ./www.conf /etc/php7/php-fpm.d/

# Expose volumes
VOLUME ["/usr//nginx/html", "/usr/local/var/log"]

WORKDIR /usr/share/nginx/html

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7", "-R", "--nodaemonize"]
