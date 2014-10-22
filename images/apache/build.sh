#!/bin/bash

vendor=igitras
imageName=apache24
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid apache 2.4 image"

mkdir src
cd src

APACHE_VERSION=2.4.10
APR_VERSION=1.5.1
APR_UTIL_VERSION=1.5.4

if [ ! -f httpd-$APACHE_VERSION.tar.gz ]
then
wget http://mirrors.aliyun.com/apache/httpd/httpd-$APACHE_VERSION.tar.gz
fi

if [ ! -f apr-$APR_VERSION.tar.gz ]
then
wget http://mirrors.aliyun.com/apache/apr/apr-$APR_VERSION.tar.gz
fi

if [ ! -f apr-util-$APR_UTIL_VERSION.tar.gz ]
then
wget http://mirrors.aliyun.com/apache/apr/apr-util-$APR_UTIL_VERSION.tar.gz
fi

cd ..
echo "build image with name $image"
docker build -t $image .
fi
