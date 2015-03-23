#!/bin/sh

# Mostly stolen from https://github.com/vidpresso/hubot-syncer/blob/master/pullpushprod.sh

cd /app

echo "Setting up SSH."
mkdir /app/.ssh
echo "$SSH_PRIVATE_KEY" > .ssh/id_rsa
echo "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
echo "Host heroku.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

echo "Cloning repo."
git clone $APPNAME_GITHUB_URL
cd /app/appname

echo "Adding heroku url."
git remote add prod $APPNAME_PRODUCTION_URL

echo "Pushing to heroku."
git checkout master # makes sure there's a master branch to push.
git push prod master

echo "Cleaning up..."
rm -Rf /app/appname
rm -Rf /app/.ssh

exit 0
