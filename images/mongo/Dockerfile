FROM igitras/ubuntu

RUN mkdir /application/src -p && mkdir /application/data

ENV VERSION 2.6.5

COPY src/mongodb-linux-x86_64-$VERSION.tgz /application/src/mongodb-linux-x86_64-$VERSION.tgz

RUN cd /application/src/ \
    && tar zxvf mongodb-linux-x86_64-$VERSION.tgz \
    && mv mongodb-linux-x86_64-$VERSION /application/mongodb \
    && rm -Rf /application/src

ENV PATH /application/mongodb/bin:$PATH

CMD ["mongod", "--dbpath", "/application/data"]

EXPOSE 27017
EXPOSE 28017