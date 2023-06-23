#!/bin/bash


set -e

apt-get update

apt-get -y install gettext apache2 psmisc \
                   iputils-ping telnet  \
                   imagemagick ruby-full build-essential zlib1g-dev


export GEM_HOME="/usr/bin/gems"
gem install jekyll bundler

# Install Node 14x
curl -sL https://deb.nodesource.com/setup_20.x | sudo bash -
sudo apt-get install -y nodejs
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn npm


chmod -R 777 /var/www/html

# Allow access to composer global install scripts
echo 'export PATH="$PATH:$WORKDIR/vendor/bin:/home/user/.config/composer/vendor/bin:$WORKDIR/node_modules/.bin:/usr/bin/gems/bin:"' >> /etc/kick_bashrc.d/path
echo 'export GEM_HOME="/usr/bin/gems"' >> /etc/kick_bashrc.d/path

touch /home/user/.bashrc.kickstart
chmod 755 /home/user/.bashrc.kickstart

echo ". /home/user/.bashrc.kickstart" >> /home/user/.bashrc
