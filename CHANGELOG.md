# Changelog

This file contains changes to the wordpress-cluster project.

## 0.2.0

### Added

- added .env.windows_sample containing environment settings for Windows.

### Changed

- renamed .env.sample to .env.linux_sample containing environment settings for Linux
- wordpress-projects/Dockerfile to install gettext
- wordpress-projects/bin/entrypoint.sh to install grunt-pot
- updated the INSTALL.md to have Windows and Linux install directions.

### Removed

- Removed .devcontainer/docker-compose.yml. Using this to override the projects service didn't work on Windows.

## 0.1.0

### Added

- Initial files added
