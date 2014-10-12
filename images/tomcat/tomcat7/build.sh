#!/bin/bash

vendor=igitras
imageName=tomcat7
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid tomcat7 image"

mkdir src
cd src

if [ ! -f apache-tomcat-7.0.56.tar.gz ]
then
wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-7/v7.0.56/bin/apache-tomcat-7.0.56.tar.gz
fi

cd ..
echo "build image with name $image"
docker build -t $image .
fi