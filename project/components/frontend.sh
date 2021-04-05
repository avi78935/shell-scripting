#!/bin/bash

source components/common.sh

PRINT "Installing Nginx"
yum install nginx -y
STAT $? "Installition Of Nginx"

PRINT "Download Frontend Component"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
STAT $? "Downloading Frontend Component"

PRINT "Extract Component"
cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
STAT $? "Extarcting Component"

mv frontend-main/* .
mv static/* .
rm -rf frontend-master README.md

PRINT "Update Nginx Configuration"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
STAT $? "Updating Nginx Configuration"

PRINT "Star Nginx Service"
systemctl enable nginx
systemctl restart nginx
STAT $? "Restarting Nginx"