#!/bin/bash

chmod 755 `find . -name '*.sh'`
vendor=igitras

# This is the main build file for build all the docker images.

# Build the Base image for the images need to build
echo "build base image for build purpose"
cd build && ./build.sh && cd ..

# Build Apache base images
echo "build apache image from source code with version 2.4"
cd apache && ./build.sh && cd ..

# Build Php images
echo "build php images base previous apache image"
cd php && ./build.sh && cd ..

# Build Php images
echo "build wordpress image base previous php image"
cd wordpress && ./build.sh && cd ..

# Build all the Go Language images
echo "build golang images"
cd go && ./build.sh && cd ..

# Build the Dockerui images
echo "build the dockerui image base on previous golang image"
cd dockerui && ./build.sh && cd ..

# Build all the java images
echo "build java images"
cd java && ./build.sh && cd ..


# Build all the tomcats base all java images
echo "build tomcat images base on java images"
cd tomcat && ./build.sh && cd ..


# Build Mysql images
cd mysql && ./build.sh && cd ..

# Build all the tomcats base all java images
#docker build -t igitras/java6-tomcat6 tomcat/java6-tomcat6
#docker build -t igitras/java6-tomcat7 tomcat/java6-tomcat7
#docker build -t igitras/java6-tomcat8 tomcat/java6-tomcat8

#docker build -t igitras/java7-tomcat6 tomcat/java7-tomcat6
#docker build -t igitras/java7-tomcat7 tomcat/java7-tomcat7
#docker build -t igitras/java7-tomcat8 tomcat/java7-tomcat8

#docker build -t igitras/java8-tomcat6 tomcat/java8-tomcat6
#docker build -t igitras/java8-tomcat7 tomcat/java8-tomcat7
#docker build -t igitras/java8-tomcat8 tomcat/java8-tomcat8


# Build all the Mongo images

# Build all the Postgresql images


# Build all the Nginx images

# Build all the PHP images

# Build all the Node images

# Build all the Python images

# Build all the Ruby images

# Build the SMTP image

# Build the Hadoop image

# Build the Spark image
