#!/bin/sh

echo "Type author of project included in android package (com.<author>.<projectName>)"
read author
echo "Type your project name. Write it in CapitalizeCamelCase"
read projectName

# Android
mkdir android/app/src/main/java/com/$author
mkdir android/app/src/main/java/com/$author/$projectName
cp android/app/src/main/java/com/dsznajder/templateproject/MainActivity.java \
   android/app/src/main/java/com/$author/$projectName/MainActivity.java
cp android/app/src/main/java/com/dsznajder/templateproject/MainApplication.java \
   android/app/src/main/java/com/$author/$projectName/MainApplication.java
rm -rf android/app/src/main/java/com/dsznajder

# IOS
mv ios/TemplateProject.xcodeproj/xcshareddata/xcschemes/TemplateProject.xcscheme \
   ios/TemplateProject.xcodeproj/xcshareddata/xcschemes/$projectName.xcscheme
mv ios/TemplateProject.xcodeproj ios/$projectName.xcodeproj
mv ios/TemplateProject ios/$projectName

# # TODO: Change TemplateProject to ProjectName

echo '\n';
echo 'Initializing git...';
rm -rf .git .circleci greenkeeper.json LICENCE;
git init;
echo '\n';

_=$(command -v yarn);
if [ "$?" != "0" ]; then
  npm install;
fi;
yarn install;

rm -rf ./scripts
