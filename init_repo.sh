#!/bin/bash

# Initialize the repo with nominate, qualify, signoff, and review branches.


GITCURBRANCH=`git branch | grep \* | cut -d ' ' -f2`

git checkout master

# Create nominate branch off of master

git branch nominate
git checkout nominate

# Create qualify, signoff, review branches off of nominate

git branch qualify
git branch signoff
git branch review

# Create qualify, signoff, review branches for each project

for p in `cat projects.txt`
do

  git checkout qualify
  QUALIFY_BRANCH="$p-qualify"
  git branch $QUALIFY_BRANCH

  git checkout signoff
  SIGNOFF_BRANCH="$p-signoff"
  git branch $SIGNOFF_BRANCH

  git checkout review
  DEPLOY_BRANCH="$p-review"
  git branch $DEPLOY_BRANCH

done

git checkout $GITCURBRANCH