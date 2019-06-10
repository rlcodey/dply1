#!/bin/bash

DEPLOYMENTS_PATH="deployments"
PROJECTS_PATH="projects"

if [ "$#" -ne 2 ]
then
  echo "Usage: $0 <deployment_name> <project_list>" >&2
  exit 1
fi

if [ -d "$DEPLOYMENTS_PATH/$1" ]
then
  echo "Deployment directory already exists"
  exit 1
fi

if ! [ -e "$2" ]
then
  echo "Project list file not found"
  exit 1
fi

mkdir -p $DEPLOYMENTS_PATH/$1
mkdir -p $DEPLOYMENTS_PATH/$1/$PROJECTS_PATH

for p in `cat $2`
do
  touch $DEPLOYMENTS_PATH/$1/$PROJECTS_PATH/$p.txt
done
