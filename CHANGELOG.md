# Changelog

This file contains changes to the wordpress-development-stack project.

## 0.8.0

- Gutted things so that image building and the devcontainer is separated and this project is just the docker-compose.yml files to bring up the stack.

## 0.7.0

- Changed so that COMPOSE_PROJECT_NAME is defined in .env
- Changed so that WordPress and Project containers pull environment from the .wordpress.env file
- Added .wordpress.env.sample which is a sample for WordPress environment variables. Includes debug, single site, and multi site settings.

## 0.6.0

- Fixed it so .env isn't committed anymore.

## 0.5.0

### Changed

- moved .env files back to the base directory and changed 
  devcontainer.json to load docker-compose.yml last.
- renamed PROJECTS_DIR to PROJECTS_HOST_DIR to make it clear the 
  directory is on the host.

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
