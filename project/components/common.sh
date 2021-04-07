#!/bin/bash

USER_ID=$(id -u)
if [ "${USER_ID}" -ne 0 ]; then
   echo -e "\e[1;31myou should be root user to perform this operation\e[0m"
   exit 1
fi

PRINT() {
   echo "------------------------------------------------------------------------------------------------------------"
   echo -e "\e[1;35m [INFO] $1 \e[0m"
   echo "------------------------------------------------------------------------------------------------------------"
}

STAT() {
if [ $1 -ne 0 ]; then
   echo "------------------------------------------------------------------------------------------------------------"
   echo -e "\e[1;31m [ERROR] $2 is failure \e[0m"
   echo "------------------------------------------------------------------------------------------------------------"
   exit 2
else
   echo "------------------------------------------------------------------------------------------------------------"
   echo -e "\e[1;32m [SUCC] $2 is sucessful \e[0m"
   echo "------------------------------------------------------------------------------------------------------------"
fi
}

NodeJS_INSTALLITION() {
  PRINT "INSTALL NODEJS"
  yum install nodejs make gcc-c++ -y
  STAT $? "INSTALLITION OF NODESJS"
}

USERADD_ROBOSHOP() {
  id roboshop
  if [ $? -eq 0 ]; then
    echo -e "\e[1,35m RoboShop User Already Exists \e[0m"
    return
   else
     PRINT "CREATE ROBOSHOP APPILICATION USER"
     useradd roboshop
     STAT $? "CREATING ROBOSHOP APPILICATION USER"
 fi
}

DOWNLOAD_COMPONENT_FROM_GITHUB() {
  PRINT "DOWNLOAD ${COMPONENT} FROM GITHUB"
   curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/roboshop-devops-project/${COMPONENT}/archive/main.zip"
  STAT $? "DOWNLOADING ${COMPONENT} FROM GITHUB"
}

EXTRACT_COMPONENT() {
  PRINT "EXTRACT ${COMPONENT}"
   cd /home/roboshop
    rm -rf ${COMPONENT} && unzip /tmp/${COMPONENT}.zip && mv ${COMPONENT}-main ${COMPONENT}
   STAT $? "EXTARCTING ${COMPONENT}"
}

INSTALL_NODEJS() {
  PRINT "INSTALL NODEJS"
   cd /home/roboshop/${COMPONENT}
   npm install  --unsafe-perm
   STAT $? "INSTALLING NODEJS"
}

NODEJS_SETUP() {
  NodeJS_INSTALLITION
  USERADD_ROBOSHOP
  DOWNLOAD_COMPONENT_FROM_GITHUB
  EXTRACT_COMPONENT
  INSTALL_NODEJS
  SETUP_SERVICE
}

SETUP_SERVICE() {
  PRINT "Setup SystemD Service for ${COMPONENT}"
  mv /home/roboshop/${COMPONENT}/systemd.service /etc/systemd/system/${COMPONENT}.service
  sed -i -e 's/'MONGO_DNSNAME/mongodb.projectdevops.tk/ /etc/systemd/system/${COMPONENT}.service
  systemctl daemon-reload && systemctl enable catalogue && systemctl restart catalogue
  STAT $? "STARTING ${COMPONENT} SERVICE"
}