#!/bin/bash
# source: https://linoxide.com/tools/install-jira-on-ubuntu-linux/

screen -d -m bash -c /mysqlstart.sh
sleep 5

FILE=/mysqlConfigured.lock
if [[ -f "$FILE" ]]; then
    echo "SQL already configurated"
else
    # first mysql configuration
    mysql -u root < config.sql
    echo "SQL configured"
    touch "$FILE"
fi
sleep 5

# jira installed & stopped
screen -d -m -t jira bash -c /jirastart.sh

read -p "Press enter to continue" -n 1
