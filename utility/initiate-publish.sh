#!/bin/bash

echo -e "Publishing website...\n"

#cd $HOME
git clone --quiet --branch=website https://${GH_TOKEN}@github.com/mozillafordevelopment/mozillafordevelopment.github.io website > /dev/null

git config credential.helper "store --file=.git/credentials"
echo "https://${TOKEN}:@github.com" > .git/credentials
got config user.name "davidascher"

cd website
git rm -rf .
cp -Rf ../_built_website/* .
git add -f .
git commit -m "Lastest harp compiled site on successful travis build $TRAVIS_BUILD_NUMBER auto-pushed to gh-pages"
git push origin master > /dev/null

echo -e "Published website to master.\n"
