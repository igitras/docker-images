# Docker base image for mysql

# Set base image to igitras tomcat8
FROM igitras/tomcat8

# Maintainer information
MAINTAINER dongxu.m@gmail.com

RUN mkdir /application/src/ -p
ENV HUSDON_VERSION 3.2.1

COPY src/hudson-$VERSION.war /application/src/hudson-$VERSION.war
RUN mkdir /application/hudson \
    && cd /application/hudson \
    && mv /application/src/hudson-$VERSION.war . \
    && jar -xvf hudson-$VERSION.war \
    && rm -f hudson-$VERSION.war \
    && rm -f /application/src

COPY src/setenv.sh /application/tomcat/bin/setenv.sh
COPY src/server.xml /application/tomcat/conf/server.xml

RUN chmod +x /application/tomcat/bin/setenv.sh

EXPOSE 8080
ENV HUDSON_HOME /application/hudson