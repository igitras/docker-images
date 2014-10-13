# Docker base image for mysql

# Set base image to ubuntu 14.04
FROM ubuntu:14.04

# Setup mysql account
RUN groupadd -r mysql && useradd -r -g mysql mysql

# Download Mysql and extract to /application/mysql
ENV MYSQL_MAJOR 5.6
ENV MYSQL_VERSION 5.6.21
RUN mkdir /application
COPY src/mysql-$MYSQL_VERSION-linux-glibc2.5-x86_64.tar.gz /application/mysql-$MYSQL_VERSION-linux-glibc2.5-x86_64.tar.gz 

RUN cd /application \
    && tar zxvf mysql-$MYSQL_VERSION-linux-glibc2.5-x86_64.tar.gz \
    && mv mysql-$MYSQL_VERSION-linux-glibc2.5-x86_64 mysql \
    && rm -Rf /application/mysql/mysql-test /application/mysql/sql-bench \
    && rm -Rf /application/mysql/bin/*-debug /application/mysql/bin/*_embedded \
    && find /application/mysql -type f -name "*.a" -delete \
    && rm mysql*.tar.gz*
	
# Add mysql binary to PATH
ENV PATH $PATH:/application/mysql/bin:/application/mysql/scripts

# Set the working dir and mysql data dir
WORKDIR /application/mysql
VOLUME /application/data

# Set the entrypoint
COPY src/my.cnf /etc/my.cnf
COPY src/docker-entrypoint.sh /application/entrypoint.sh
ENTRYPOINT ["/application/entrypoint.sh"]

# expose port and setup the initial start command
EXPOSE 3306
CMD ["mysqld_safe", "--datadir=/application/data", "--user=mysql"]
