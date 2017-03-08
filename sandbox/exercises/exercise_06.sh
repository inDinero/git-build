#!/bin/sh
# Use-case: finish bugfixes

function cleanup_branches {
  local branches=`git branch | grep -v master`

  for branch in $branches; do
    (git branch -D $branch) > /dev/null 2>&1
  done
}

function show_scenario {
  local last_release_month=`date -v -Mon -v +14d -v 1d -v -14d -v +Mon +%y.%-m`

  echo ""
  echo "Add the following bugfixes to hotfix/$last_release_month.1:"
  git branch | grep bugfix | grep -v bugfix/192-add-mongodb-gems
  echo ""
}

show_scenario
cleanup_branches
rm -Rf *.sh
