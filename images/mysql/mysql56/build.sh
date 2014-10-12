#!/bin/sh

vendor=igitras
imageName=mysql56
image=$vendor/$imageName

chkresult=`docker images |grep $image |awk '{print $1}'`

if [ -z $chkresult ]
then
echo "bulid mysql 5.6 image"

cd src

MYSQL_MAJOR=5.6
MYSQL_VERSION=5.6.21

if [ ! -f mysql-$MYSQL_VERSION-linux-glibc2.5-x86_64.tar.gz ]
then
wget http://dev.mysql.com/get/Downloads/MySQL-$MYSQL_MAJOR/mysql-$MYSQL_VERSION-linux-glibc2.5-x86_64.tar.gz
fi

cd ..
docker build -t $image .

fi