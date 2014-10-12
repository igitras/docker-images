#!/bin/bash

vendor=igitras

echo "bulid tomcat6 images"
cd src
if [ ! -f apache-tomcat-6.0.41.tar.gz ]
then
wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-6/v6.0.41/bin/apache-tomcat-6.0.41.tar.gz
fi
cd ..

imageName=tomcat6-java6
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"
mkdir ./java6/src
cp ./src/* ./java6/src/
echo "build image with name $image"
docker build -t $image ./java6/
docker tag `docker images |grep $image | awk '{print $3}'` $vendor/tomcat6
rm -Rf ./java6/src/
fi

imageName=tomcat6-java7
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"
mkdir ./java7/src
cp ./src/* ./java7/src/
echo "build image with name $image"
docker build -t $image ./java7/
rm -Rf ./java7/src/
fi

imageName=tomcat6-java8
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"
mkdir ./java8/src
cp ./src/* ./java8/src/
echo "build image with name $image"
docker build -t $image ./java8/
rm -Rf ./java8/src/
fi