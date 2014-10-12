# Docker base image for mysql

# Set base image to igitras java6
FROM igitras/java6

# Maintainer information
MAINTAINER dongxu.m@gmail.com

RUN mkdir /application/src/ -p
ENV TOMCAT_VERSION 7.0.56

COPY src/apache-tomcat-$TOMCAT_VERSION.tar.gz /application/src/apache-tomcat-$TOMCAT_VERSION.tar.gz

RUN cd /application/src \
    && tar zxvf apache-tomcat-$TOMCAT_VERSION.tar.gz \
    && mv apache-tomcat-$TOMCAT_VERSION /application/tomcat \
    && rm -Rf /application/tomcat/webapps/examples /application/tomcat/webapps/docs \
    && rm -Rf /application/src

COPY src/setenv.sh /application/tomcat/bin/setenv.sh

RUN chmod +x /application/tomcat/bin/setenv.sh

EXPOSE 8080

ENV CATALINA_HOME /application/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

CMD ["catalina.sh", "run"]