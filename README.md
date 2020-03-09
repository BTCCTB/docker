# docker
Docker images

## enabel/symfony
Docker image built on the official php-apache Docker image. 
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

### Apache modules
- rewrite

### extra tools
- Symfony CLI
- Composer

### How to build
```bash 
$ docker build ./symfony -t enabel/symfony
```

### How to publish
```bash 
$ docker build ./symfony -t enabel/symfony
$ docker build ./symfony -t enabel/symfony:7.3
$ docker push enabel/symfony
```

## enabel/symfony-dev
Docker image built on the official enabel/symfony Docker image.
This image is suitable for Symfony applications in DEV environment

### php extensions
- all extensions included in enabel/symfony
- xdebug

### Apache modules
- all modules included in enabel/symfony
- ssl

### extra tools
- all tools included in enabel/symfony
- Generated certificates

### How to build
```bash 
$ docker build ./symfony-dev -t enabel/symfony-dev
```

### How to publish
```bash 
$ docker build ./symfony-dev -t enabel/symfony-dev
$ docker build ./symfony-dev -t enabel/symfony-dev:7.3
$ docker push enabel/symfony-dev
```
