FROM enabel/symfony:7.3

# Install Xdebug in case development environment
RUN pecl install xdebug-2.8.1 && docker-php-ext-enable xdebug
ADD xdebug.ini /usr/local/etc/php/conf.d/

# Put apache and php config for Symfony, enable sites
COPY symfony-ssl.conf /etc/apache2/sites-available/symfony-ssl.conf
RUN a2ensite symfony-ssl

# Enable apache modules
RUN a2enmod ssl

# Generate certificates
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj "/C=BE/ST=Brussels/L=Brussels/O=ICT/OU=Development/CN=enabel.localhost"
