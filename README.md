# PHP 7 FPM basic docker image based on alpine

The image based on [bravist/php-cli-alpine-aliyun-app](https://hub.docker.com/r/bravist/php-cli-alpine-aliyun-app/), installing PHP FPM mode, mainly cooperate with Nginx server implementation site operation of the PHP language.

此镜像基于[bravist/php-cli-alpine-aliyun-app](https://hub.docker.com/r/bravist/php-cli-alpine-aliyun-app/)，安装PHP FPM模式，主要配合Nginx服务器实现PHP语言的网站运行。



## Upgrade

`2017-12-23` 
1. [PHP-FPM进程调优: 动态适合小内存机器，灵活分配进程，省内存。静态适用于大内存机器，动态创建回收进程对服务器资源也是一种消耗](https://www.zybuluo.com/phper/note/89081) 
2. [（总结）Nginx使用的php-fpm的两种进程管理方式及优化](http://www.ha97.com/4339.html)


`2017-12-21` 新增php.ini推荐配置

`2017-12-11` [413 request entity too large](https://www.iteblog.com/archives/1421.html)

`2017-11-06` Support [PHP7 extension for ZeroMQ](https://pkgs.alpinelinux.org/package/edge/community/x86/php7-zmq), The ZeroMQ messaging library and tools.


## Build & Push

1. Docker build image
```bash
❯ docker build -t bravist/php-fpm-alpine-aliyun-app:1.14 .
```

2. Login [Docker Hub](https://hub.docker.com)
```bash
❯ docker login
Username (bravist):
Password:
Login Succeeded
```

3. Push image to [Docker Hub](https://hub.docker.com)
```bash
❯ docker push bravist/php-fpm-alpine-aliyun-app:1.14
```