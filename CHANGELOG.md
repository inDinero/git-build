# Changelog
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## 0.4.0 - 2016-04-15
* To get the latest copy, run git-merge after git-fetch origin
* Remove --force-with-lease flag when pushing to develop or master
* In case of rebase / merge conflict on production, DO NOT proceed with creation of release branch
  * Include instructions for conflicting branches
* Generate cleanup script after each build
  * Removes auto-generated input file and/or tags (if applicable)
  * Removes feature branches and build branch
  * Removes cleanup file

## 0.3.0 - 2016-03-16
* Condensed two scripts (git-staging and git-production) into one (git-build)
* Added environment option (-e), which defaults to staging
* Fully automated merging and rebasing. In case of conflict:
  * Aborts operation and cleans up for the current branch ONLY.
  * Alerts build master of failure.
  * Proceeds with other branches.
  * At the end of the build process, displays a summary of conflicts detected.
* Moved operations that touch on remote origin to one of two places:
  * At the start of the script, git-fetch origin, done automatically.
  * At the end of the script, git-push XXX, displayed by the script but executed manually by build master (just in case any conflicts are detected)
* Also displays cleanup commands for the local repository.

## 0.2.0 - 2016-03-07
* Added sub-version option (-v) as requested by Ruth
* Allow on-the-fly creation of input file; input file argument is optional
* Fail gracefully when input file contains no valid feature branch
* Grouped generated commands into safe "batches"
* Added --no-ff option when merging to develop as requested by Gary

## 0.1.0 - 2016-03-02
* Initial implementation of git-staging and git-production