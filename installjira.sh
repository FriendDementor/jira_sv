#!/bin/sh
# configure the mysql the first time
mysql -u root -p < configMysql.sql
# download jira
wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-7.8.2-x64.bin
# make script executable
chmod +x atlassian-jira-software-7.8.2-x64.bin
# execute script with default options
yes "" | ./atlassian-jira-software-7.8.2-x64.bin
# stop jira service
/etc/init.d/jira stop
# download mysql connector
wget https://dev.mysql.com/get/archives/mysql-connector-java-5.1/mysql-connector-java-5.1.36.zip
# unzip connector
unzip mysql-connector-java-5.1.36.zip
# install connector
cp mysql-connector-java-5.1.36/mysql-connector-java-5.1.36-bin.jar /opt/atlassian/jira/lib/
