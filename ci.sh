#!/bin/bash
set -e
xcodebuild -project 'News.xcodeproj' -scheme 'News' -destination 'platform=iOS Simulator,name=iPhone 8' test
xcodebuild -project 'News.xcodeproj' -scheme 'News' -destination 'generic/platform=iOS' -configuration Release build CODE_SIGNING_ALLOWED=NO
