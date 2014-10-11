#!/bin/bash

chmod 755 `find . -name '*.sh'`
vendor=igitras

# This is the main build file for build all the docker images.

# Build the Base image for the images need to build
cd build && ./build.sh && cd ..

# Build Apache base images
cd apache && ./build.sh && cd ..

# Build Php images
cd php && ./build.sh && cd ..

#cd php/php53 && ./build.sh && cd ../..
#cd php/php54 && ./build.sh && cd ../..
#cd php/php55 && ./build.sh && cd ../..
#cd php/php56 && ./build.sh && cd ../..

# Build Mysql images
cd mysql && ./build.sh && cd ..

# Build all the java images
cd java && ./build.sh && cd ..
#docker build -t igitras/java6 java/java6

#docker build -t igitras/java6 java/java7

#docker build -t igitras/java6 java/java8

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


# Build all the mysql images
#docker build -t igitras/mysql56 mysql/mysql56

#docker build -t igitras/mysql57 mysql/mysql57

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
