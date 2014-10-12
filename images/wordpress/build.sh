#!/bin/bash

vendor=igitras
imageName=wordpress
image=$vendor/$imageName

chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid wordpress image"

mkdir src
cd src

if [ ! -f wordpress.tar.gz ]
then
wget https://wordpress.org/latest.tar.gz
tar zxvf latest.tar.gz
cd wordpress/
sed -i "s/fonts.googleapis.com/fonts.useso.com/g" `find . -name '*.php'`
cd ..
tar zcvf wordpress.tar.gz wordpress/
fi

cd ..
docker build -t $image .

fi
