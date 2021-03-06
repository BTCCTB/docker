FROM php:7.3-fpm

# Set main params
ENV APP_HOME /var/www/html
ENV USER_ID=1000
ENV GROUP_ID=1000

# Install all the dependencies and enable PHP modules
RUN apt-get update \
    && apt-get install -y \
        wget \
        git \
        zip \
        libzip-dev \
        libicu-dev \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
    && docker-php-ext-install \
        pdo \
        zip \
        sockets \
        intl

# Support MySQL
RUN docker-php-ext-install mysqli pdo_mysql

# Support gd
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# Support opcache
RUN docker-php-ext-install opcache
COPY opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# Install APCu and APC backward compatibility
RUN pecl install apcu \
    && pecl install apcu_bc-1.0.3 \
    && docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini \
    && docker-php-ext-enable apc --ini-name 20-docker-php-ext-apc.ini

# Clean repository
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create document root
RUN mkdir -p $APP_HOME/public

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Install Symfony tool
RUN wget https://get.symfony.com/cli/installer -O - | bash && \
  mv /root/.symfony/bin/symfony /usr/local/bin/symfony

# Switch user/group id
RUN groupadd -f --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
USER user

# Optimize composer load
RUN composer global require hirak/prestissimo

# Set working directory
WORKDIR $APP_HOME
