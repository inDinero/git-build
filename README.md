# git-build
Convenience script for building and deploying branches on EngineYard or on Larga.

### Latest Version
1.0.0

### Usage
```sh
$ git-build <options>
```

### Available Options
* `-a|--action string` Operation to perform: append, create (REQUIRED)
* `-b|--branch string` Type of branch to build: hotfix, release, stage (REQUIRED)
* `-e|--environment string` Destination environment: integration, production, staging (on deploy; REQUIRED for hotfix and release)
* `-f|--flag integer` Incrementing flag (non-zero REQUIRED for hotfix, default: 0)
* `-v|--version yy.m.d` Optional, version number (default: current date for hotfix and stage, next Monday for release)