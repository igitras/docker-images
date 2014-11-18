#!/bin/bash

vendor=igitras
imageName=activemq
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"

mkdir src
cd src

VERSION=5.10.0

if [ ! -f apache-activemq-$VERSION-bin.tar.gz ]
then
wget http://mirrors.aliyun.com/apache/activemq/$VERSION/apache-activemq-$VERSION-bin.tar.gz
fi

cd ..
echo "build image with name $image"
docker build -t $image .
fi
