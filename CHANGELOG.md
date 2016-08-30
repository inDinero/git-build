# Changelog
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## 1.0.0 - 2016-08-30
* Release branches
  * Support creation of release branches
  * Support addition of PRs to pre-existing release branches
  * Modify versioning from yy.m.d (day of month) to yy.m.w (week of month)
  * Support deployment of release branches to EngineYard
    * Merge release branch to develop and master
    * Deploy on EngineYard via SSH
* Throw-away staging (integration) branches
  * Support creation of staging branches
  * Support addition of PRs to pre-existing staging branches
  * Support deployment of staging branches to Larga
    * Deploy on Larga via SSH
    * Re-assign Larga instance from local.indinerocorp.com to integration.indinerocorp.com
    * Automatically send Slack notifications linking to integration
    * Automatically start delayed jobs
    * Automatically run outstanding rake tasks
* Hotfix branches
  * Require flag parameter for hotfix branches
  * Support creation of hotfix branches
  * Support addition of PRs to pre-existing hotfix branches
  * Modify versioning from yy.m.d.f (day of month) to yy.m.w.f (week of month)
  * Support deployment of hotfix branches to Larga
    * Deploy on Larga via SSH
  * Support deployment of hotfix branches to EngineYard
    * Merge hotfix branch to develop and master
    * Deploy on EngineYard via SSH
* Others
  * Fixed bug when BM's local branch diverges from origin version of the same branch
  * Automatically generates version number
    * For hotfix: use previous Monday, except if run on Monday after 12PM Monday, in which case, use current Monday
    * For release: use next Monday, except if run on Monday before 12PM, in which case, use current Monday
    * For staging: still uses current date yy.m.d
  * On create, verifies absence of branch; on append, verifies presence
  * Removed fail behaviour when branches are not rebased and/or merged successfully
    * Based on BM feedback, also enabled pushing of successfully rebased, merged and/or generated branches
    * Corrections applied via [-a/--action append]

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