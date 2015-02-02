# Docker base image for Wordpress

# Set base image
FROM igitras/php53

RUN mkdir /application/src -p

ENV VERSION 4.2.10
COPY src/phpMyAdmin-$VERSION.tar.gz /application/src/phpMyAdmin-$VERSION.tar.gz

RUN cd /application/src \
    && tar zxf phpMyAdmin-$VERSION.tar.gz \
    && cd phpMyAdmin-$VERSION \
    && mkdir config \
    && chmod 666 config \
    && cd .. \
    && rm -Rf /application/www/html/ \
    && mv phpMyAdmin-$VERSION /application/www/html/

ENTRYPOINT ["apachectl", "-k", "restart", "-DFOREGROUND"]

#EXPOSE 80