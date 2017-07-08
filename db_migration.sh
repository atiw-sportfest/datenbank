#!/usr/bin/env bash
if [ -z "$MYSQL" ] ; then
	read -p "MySQL Path: " -e MYSQL
fi
cat 0*.sql | "$MYSQL" -u fs151 -p"123QWEasd!" sportfest