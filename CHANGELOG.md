# Changelog

This file contains changes to the wordpress-development-stack project.

## 0.4.0

### Changed

- went back to developer home being built into the image and the Projects directory being mounted from 
  the host
  
## 0.3.0

### Changed

- updated .env-windows_sample and .env-linux_sample and docker-compose-wordpress.yml to use a directory to find
  the HAProxy configuration directory.

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
