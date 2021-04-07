#!/bin/bash

LID=lt-0d744f151b5a9254c
LVER=2

COMPONENT=$1

if[ -z "$1" ]; then
  echo "Component Name is Required"
  exit 1
fi

aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}