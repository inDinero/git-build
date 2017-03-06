#!/bin/sh
# Use-case: add-to integration branch from develop

function cleanup_branches {
  local branches=`git branch | grep -v master`

  for branch in $branches; do
    (git branch -D $branch) > /dev/null 2>&1
  done
}

function show_scenario {
  echo ""
  echo "Add the following features to `git branch | grep integration | sort | tail -1 | sed 's/ //g'`:"
  git branch | grep feature | grep -v feature/164-implement-category
  echo ""
}

show_scenario
cleanup_branches
rm -Rf *.sh
