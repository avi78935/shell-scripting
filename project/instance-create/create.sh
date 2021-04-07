#!/bin/bash

LID=lt-0d744f151b5a9254c
LVER=2

COMPONENT=$1

if [ -z "$1" ]; then
  echo "Component Name is Required"
  exit 1
fi

INSTANCE_EXISTS=$(aws ec2 describe-instances --filters Name=tag:Name,Values=${COMPONENT}  | jq .Reservations[])
STATE=$(aws ec2 describe-instances     --filters Name=tag:Name,Values=${COMPONENT}  | jq .Reservations[].Instances[].State.Name | xargs)
if [ -z "${INSTANCE_EXISTS}" -o "STATE" == "terminated" ]; then
  aws ec2 run-instances --launch-template LaunchTemplateId=${LID},Version=${LVER}  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${COMPONENT}}]" | jq
  else
    echo "INSTANCE ${COMPONENT} ALREADY EXISTS"
  fi

IPADDRESS=$(aws ec2 describe-instances     --filters Name=tag:Name,Values=${COMPONENT}   | jq .Reservations[].Instances[].PrivateIpAddress | grep -v null |xargs)

sed -e "s/COMPONENT/${COMPONENT}/"  -e"s/IPADDRESS/${IPADDRESS}/" record.json >/tmp/record.json
  aws route53 change-resource-record-sets --hosted-zone-id Z10174611DOMQBMGYNMVO --change-batch file:///tmp/record.json


