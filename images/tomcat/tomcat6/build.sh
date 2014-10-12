#!/bin/bash

vendor=igitras

echo "bulid tomcat6 images"
cd src
if [ ! -f apache-tomcat-6.0.41.tar.gz ]
then
wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-6/v6.0.41/bin/apache-tomcat-6.0.41.tar.gz
fi
cd ..

cd java6
ln -s ../src/ ./src
cd ../java7/
ln -s ../src/ ./src
cd ../java8/
ln -s ../src/ ./src
cd ..


imageName=tomcat6-java6
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"
ln -s src ./java6/src
echo "build image with name $image"
docker build -t $image ./java6/
docker tag `docker images |grep $image | awk '{print $3}'` $vendor/tomcat6
fi

imageName=tomcat6-java7
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"

ln -s src ./java7/src
echo "build image with name $image"
docker build -t $image ./java7/
fi

imageName=tomcat6-java8
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"
ln -s src ./java8/src
echo "build image with name $image"
docker build -t $image ./java8/
fi