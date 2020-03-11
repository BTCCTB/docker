FROM enabel/php-symfony:latest

USER root

# Install Xdebug in case development environment
RUN pecl install xdebug && docker-php-ext-enable xdebug
ADD xdebug.ini /usr/local/etc/php/conf.d/

USER user