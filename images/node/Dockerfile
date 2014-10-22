# Docker base image for nodejs

# Set base image
FROM igitras/ubuntu

RUN mkdir /application/src -p

ENV VERSION v0.10.32
COPY src/node-$VERSION-linux-x64.tar.gz /application/src/node-$VERSION-linux-x64.tar.gz 

RUN cd /application/src \
    && tar zxvf node-$VERSION-linux-x64.tar.gz \
    && mv node-$VERSION-linux-x64 /application/node \
    && rm -Rf /application/src

ENV PATH $PATH:/application/node/bin
