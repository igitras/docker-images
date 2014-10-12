#!/bin/bash

vendor=igitras
imageName=tomcat8
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid tomcat8 image"

mkdir src
cd src

if [ ! -f apache-tomcat-8.0.14.tar.gz ]
then
wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.0.14/bin/apache-tomcat-8.0.14.tar.gz
fi

cd ..
echo "build image with name $image"
docker build -t $image .
fi