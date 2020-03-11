FROM enabel/httpd-symfony:latest

# Install certutil & utilities
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libnss3-tools wget \
    && rm -r /var/lib/apt/lists/*

# Install mkcert
COPY mkcert /usr/local/bin/
RUN chmod +x /usr/local/bin/mkcert

# Put apache and php config for Symfony, enable sites
COPY symfony-ssl.conf /etc/apache2/sites-available/symfony-ssl.conf
RUN a2ensite symfony-ssl

# Enable apache modules
RUN a2enmod ssl

# Generate certificates
WORKDIR /etc/ssl/certs/
RUN mkcert -install 
RUN mkcert localhost 127.0.0.1 ::1
WORKDIR $HTTPD_PREFIX

# Test apache config
RUN apachectl configtest

# Expose port http/https
EXPOSE 80 443

# Remove PID
RUN rm -f /run/apache2/apache2.pid

# Start apache
CMD apachectl  -DFOREGROUND -e info