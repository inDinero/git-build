# Changelog
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## 2.0.0 - 2017-01-26
* Major changes
  * Switch to a workflow much closer to [Gitflow](http://http://nvie.com/posts/a-successful-git-branching-model/)
  * Support monthly deployment schedule releasing on the second to the last monday of every month
  * Separate master-based branches (bugfixes and hotfix patches) from develop-based ones (features, releases and release patches)
  * On hotfix finish, automatically merge to master, develop AND release branch, if one already exists
* Modify options
  * Add -b|--branch, -o|--output-file
  * Remove -e|--environment; inferred from use-case defined by -a|--action and -t|--type
  * Remove -f|--flag; integration now avoids collisions by minute-based version number
* Implement unit testing

## 1.0.1 - 2016-09-06
* Modify help text
  * Add "deploy" to options for -a|--action
  * Add "-i|--input-file string List of feature branches to build (optional; ignored on deploy)"
* Modify options
  * Change from -b|--branch to -t|--type
* Fix behaviour
  * Incorrect behaviour when pre-existing branch detected on ACTION=create; remove " && [ $count -ne 0 ]" on line 611
  * When ACTION=deploy, BRANCH=release && ENVIRONMENT=staging, deploys previous instead of upcoming release
  * Remove show_finale, superseded by -a deploy option

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