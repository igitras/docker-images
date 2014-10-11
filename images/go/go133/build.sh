#!/bin/bash

imageName=golang133
image=$vendor/$imageName

chkresult=`docker images |grep $image |awk '{print $1}'`
if [ ! $chkresult = $image ]
then

mkdir src
cd src

VERSION=1.3.3
wget http://www.golangtc.com/static/go/go$VERSION.linux-amd64.tar.gz

cd ..
docker build -t $image .

fi
