# Docker base image for mysql

# Set base image to ubuntu 14.04
FROM ubuntu:14.04

ENV JAVA_VERSION 8u20
ENV JDK_EXTRACT jdk1.8.0_20

RUN mkdir /application
COPY src/jdk-$JAVA_VERSION-linux-x64.tar.gz /application/jdk-$JAVA_VERSION-linux-x64.tar.gz

RUN cd /application \
    && tar zxvf jdk-$JAVA_VERSION-linux-x64.tar.gz \
    && mv $JDK_EXTRACT jdk \
    && rm -Rf jdk-$JAVA_VERSION-linux-x64.tar.gz
	
# Add JAVA binary to PATH
ENV JAVA_HOME /application/jdk
ENV PATH $PATH:$JAVA_HOME/bin
