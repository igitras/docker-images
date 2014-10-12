#!/bin/bash

vendor=igitras
imageName=java7
image=$vendor/$imageName

chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid java 7 image"

mkdir src
cd src

if [ ! -f jdk-7u67-linux-x64.tar.gz ]
then
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-linux-x64.tar.gz"
fi

cd ..
docker build -t $image .

fi
