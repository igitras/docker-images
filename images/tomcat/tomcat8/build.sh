#!/bin/bash

vendor=igitras

echo "bulid tomcat8 images"
cd src
if [ ! -f apache-tomcat-8.0.14.tar.gz ]
then
wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.0.14/bin/apache-tomcat-8.0.14.tar.gz
fi
cd ..

imageName=tomcat8-java6
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"
mkdir ./java6/src
cp ./src/* ./java6/src/
echo "build image with name $image"
docker build -t $image ./java6/
rm -Rf ./java6/src
fi

imageName=tomcat8-java7
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"
mkdir ./java7/src
cp ./src/* ./java7/src/
echo "build image with name $image"
docker build -t $image ./java7/
rm -Rf ./java7/src
fi

imageName=tomcat8-java8
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"
mkdir ./java8/src
cp ./src/* ./java8/src/
echo "build image with name $image"
docker build -t $image ./java8/
docker tag `docker images |grep $image | awk '{print $3}'` $vendor/tomcat8
rm -Rf ./java8/src
fi