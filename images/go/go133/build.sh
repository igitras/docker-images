#!/bin/bash

VERSION=1.3.3

mkdir src
cd src
wget http://www.golangtc.com/static/go/go$VERSION.linux-amd64.tar.gz
cd ..
docker build -t igitras/golang133 .