################################################################################
#                                                                              #
#                   Dockerfile to run Ubuntu 14.04 LAMP stack                  #
#                                  Laravel                                     #
# 																			   #
################################################################################

# Set base image
FROM linode/lamp

# Maintainer
MAINTAINER Bart Kessels

# Update package list
RUN apt-get update

# Update packages
RUN apt-get upgrade -y

# Install packages
RUN apt-get install curl git php5-mysql -y

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Display errors php
RUN sed -i 's|display_errors = Off|display_errors = On|g' /etc/php5/apache2/php.ini

# Allow url rewriting
RUN sed -i 's|AllowOverride None|AllowOverride All|g' /etc/apache2/apache2.conf
RUN a2enmod rewrite

# Open port 80
EXPOSE 80

# Set default path to apache root
WORKDIR /var/www/example.com/public_html

# Add user
RUN useradd -m bart

# Make bart owner of apache root
RUN chown -R bart /var/www

# Give everyone full access in apache root
RUN chmod -R 777 /var/www

# Allow bart all privileges
RUN sed -i 's|%admin ALL=(ALL) ALL|bart ALL=(ALL) NOPASSWD: ALL|g' /etc/sudoers

# Login as bart
ENTRYPOINT su bart
