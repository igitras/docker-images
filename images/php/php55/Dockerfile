# Docker base image for apache 2.4

# Set base image
FROM igitras/apache24

ENV PHP_VERSION 5.5.17

RUN mkdir /application/src -p

COPY src/php-$PHP_VERSION.tar.gz /application/src/php-$PHP_VERSION.tar.gz 

RUN cd /application/src \
    && tar zxvf php-$PHP_VERSION.tar.gz \
    && rm -f *.tar.gz 

RUN apt-get install -y libxml2-dev libmysqlclient-dev libssl-dev libcurl4-openssl-dev libxml2-dev libenchant-dev libgmp-dev libxslt1-dev  libmcrypt-dev libpspell-dev libedit-dev libgd2-xpm-dev libt1-dev libgmp-dev

RUN cd /application/src/php-$PHP_VERSION \
    && ./configure --prefix=/application/php \
                  --with-apxs2=/application/apache/bin/apxs \
                  --with-openssl \
               	  --with-kerberos \
                  --with-zlib \
                  --enable-calendar \
               	  --with-curl \
                  --with-curlwrappers \
               	  --with-enchant \
       	          --with-mysql \
               	  --with-mysqli \
                  --with-pdo-mysql \
                  --enable-soap \
                  --enable-sockets \
                  --enable-exif \
                  --enable-ftp \
                  --with-t1lib \
                  --enable-exif \
                  --enable-gd-native-ttf \
                  --enable-gd-jis-conv \
                  --with-gettext \
                  --with-mhash \
                  --enable-mbstring \
                  --enable-sysvmsg \ 
                  --enable-sysvshm \
                  --with-xsl \
                  --enable-zip \
                  --with-pear \
                  --with-mcrypt \
                  --enable-pcntl \
                  --with-pspell \
                  --with-libedit \
                  --with-readline \
                  --enable-shmop \
                  --with-gd \
                  --enable-maintainer-zts 

#RUN cd /application/src/php-$PHP_VERSION \

RUN cd /application/src/php-$PHP_VERSION \ 
    && make && make install \
    && cp php.ini-production /application/php/lib/php.ini

COPY src/php.conf /application/src/php.conf
RUN cat /application/src/php.conf >> /application/apache/conf/httpd.conf
RUN mkdir /application/www/html -p 
COPY src/test.php /application/www/html/test.php

RUN rm -Rf /application/src
ENTRYPOINT ["apachectl", "-k", "start", "-DFOREGROUND"]

EXPOSE 80
