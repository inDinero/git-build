#!/bin/sh
# Use-case: start hotfix

function cleanup_branches {
  local branches=`git branch | grep -v master`

  for branch in $branches; do
    (git branch -D $branch) > /dev/null 2>&1
  done
}

function show_scenario {
  local last_release_month=`date -v -Mon -v +14d -v 1d -v -14d -v +Mon +%y.%-m`

  echo ""
  echo "Create the hotfix branch hotfix/$last_release_month.2, which includes the following bugfixes:"
  git branch | grep bugfix
  echo ""
}

show_scenario
cleanup_branches
rm -Rf *.sh
