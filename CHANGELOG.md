# Change Log
All notable changes to this project will be documented in this file. Any changes in containers or services will be documented in the container/service folder
 
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).
 
## [Unreleased - ToDo] - yyyy-mm-dd
 
Here we write upgrading notes. It's a team effort to make them as
straightforward as possible.
 
### Added
- [PROJECTNAME-XXXX](http://tickets.projectname.com/browse/PROJECTNAME-XXXX)
  MINOR Ticket title goes here.
- [PROJECTNAME-YYYY](http://tickets.projectname.com/browse/PROJECTNAME-YYYY)
  PATCH Ticket title goes here.
 
### Changed
 
### Fixed
-None

### Security
- None

## [0.0.3] - 2022-09-06

### Added
- git_status.cmd

### Changed
- set_git_local_user_config.cmd

## [0.0.2] - 2022-03-10

### Changed
- added using ENV vars when running balena_push_with_pull_build_env_added

## [0.0.1] - 2022-01-20

### Added
- file CHANGELOG.md (this file) added
- create_containers_version_tree_file.cmd. <br>
also requires to add the __line fleet_containers_tree.txt__ in .dockerignore file in ..\containers folder.