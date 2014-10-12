#!/bin/bash

imageName=apache24
image=$vendor/$imageName

chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid apache 2.4 image"

mkdir src
cd src

if [ ! -f httpd-2.4.10.tar.gz ]
then
wget http://mirrors.hust.edu.cn/apache/httpd/httpd-2.4.10.tar.gz
fi

if [ ! -f apr-1.5.1.tar.gz ]
then
wget http://mirrors.hust.edu.cn/apache/apr/apr-1.5.1.tar.gz
fi

if [ ! -f apr-util-1.5.4.tar.gz ]
then
wget http://mirrors.hust.edu.cn/apache/apr/apr-util-1.5.4.tar.gz
fi

cd ..
echo "build image with name $image"
docker build -t $image .
fi