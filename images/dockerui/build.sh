#!/bin/bash

mkdir src
cd src
git clone https://github.com/crosbymichael/dockerui.git
sed -i 's/:9000/:80/g' dockerui/dockerui.go
tar czvf dockerui.tar.gz dockerui/
cd ..
docker build -t igitras/dockerui .

