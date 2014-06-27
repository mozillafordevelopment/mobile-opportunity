#!/bin/bash


#cd $HOME
echo -e "Getting branch...\n"
git clone --quiet --branch=website https://${GH_TOKEN}@github.com/mozillafordevelopment/mozillafordevelopment.github.io website > /dev/null

cd website
git config credential.helper "store --file=.git/credentials"
echo "https://${TOKEN}:@github.com" > .git/credentials
git config --global user.name "davidascher"
git config --global user.email "david.ascher@gmail.com"

git rm -rf .
cp -Rf ../_built_website/* .
git add -f .
echo -e "Publishing website...\n"
git commit -m "Lastest harp compiled site on successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to gh-pages"
git push origin master > /dev/null

echo -e "Published website to master.\n"
