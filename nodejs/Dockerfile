FROM node:12.16.1

# Set main params
ENV APP_HOME /var/www/html
ENV USER_ID=1000
ENV GROUP_ID=1000

# Create document root
RUN mkdir -p $APP_HOME
RUN chmod 777 -R $APP_HOME

# Set working directory
WORKDIR $APP_HOME
