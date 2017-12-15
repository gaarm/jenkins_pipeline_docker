# Dockerfile

FROM nimmis/apache-php5
RUN a2enmod rewrite

RUN apt-get update && apt-get install -y php5-memcache
RUN mkdir /var/local/websales -p && chown www-data: /var/local/websales/ -R

MAINTAINER gasper.armic

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY src/index.php /var/www/html/web/index.php 

EXPOSE 80
EXPOSE 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]