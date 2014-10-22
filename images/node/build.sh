#!/bin/bash

vendor=igitras
imageName=node
image=$vendor/$imageName

chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid nodejs image"

VERSION=v0.10.32

mkdir src
cd src
if [ ! -f node-$VERSION-linux-x64.tar.gz ]
then
wget http://nodejs.org/dist/$VERSION/node-$VERSION-linux-x64.tar.gz
fi
cd ..

docker build -t $image .

fi
