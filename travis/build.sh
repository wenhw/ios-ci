#!/bin/sh
xcrun xcodebuild -project LoginPush.xcodeproj -scheme LoginPush \
  -archivePath LoginPush.xcarchive archive

xcrun xcodebuild -exportArchive -archivePath LoginPush.xcarchive \
  -exportPath ./build -exportOptionsPlist ExportOptions.plist
