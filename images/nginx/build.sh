#!/bin/bash

vendor=igitras
imageName=nginx
image=$vendor/$imageName

chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid nginx image"

mkdir src
cd src
NGINX_VERSION=1.6.2
PCRE_VERSION=8.34
ZLIB_VERSION=1.2.8
if [ ! -f nginx-NGINX_VERSION.tar.gz ]
then
wget http://nginx.org/download/nginx-1.6.2.tar.gz
fi

if [ ! -f pcre-$PCRE_VERSION.tar.gz ]
then
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.34.tar.gz
fi

if [ ! -f zlib-$ZLIB_VERSION.tar.gz ]
then
wget http://zlib.net/zlib-1.2.8.tar.gz
fi
cd ..

docker build -t $image .

fi
