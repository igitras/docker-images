# Docker base image for nginx

# Set base image
FROM igitras/build-base

RUN apt-get install -y openssl libssl-dev

ENV NGINX_VERSION 1.6.2
ENV PCRE_VERSION 8.34
ENV ZLIB_VERSION 1.2.8

RUN mkdir /application/src -p

COPY src/nginx-$NGINX_VERSION.tar.gz /application/src/nginx-NGINX_VERSION.tar.gz
COPY src/pcre-$PCRE_VERSION.tar.gz /application/src/pcre-$PCRE_VERSION.tar.gz
COPY src/zlib-$ZLIB_VERSION.tar.gz /application/src/zlib-$ZLIB_VERSION.tar.gz

RUN cd /application/src \
    && tar zxf nginx-NGINX_VERSION.tar.gz \
    && tar zxf pcre-$PCRE_VERSION.tar.gz \
    && tar zxf zlib-$ZLIB_VERSION.tar.gz

RUN cd /application/src/nginx-$NGINX_VERSION \
    && ./configure --prefix=/application/nginx \
       --with-http_ssl_module \
       --with-pcre=../pcre-$PCRE_VERSION \
       --with-zlib=../zlib-$ZLIB_VERSION \
    && make \
    && make install

RUN rm -Rf /application/src

RUN echo "daemon off;" >> /application/nginx/conf/nginx.conf

# Add binary to PATH
ENV PATH $PATH:/application/nginx/sbin

ENTRYPOINT ["nginx"]

EXPOSE 80