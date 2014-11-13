#!/bin/bash

vendor=igitras
imageName=phpmyadmin
image=$vendor/$imageName

chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid wordpress image"

mkdir src
cd src

VERSION=4.2.10
if [ ! -f phpMyAdmin-$VERSION.tar.gz ]
then
wget http://nchc.dl.sourceforge.net/project/phpmyadmin/phpMyAdmin/$VERSION/phpM$
unzip phpMyAdmin-$VERSION-all-languages.zip
mv phpMyAdmin-$VERSION-all-languages phpMyAdmin-$VERSION
tar zcvf phpMyAdmin-$VERSION.tar.gz phpMyAdmin-$VERSION/
fi

cd ..
docker build -t $image .

fi