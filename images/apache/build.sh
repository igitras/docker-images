#!/bin/bash

mkdir src
cd src
wget http://mirrors.hust.edu.cn/apache//httpd/httpd-2.4.10.tar.gz
wget http://mirrors.hust.edu.cn/apache//apr/apr-1.5.1.tar.gz
wget http://mirrors.hust.edu.cn/apache//apr/apr-util-1.5.4.tar.gz
cd ..
docker build -t igitras/apache24 .
