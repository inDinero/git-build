#!/bin/sh
# Use-case: start integration branch from master

function cleanup_branches {
  local branches=`git branch | grep -v master`

  for branch in $branches; do
    (git branch -D $branch) > /dev/null 2>&1
  done
}

function show_scenario {
  echo ""
  echo "Create an integration branch, which contains the following bugfixes:"
  git branch | grep bugfix
  echo ""
}

show_scenario
cleanup_branches
rm -Rf *.sh
