#!/usr/bin/env bash

trap 'on_error' ERR

on_error() {
    echo "Command in script exited with error: $?"
    exit 1
}

# Setup composer and wp-cli
echo 'PATH=$PATH:/home/developer/.config/composer/vendor/bin' >> /home/developer/.bashrc
cd /home/developer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mkdir -p /home/developer/.config/composer/vendor/bin
mv composer.phar /home/developer/.config/composer/vendor/bin/composer
export PATH=$PATH:/home/developer/.config/composer/vendor/bin
composer config --global github-protocols https
composer global require wp-cli/wp-cli-bundle
mkdir /home/developer/.wp-cli
echo "path: /var/www/html" >> /home/developer/.wp-cli/config.yml
wp package install wp-cli/restful
wp package install bintzpress/wp-cli-fse-support:@stable

# Setup Grunt and it's dependencies
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
