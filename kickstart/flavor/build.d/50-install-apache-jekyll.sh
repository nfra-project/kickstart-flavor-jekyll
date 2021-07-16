#!/bin/bash


set -e

apt-get update

apt-get -y install gettext apache2 jekyll ruby-jekyll-remote-theme ruby-jekyll-coffeescript ruby-jekyll-sass-converter \
                   iputils-ping telnet



# Allow access to composer global install scripts
echo 'export PATH="$PATH:$WORKDIR/vendor/bin:/home/user/.config/composer/vendor/bin:$WORKDIR/node_modules/.bin:"' >> /etc/kick_bashrc.d/path

touch /home/user/.bashrc.kickstart
chmod 755 /home/user/.bashrc.kickstart

echo ". /home/user/.bashrc.kickstart" >> /home/user/.bashrc