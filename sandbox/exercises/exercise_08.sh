#!/bin/sh
# Use-case: finish features

function cleanup_branches {
  local branches=`git branch | grep -v master`

  for branch in $branches; do
    (git branch -D $branch) > /dev/null 2>&1
  done
}

function show_scenario {
  echo ""
  echo "Add the following features to develop:"
  git branch | grep feature
  echo ""
}

show_scenario
cleanup_branches
rm -Rf *.sh
