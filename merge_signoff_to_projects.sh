#!/bin/bash

SOURCE_BRANCH=signoff

if [ "$#" -ne 1 ]
then
  echo "Usage: $0 <project_list>" >&2
  exit 1
fi

if ! [ -e "$1" ]
then
  echo "Project list file not found"
  exit 1
fi

GITCURBRANCH=`git branch | grep \* | cut -d ' ' -f2`

for p in `cat $1`
do
  git checkout $p-$SOURCE_BRANCH
  git merge $SOURCE_BRANCH
  git push -u origin $p-$SOURCE_BRANCH
done

git checkout $GITCURBRANCH