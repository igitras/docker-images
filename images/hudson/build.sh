#!/bin/bash

vendor=igitras

echo "bulid hudson images"
VERSION=3.2.1
cd src
if [ ! -f hudson-$VERSION.war ]
then
wget http://mirror.hust.edu.cn/eclipse//hudson/war/hudson-$VERSION.war
fi
cd ..

imageName=hudson
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid $imageName image"
echo "build image with name $image"
docker build -t $image .
fi

