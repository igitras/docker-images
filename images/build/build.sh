#!/bin/bash

vendor=igitras
imageName=build-base
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid base image"
docker build -t $image .
fi
