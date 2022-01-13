#!/usr/bin/env bash

trap 'on_error' ERR

on_error() {
    echo "Command in script exited with error: $?"
    exit 1
}

# Setup wp-cli
cd /home/developer
mkdir /home/developer/.wp-cli
echo "path: /var/www/html" >> /home/developer/.wp-cli/config.yml
wp package install wp-cli/restful
wp package install https://github.com/bintzpress/wp-cli-fse-support.git

# Setup stuff for building
curl -L https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh -o install.sh
chown developer:developer install.sh
chmod ug+x install.sh
/home/developer/install.sh
[ -s /home/developer/.nvm/nvm.sh ]
. /home/developer/.nvm/nvm.sh
nvm install lts/dubnium
npm install --global grunt-cli
npm install --global grunt-init
npm install --global jshint
rm /home/developer/install.sh

exit 0
