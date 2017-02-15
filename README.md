# git-build
Convenience script for building and deploying branches on EngineYard or on Larga.

### Latest Version
2.0.0

### Usage
```sh
$ git-build <options>
```

### Available Options
* `-a|--action STRING` Operation to perform: add-to, deploy, finish, start (REQUIRED)
* `-b|branch STRING` Branch name; overrides -v|--version (REQUIRED is -v|--version is not provided)
* `-f|--from STRING` Parent branch (REQUIRED for start integration and deploy integration)
* `-i|--input-file STRING` List of feature branches to build (REQUIRED except for deploy, finish hotfix, finish release and start release)
* `-o|--output-file STRING` Override the auto-generated filename for the log file
* `-t|--type STRING` Type of branch to build or deploy: bugfix, develop, feature, hotfix, integration, production, release (REQUIRED)
* `-v|--version YY.M.D` Version number
  * AUTO-GENERATED for deploy release, finish release, start integration, start release
  * IGNORED for deploy develop, deploy production and finish feature
  * REQUIRED for everything else, if -b|--branch is not provided
