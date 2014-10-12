#!/bin/bash

vendor=igitras
imageName=php54
image=$vendor/$imageName

chkresult=`docker images |grep $image |awk '{print $1}'`
if [ -z $chkresult ]
then
echo "bulid php 5.4 image"

mkdir src
cd src

if [ ! -f php-5.4.33.tar.gz ]
then
wget http://cn2.php.net/distributions/php-5.4.33.tar.gz
fi

cat > php.conf << 'EOF'
<Directory /application/www>
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>
<FilesMatch "\.ph(p[2-6]?|tml)$" >
    SetHandler application/x-httpd-php
</FilesMatch>
DirectoryIndex index.php

DocumentRoot /application/www/html
EOF

cat > test.php << 'EOF'
<?php
    phpinfo();
?>
EOF

cd ..
docker build -t $image .

fi
