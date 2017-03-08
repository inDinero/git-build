#!/bin/sh
# Use-case: add-to integration branch from master

function cleanup_branches {
  local branches=`git branch | grep -v master`

  for branch in $branches; do
    (git branch -D $branch) > /dev/null 2>&1
  done
}

function show_scenario {
  echo ""
  echo "Add the following bugfixes to `git branch | grep integration | sort | head -1 | sed 's/ //g'`:"
  git branch | grep bugfix | grep -v bugfix/192-add-mongodb-gems
  echo ""
}

show_scenario
cleanup_branches
rm -Rf *.sh
