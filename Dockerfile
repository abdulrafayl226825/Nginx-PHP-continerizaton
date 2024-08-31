FROM ubuntu:20.04


RUN apt update
RUN  apt install -y vim\
     nginx \
    php-fpm \
    supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY default /etc/nginx/sites-available/default
COPY index.php /var/www/html/
CMD ["/usr/bin/supervisord"] 
