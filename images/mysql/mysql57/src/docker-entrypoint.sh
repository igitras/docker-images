#!/bin/bash
set -e

if [ -z "$(ls -A /application/data)" -a "${1%_safe}" = 'mysqld' ]; then
  if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
    echo >&2 'error: database is uninitialized and MYSQL_ROOT_PASSWORD not set'
    echo >&2 '  Did you forget to add -e MYSQL_ROOT_PASSWORD=... ?'
    exit 1
  fi

  # Setup the directory authority
  cd /application \
    && cd mysql \
    && chown -R mysql . \
    && chgrp -R mysql . \
    && mysql_install_db --user=mysql --datadir=/application/data \
    && chown -R root . \
    && chown -R mysql /application/data

	
    #mysql_install_db --user=mysql --datadir=/application/data
	
    # These statements _must_ be on individual lines, and _must_ end with
    # semicolons (no line breaks or comments are permitted).
    # TODO proper SQL escaping on ALL the things D:
    TEMP_FILE=/tmp/mysql-first-time.sql
   
echo "DELETE FROM mysql.user ;" >> $TEMP_FILE
echo "CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> $TEMP_FILE
echo "GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;" >> $TEMP_FILE
echo "DROP DATABASE IF EXISTS test;" >> $TEMP_FILE
	
if [ "$MYSQL_DATABASE" ]; then
   echo "DROP DATABASE IF EXISTS $MYSQL_DATABASE;" >> $TEMP_FILE
   echo "CREATE DATABASE $MYSQL_DATABASE ;" >> $TEMP_FILE
fi
	
if [ "$MYSQL_USER" -a "$MYSQL_PASSWORD" ]; then
   echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> $TEMP_FILE
		
   if [ "$MYSQL_DATABASE" ]; then
      echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;" >> $TEMP_FILE
   fi
fi
	
	echo "FLUSH PRIVILEGES ;" >> $TEMP_FILE
	
	set -- "$@" --init-file="$TEMP_FILE"
fi

cat $TEMP_FILE

#chown -R mysql:mysql /application/data
exec "$@"
