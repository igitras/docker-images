#!/bin/bash

vendor=igitras
imageName=java6
image=$vendor/$imageName

chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid java 6 image"

mkdir src
cd src

if [ ! -f jdk-6u45-linux-x64.tar.gz ]
then
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin"
chmod +x jdk-6u45-linux-x64.bin
./jdk-6u45-linux-x64.bin
tar czvf jdk-6u45-linux-x64.tar.gz jdk1.6.0_45/
rm -Rf jdk1.6.0_45/
rm -f jdk-6u45-linux-x64.bin
fi

cd ..
docker build -t $image .

fi
