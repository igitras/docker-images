# Docker Image with Go Lang

# Set base image
FROM igitras/ubuntu

RUN mkdir /application/src -p

ENV VERSION 1.3.3

COPY src/go$VERSION.linux-amd64.tar.gz /application/src/go$VERSION.linux-amd64.tar.gz

RUN cd /application/src \
    && tar zxf go$VERSION.linux-amd64.tar.gz \
    && mv go /application/


# Add binary to PATH
ENV GOROOT /application/go
ENV PATH $PATH:$GOROOT/bin
