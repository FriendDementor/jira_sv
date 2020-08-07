#!/bin/bash
/usr/bin/install -m 755 -o mysql -g root -d /var/run/mysqld
/usr/sbin/mysqld $MYSQLD_OPTS $_WSREP_NEW_CLUSTER $_WSREP_START_POSITION
