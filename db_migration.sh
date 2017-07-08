#!/usr/bin/env bash

MYSQL="/usr/bin/mysql"
MYSQL_USER="fs151"
MYSQL_PASS="123QWEasd!"
MYSQL_DB="sportfest"

if [ ! -x "$MYSQL" ] && [ -z "$MYSQL" ] ; then
    read -p "MySQL Path (Tab-Vervollständigung möglich)" -e MYSQL
fi

cat 0*.sql | "${MYSQL}" -u "$MYSQL_USER" -p"$MYSQL_PASS" ""$MYSQL_DB"
