#!/bin/bash


set -e

apt-get update

apt-get -y install gettext apache2 psmisc \
                   iputils-ping telnet  \
                   imagemagick ruby-full build-essential zlib1g-dev \
                   php8.1 php8.1-curl php8.1-http php8.1-raphf php8.1-yaml composer linkchecker


export GEM_HOME="/usr/bin/gems"
gem install jekyll bundler jekyll-optional-front-matter jekyll-sitemap

# Install Node 20 and npm:
curl -sL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt-get install -y nodejs
sudo npm install -g npm

chmod -R 777 /var/www/html

# Allow access to composer global install scripts
echo 'export PATH="$PATH:$WORKDIR/vendor/bin:/home/user/.config/composer/vendor/bin:$WORKDIR/node_modules/.bin:/usr/bin/gems/bin:"' >> /etc/kick_bashrc.d/path
echo 'export GEM_HOME="/usr/bin/gems"' >> /etc/kick_bashrc.d/path

touch /home/user/.bashrc.kickstart
chmod 755 /home/user/.bashrc.kickstart

echo ". /home/user/.bashrc.kickstart" >> /home/user/.bashrc
