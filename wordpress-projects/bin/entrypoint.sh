#!/usr/bin/env bash

pid=0

sigterm_handler() {
  echo "sigterm handler called..."
  if [ $pid -ne 0 ]; then
    kill -TERM "$pid"
    echo "tail process terminated..."
    wait "$pid"
  fi
  # using the sigterm is a normal exit for us so exit with 0
  exit 0;
}

trap 'kill ${!}; sigterm_handler' TERM

if [ ! -e /home/developer/.bashrc ]; then
  echo "Initializing Developer Home Directory"

  chown developer:developer /home/developer
  cp -R /etc/skel/. /home/developer
  chown -R developer:developer /home/developer/.

  echo "source /etc/profile.d/bash_completion.sh" >> /home/developer/.bashrc
  echo "source /etc/profile.d/wp_completion.sh" >> /home/developer/.bashrc

  mkdir /home/developer/Projects
  chown developer:developer /home/developer/Projects

  su - developer -c "wp package install wp-cli/restful"

  echo "path: /var/www/html" >> /home/developer/.wp-cli/config.yml
  chown developer:developer /home/developer/.wp-cli/config.yml

  cd /home/developer
  curl -L https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh -o install.sh
  chown developer:developer install.sh
  chmod ug+x install.sh
  su - developer -c "/home/developer/install.sh"
  su - developer -c ". /home/developer/.nvm/nvm.sh &&
     nvm install lts/dubnium &&
     npm install --global grunt-cli &&
     npm install --global grunt-init &&
     npm install --global jshint"
  rm /home/developer/install.sh

  echo "Finished Initializing Developer Home Directory"
fi

# wait forever
while true
do
  tail -f /dev/null & wait ${!}
done
