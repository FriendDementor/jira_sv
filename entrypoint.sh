#!/bin/sh
# source: https://linoxide.com/tools/install-jira-on-ubuntu-linux/

screen -d -m mysql sh /mysqlstart.sh
sleep 5

FILE=/etc/init.d/jira
if ![ -f "$FILE" ]; then
    # install jira
    sh /installjira.sh
fi

# jira installed & stopped
screen -d -m jira sh /jirastart.sh
read -p "Press enter to continue"
