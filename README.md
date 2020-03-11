# docker
Docker images

## How to
To build/publish you can use the [Makefile](./Makefile)
```bash
# Build & publish all images
$ make install 

# Build & publish group of images
# nodejs: Docker image for node js
$ make nodejs
# symfony: httpd & php docker images suitable for Symfony (http no debug)
$ make symfony
# symfony-dev: httpd & php docker images suitable for Symfon in dev (http/https/xdebug) 
$ make symfony-dev
```

## enabel/php-symfony
Docker image built on the official php-fpm Docker image. 
This image is suitable for Symfony applications 

### php extensions
- pdo
- zip
- sockets
- intl
- mysqli
- pdo_mysql
- gd
- opcache
- apc/apcu

### extra tools
- Symfony CLI
- Composer

## enabel/php-symfony-dev
Docker image built on the enabel/php-sysmfony Docker image.
This image is suitable for Symfony applications in DEV environment

### php extensions
- all extensions included in enabel/php-sysmfony
- xdebug

## enabel/httpd-symfony
Custom docker image to serve httpd on port 80
This image is suitable for Symfony applications 

### httpd modules
- rewrite
- proxy 
- proxy_fcgi
- proxy_balancer 
- proxy_http 
- proxy_ajp

## enabel/httpd-symfony-dev
Docker image built on the enabel/httpd-symfony Docker image.
This image serve httpd on port 80 & 443
This image is suitable for Symfony applications 

### httpd modules
- all modules included in enabel/php-sysmfony
- ssl

### extra
- Self signed certificate generate by mkcert

## enabel/nodejs
Docker image built on the official node Docker image. 
This image is suitable for building assets with yarn/webpack

### extra
- Change working dir to `APP_HOME` /var/www/html by default
