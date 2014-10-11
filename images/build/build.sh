#!/bin/bash

image=igitras/build-base
chkresult=`docker images |grep $image |awk '{print $1}'`
if [ ! $chkresult = $image ]
then
docker build -t igitras/$image .
fi
