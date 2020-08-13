#!/bin/bash
# source: https://linoxide.com/tools/install-jira-on-ubuntu-linux/

screen -d -m mysql bash /mysqlstart.sh
sleep 5

FILE=/mysqlConfigured.lock
if ![ -f "$FILE" ]; then
    # first mysql configuration
    mysql -u root -p < config.sql
    echo "SQL configured"
    touch "$FILE"
fi
sleep 5

#FILE=/etc/init.d/jira
#if ![ -f "$FILE" ]; then
    ## install jira
    #bash /installjira.sh
#fi

# jira installed & stopped
screen -d -m jira bash /jirastart.sh
read -p "Press enter to continue" -n 1
