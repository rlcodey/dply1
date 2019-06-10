#!/bin/bash

DEPLOYMENTS_PATH="deployments"
PROJECTS_PATH="projects"

if [ "$#" -ne 3 ]
then
  echo "Usage: $0 <environment_name> <deployment_name> <project_list>" >&2
  exit 1
fi

if [ -d "$DEPLOYMENTS_PATH/$1/$2" ]
then
  echo "Deployment directory already exists"
  exit 1
fi

if ! [ -e "$3" ]
then
  echo "Project list file not found"
  exit 1
fi

mkdir -p $DEPLOYMENTS_PATH/$1/$2
mkdir -p $DEPLOYMENTS_PATH/$1/$2/$PROJECTS_PATH

for p in `cat $3`
do
  touch $DEPLOYMENTS_PATH/$1/$2/$PROJECTS_PATH/$p.txt
done
