#!/bin/sh
# Use-case: finish patch for release

function cleanup_branches {
  local branches=`git branch | grep -v master`

  for branch in $branches; do
    (git branch -D $branch) > /dev/null 2>&1
  done
}

function show_scenario {
  local next_release_month=`date -v +1d -v +Mon -v +7d -v +1m -v 1d -v -14d -v +Mon +%y.%-m`

  echo ""
  echo "Apply the following patch to release/$next_release_month.0:"
  git branch | grep 176-implement-specs
  echo ""
}

show_scenario
cleanup_branches
rm -Rf *.sh
