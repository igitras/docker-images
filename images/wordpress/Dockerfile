# Docker base image for Wordpress

# Set base image
FROM igitras/php53

RUN mkdir /application/src -p

COPY src/wordpress.tar.gz /application/src/wordpress.tar.gz

RUN cd /application/src \
    && tar zxvf wordpress.tar.gz \
    && rm -Rf /application/www/html/* \
    && mv wordpress/* /application/www/html/
RUN chmod 777 -R /application/www/

ENTRYPOINT ["apachectl", "-k", "restart", "-DFOREGROUND"]

#EXPOSE 80

