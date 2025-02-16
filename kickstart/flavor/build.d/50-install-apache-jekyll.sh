#!/bin/bash


set -e

apt-get update

apt-get -y install gettext apache2 psmisc \
                   iputils-ping telnet  \
                   imagemagick ruby-full build-essential zlib1g-dev \
                   php8.3 php8.3-curl php8.3-http php8.3-raphf php8.3-yaml composer linkchecker


export GEM_HOME="/usr/bin/gems"
gem install jekyll bundler jekyll-optional-front-matter jekyll-sitemap

# Install Node 20 and npm:
curl -sL https://deb.nodesource.com/setup_23.x | sudo bash -
sudo apt-get install -y nodejs
sudo npm install -g npm yarn

sudo composer global require lack/kindergarden

chmod -R 777 /var/www/html

# Allow access to composer global install scripts
echo 'export PATH="$PATH:$WORKDIR/vendor/bin:/home/user/.config/composer/vendor/bin:$WORKDIR/node_modules/.bin:/usr/bin/gems/bin:"' >> /etc/kick_bashrc.d/path
echo 'export GEM_HOME="/usr/bin/gems"' >> /etc/kick_bashrc.d/path

touch /home/user/.bashrc.kickstart
chmod 755 /home/user/.bashrc.kickstart

echo ". /home/user/.bashrc.kickstart" >> /home/user/.bashrc


## Ubuntu 23.04 -> change user ubuntu to uid 999
usermod -u 999 ubuntu