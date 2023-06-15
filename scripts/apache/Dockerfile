FROM php:7.4-apache
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_balancer
RUN a2enmod lbmethod_byrequests
RUN mkdir -p /var/www/gamma-z.hm/public_html
COPY . /var/www/gamma-z.hm/public_html/
RUN chown -R www-data:www-data /var/www/gamma-z.hm/public_html
RUN chmod -R 755 /var/www
COPY ./gamma-z.hm.conf /etc/apache2/sites-available
RUN a2dissite 000-default.conf
RUN a2ensite gamma-z.hm.conf
EXPOSE 80
CMD apachectl -D FOREGROUND