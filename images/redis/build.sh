#!/bin/bash

vendor=igitras
imageName=redis
image=$vendor/$imageName
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]; then
    echo "bulid redis image"

    docker build -t $image .
fi