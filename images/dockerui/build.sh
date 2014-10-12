#!/bin/bash

imageName=dockerui
image=$vendor/$imageName

chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid dockerui image"

mkdir src
cd src
git clone https://github.com/crosbymichael/dockerui.git
sed -i 's/:9000/:80/g' dockerui/dockerui.go
tar czvf dockerui.tar.gz dockerui/

cd ..
docker build -t $image .

fi
