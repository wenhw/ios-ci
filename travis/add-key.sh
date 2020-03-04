#!/bin/sh
# Create a custom keychain
security create-keychain -p travis ios-build.keychain
security default-keychain -d user -s ios-build.keychain
security unlock-keychain -p travis ios-build.keychain
security set-keychain-settings -t 3600 -l ~/Library/Keychains/ios-build.keychain

security import ./cert/AppleWWDRCA.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./cert/loginpush.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./cert/loginpush.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -A

echo "list keychains: "
security list-keychains
echo " ****** "

echo "find indentities keychains: "
security find-identity -p codesigning  ~/Library/Keychains/ios-build.keychain
echo " ****** "

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp "./cert/loginpush.mobileprovision" ~/Library/MobileDevice/Provisioning\ Profiles/
