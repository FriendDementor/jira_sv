CREATE DATABASE jira_db;
CREATE USER 'jira_user'@'localhost' IDENTIFIED BY 'Your_Password';
GRANT ALL PRIVILEGES ON jira_db.* TO 'jira_user'@'localhost' IDENTIFIED by 'Your_Password';
FLUSH PRIVILEGES;
