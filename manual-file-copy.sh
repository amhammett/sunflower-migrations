#!/bin/bash

env=$1
tm=$(date +'%s')

# enable/disable offline vars
#offline=""
offline=".offline"

amee_test="10.254.22.22 10.254.22.24"
amee_prod="192.168.154.61 192.168.154.62 192.168.154.63 192.168.154.64"

gee.io_test="10.254.22.22 10.254.22.24"
gee.io_prod="192.168.154.65 192.168.154.66 192.168.154.67 192.168.154.68"

imah_test="10.254.22.22 10.254.22.24"
imah_prod="192.168.154.37 192.168.154.38 192.168.154.39 192.168.154.40"

sites="amee gee.io imah"

for i in $sites; do

  # set server
  if [[ $env == "test" ]];then
    if [[ $i == "amee" ]];then
      server=$amee_test
    elif [[ $i == "gee.io" ]];then
      server=$gee.io_test
    elif [[ $i == "imah" ]];then
      server=$imah_test
    fi
  elif [[ $env == "prod" ]];then
    if [[ $i == "amee" ]];then
      server=$amee_prod
    elif [[ $i == "gee.io" ]];then
      server=$gee.io_prod
    elif [[ $i == "imah" ]];then
      server=$imah_prod
    fi
  fi

  echo $i
  for s in $server ;do
    env_file="/apps/apache2/${i}/htdocs/${i}/sites/all/resources/env_var.info"

    echo "$s"

    echo "- back up file"
    ssh -q -i ~/.ssh/id_rsa.tableaux tableaux@$s cp $env_file $env_file.$tm

    echo "- copy"
    scp -q -i ~/.ssh/id_rsa.tableaux data/env_var.info.${i}$imah$offline tableaux@$s:$env_file

    echo "- cc"
    ssh -q -i ~/.ssh/id_rsa.tableaux tableaux@$s rm -rf /apps/apache2/${i}/htdocs/${i}/cache/normal/*
    echo ""
  done
done
