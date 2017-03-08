#!/bin/sh
# Use-case: finish hotfix

function cleanup_branches {
  local branches=`git branch | grep -v master`

  for branch in $branches; do
    (git branch -D $branch) > /dev/null 2>&1
  done
}

function show_scenario {
  echo ""
  echo "Merge `git branch | grep hotfix | sed 's/ //g'` to master and develop (as well as `git branch | grep release | sed 's/ //g'`)."
  echo ""
}

show_scenario
cleanup_branches
rm -Rf *.sh
