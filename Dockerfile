FROM ubuntu:20.04

RUN apt update && apt upgrade -y

RUN apt install wget mariadb-server unzip screen -y
# download jira
RUN wget https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-software-7.8.2-x64.bin
# make script executable
RUN chmod +x atlassian-jira-software-7.8.2-x64.bin
# execute script with default options
RUN yes "" | ./atlassian-jira-software-7.8.2-x64.bin
# stop jira service
RUN /etc/init.d/jira stop || true
# download mysql connector
RUN wget https://dev.mysql.com/get/archives/mysql-connector-java-5.1/mysql-connector-java-5.1.36.zip
# unzip connector
RUN unzip mysql-connector-java-5.1.36.zip
# install connector
RUN cp mysql-connector-java-5.1.36/mysql-connector-java-5.1.36-bin.jar /opt/atlassian/jira/lib/

COPY *.sh /

COPY config.sql /

RUN chmod +x /entrypoint.sh

RUN chmod +x /mysqlstart.sh

ENTRYPOINT entrypoint.sh
