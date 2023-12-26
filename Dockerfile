FROM amd64/amazonlinux

RUN yum -y update
RUN yum -y install httpd
RUN yum -y install php

COPY ./index.php /var/www/html/index.php

RUN mkdir /run/php-fpm

CMD /usr/sbin/php-fpm && /usr/sbin/httpd -D FOREGROUND
#CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

EXPOSE 80