FROM debian:buster-slim


# Set main params
ENV APP_HOME /var/www/html
ENV HTTPD_PREFIX /etc/apache2
ENV PATH $HTTPD_PREFIX/bin:$PATH

# Create document root
RUN mkdir -p $APP_HOME/public
RUN mkdir -p "$HTTPD_PREFIX" \
    && chown www-data:www-data "$HTTPD_PREFIX"

WORKDIR $HTTPD_PREFIX

# Install apache
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    apache2 curl \
    && rm -r /var/lib/apt/lists/*

# Enable apache modules
RUN a2enmod proxy_fcgi \
        rewrite \
        proxy \
        proxy_balancer \
        proxy_http \
        proxy_ajp

# Set servername
RUN sed -i '/Global configuration/a \
ServerName localhost \
' /etc/apache2/apache2.conf

# Disable default site
RUN a2dissite 000-default.conf

# Put apache and php config for Symfony, enable sites
COPY symfony.conf /etc/apache2/sites-available/symfony.conf
RUN a2ensite symfony.conf

# Set working directory
WORKDIR $APP_HOME

RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

# Test apache config
RUN apachectl configtest

# Expose port http
EXPOSE 80

# Remove PID
RUN rm -f /run/apache2/apache2.pid

# Start apache
CMD apachectl  -DFOREGROUND -e info
