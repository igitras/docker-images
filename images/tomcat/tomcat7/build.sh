#!/bin/bash

vendor=igitras

echo "bulid tomcat7 images"
cd src
if [ ! -f apache-tomcat-7.0.56.tar.gz ]
then
wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-7/v7.0.56/bin/apache-tomcat-7.0.56.tar.gz
fi
cd ..

cd java6
ln -sf ../src/ ./src
cd ../java7/
ln -sf ../src/ ./src
cd ../java8/
ln -sf ../src/ ./src
cd ..

imageName=tomcat7-java6
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"
echo "build image with name $image"
docker build -t $image ./java6/
fi

imageName=tomcat7-java7
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"
echo "build image with name $image"
docker build -t $image ./java7/
docker tag `docker images |grep $image | awk '{print $3}'` $vendor/tomcat7
fi

imageName=tomcat7-java8
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"
echo "build image with name $image"
docker build -t $image ./java8/
fi