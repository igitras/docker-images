#!/bin/bash

vendor=igitras
imageName=mongo
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "build mongo image"

mkdir src
cd src

VERSION=2.6.5

if [ ! -f mongodb-linux-x86_64-$VERSION.tgz ]
then
wget http://downloads.mongodb.org/linux/mongodb-linux-x86_64-$VERSION.tgz
fi

cd ..
echo "build image with name $image"
docker build -t $image .
fi