#!/bin/bash

if [[ "$#" -lt 3 ]] ; then
  echo "usage: $0 <server> <git-repo> <path>"
  exit 1
fi

HOST=$1
REPO=$2
SERVICE_PATH=$3

ansible-playbook migrate-micro-service-files.yml -i $HOST, \
  --extra-vars="repo=$REPO path=$SERVICE_PATH"
