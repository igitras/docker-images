# Docker base image for apache 2.4

# Set base image
FROM igitras/build-base

ENV APACHE_VERSION 2.4.10
ENV APR_VERSION 1.5.1
ENV APR_UTIL_VERSION 1.5.4

RUN mkdir /application/src -p

COPY src/httpd-$APACHE_VERSION.tar.gz /application/src/httpd-$APACHE_VERSION.tar.gz
COPY src/apr-$APR_VERSION.tar.gz /application/src/apr-$APR_VERSION.tar.gz
COPY src/apr-util-$APR_UTIL_VERSION.tar.gz /application/src/apr-util-$APR_UTIL_VERSION.tar.gz

RUN cd /application/src \
    && tar zxvf httpd-$APACHE_VERSION.tar.gz \
    && tar zxvf apr-$APR_VERSION.tar.gz \
    && tar zxvf apr-util-$APR_UTIL_VERSION.tar.gz \
    && mv apr-$APR_VERSION ./httpd-$APACHE_VERSION/srclib/apr \
    && mv apr-util-$APR_UTIL_VERSION ./httpd-$APACHE_VERSION/srclib/apr-util \
    && rm -f *.tar.gz 

RUN apt-get install libpcre3-dev -y

RUN cd /application/src/httpd-$APACHE_VERSION \
    && ./configure --prefix=/application/apache --enable-module=so \
    && make && make install \
    && cd ../.. \
    && rm -Rf src 

RUN sed -i 's/#ServerName www.example.com:80/ServerName 0.0.0.0/g' /application/apache/conf/httpd.conf
#COPY src/httpd.conf /application/apache/conf/

# Add binary to PATH
ENV PATH $PATH:/application/apache/bin

ENTRYPOINT ["apachectl", "-k", "start", "-DFOREGROUND"]

EXPOSE 80

