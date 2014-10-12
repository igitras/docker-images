Apache Image 
============

This is apache httpd image build from apache 2.4.10. The installation path is at /application/apache.

Build
-----

1. Modify the build.sh, change the value of vendor and imageName to your favorite.
2. Modify the build.sh, change the value of APACHE_VERSION, APR_VERSION and APR_UTIL_VERSION to customize the apache http server version if you like.
3. Modify the Dockerfile, change the Base Image to your personalized value, change APACHE_VERSION, APR_VERSION and APR_UTIL_VERSION if you want to build a different version httpd server.
4. Run the file build.sh.

Usage
-----

Build image with this Dockerfile and the set the Output Image as the base image of other images.

