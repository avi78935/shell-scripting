#!/bin/bash

USER_ID=$(id -U)
  if [${USER_ID} -ne 0 ]; then
   echo -e "\e[1;31myou should be root user to perform this operation\e[0m"
   exit 1
  fi

PRINT() {
   echo "------------------------------------------------------------------------------------------------------------"
   echo -e "\e[1;35mINFO $1 \e]0m"
   echo "------------------------------------------------------------------------------------------------------------"
}

STAT() {
  if [$1 -ne 0 ];then
   echo "------------------------------------------------------------------------------------------------------------"
   echo -e "\e[1,31m $2 is failure \e[0m"
   echo "------------------------------------------------------------------------------------------------------------"
   exit 2
   else
   echo "------------------------------------------------------------------------------------------------------------"
   echo -3 "\e[1,32m $2 is sucessful \e[0m"
   echo "------------------------------------------------------------------------------------------------------------"
  fi
}