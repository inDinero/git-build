# git-build
Convenience script for building and deploying branches on EngineYard or on Larga.

### Latest Version
1.0.1

### Usage
```sh
$ git-build <options>
```

### Available Options
* `-a|--action string` Operation to perform: append, create (REQUIRED)
* `-e|--environment string` Destination environment: integration, production, staging (on deploy; REQUIRED for hotfix and release)
* `-f|--flag integer` Incrementing flag (non-zero REQUIRED for hotfix, default: 0)
* `-i|--input-file string` List of feature branches to build (optional; ignored on deploy)
* `-t|--type string` Type of branch to build: hotfix, release, stage (REQUIRED)
* `-v|--version yy.m.d` Optional, version number (default: current date for hotfix and stage, next Monday for release)