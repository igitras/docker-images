#!/bin/bash

imageName=build-base
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ ! $chkresult = $image ]
then
docker build -t $image .
fi
