################################################################################
#                                                                              #
#                   Dockerfile to run Ubuntu 14.04 LAMP stack                  #
#                                  Laravel                                     #
################################################################################

# Set base image
FROM inode/lamp

# Maintainer
MAINTAINER Bart Kessels

# Update package list
RUN apt-get update

# Update packages
RUN apt-get upgrade

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Open port 8080
EXPOSE 8080

# Set volume folder
VOLUME /tmp
