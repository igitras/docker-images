#!/bin/bash

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
docker build -t igitras/apache24 .
