#!/bin/bash

vendor=igitras
imageName=tomcat6
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid tomcat6 image"

mkdir src
cd src

if [ ! -f apache-tomcat-6.0.41.tar.gz ]
then
wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-6/v6.0.41/bin/apache-tomcat-6.0.41.tar.gz
fi

cd ..
echo "build image with name $image"
docker build -t $image .
fi