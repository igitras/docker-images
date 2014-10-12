#!/bin/bash

vendor=igitras
imageName=golang133
image=$vendor/$imageName

chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid go 133 image"

mkdir src
cd src

VERSION=1.3.3
if [ ! -f go$VERSION.linux-amd64.tar.gz ]
then
wget http://www.golangtc.com/static/go/go$VERSION.linux-amd64.tar.gz
fi
cd ..
docker build -t $image .

fi
