#!/bin/bash

print_usage () {
  echo "  Usage:  setup.sh <--name NAME>     <--pat PAT>  <--pool AGENT_POOL>   <--path HOST_PATH>"
  echo "Example:  setup.sh  --name devopsdani --pat 123yxz --pool temporary_pool --path /var/vsts/agent"
  exit 1
}

pn=0
while [ $# -gt 0 ]; do
   if [[ $1 == *"--"* ]]; then
        v="${1/--/}"
        declare $v="$2"
        ((pn=pn+1))
   fi
  shift
done

 if [ -z ${name+x} ] || [ -z ${pat+x} ] || [ -z ${pool+x} ] || [ -z ${path+x} ]; then
    echo "## ERROR | name, pat, pool and path are mandatory parameters! ##"
    print_usage
else
    docker run \
        -e VSTS_ACCOUNT=$name \
        -e VSTS_TOKEN=$pat \
        -e VSTS_AGENT='$(hostname)-agent' \
        -e VSTS_POOL=$pool \
        -e VSTS_WORK='/var/vsts/' \
        -v /var/vsts:$path \
        -it -d --restart unless-stopped \
        --name $(hostname)-agent\
        mcr.microsoft.com/azure-pipelines/vsts-agent:ubuntu-16.04
fi