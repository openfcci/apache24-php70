FROM ubuntu:xenial
MAINTAINER Dustin Rue <dustin.rue@forumcomm.com>

RUN apt-get update && apt-get install -y \
  apache2 \
  libapache2-mod-php7.0 \
  php7.0 \
  php7.0-cli \
  php7.0-curl \
  php7.0-gd \
  php7.0-json \
  php7.0-mysql \
  php7.0-opcache \
  php7.0-xmlrpc \
  php7.0-bcmath \
  php7.0-mbstring \
  php7.0-xml


EXPOSE 80
ADD lib/run.sh usr/local/sbin/run.sh
RUN chmod 755 usr/local/sbin/run.sh
RUN apachectl configtest
RUN rm -f /etc/apache2/sites-enabled/*
RUN ln -s /var/log/apache2 /etc/apache2/logs

ENTRYPOINT ["run.sh"]
