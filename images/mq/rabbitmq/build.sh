#!/bin/bash

vendor=igitras
imageName=rabbitmq
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid rabbitmq image"

mkdir src
cd src

VERSION=3.4.1

if [ ! -f rabbitmq-server-generic-unix-$VERSION.tar.gz ]
then
wget http://www.rabbitmq.com/releases/rabbitmq-server/v$VERSION/rabbitmq-server-generic-unix-$VERSION.tar.gz
fi

cd ..
echo "build image with name $image"
docker build -t $image .
fi
