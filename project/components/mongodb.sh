#!/bin/bash

source components/common.sh

PRINT "Setup Mongo Repository"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
STAT $? "Setting Mongo repository"

PRINT "Install mongodb"
yum install -y mongodb-org
STAT $? "Installing Mongodb"

PRINT "Update MongoDB Configuration File"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
STAT $? "Updating MongoDB Configuration File"

PRINT "Start mongodb"
systemctl enable mongod
systemctl restart mongod
STAT $? "Starting MongoDB"

PRINT "Download MongoDB Schema"
curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"
STAT $? "Downloading Schema"

PRINT "Extract MongoDB Schemas"
cd /tmp
unzip -o mongodb.zip
STAT $? "Extracting MongoDB schemas"

PRINT "Load Schema"
cd mongodb-main
mongo < catalogue.js && mongo < users.js
STAT $? "Loading Schema"