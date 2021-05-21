#!/bin/bash

#  set_build_number.sh
#
#  Created by Heiko Pälike on 25/05/2018.
#  Copyright © 2021 Heiko Pälike. All rights reserved.
# http://www.mokacoding.com/blog/automatic-xcode-versioning-with-git/
git=$(sh /etc/profile; which git)
number_of_commits=$("$git" rev-list HEAD --count)
git_release_version=$("$git" describe --tags --always --abbrev=0)
target_plist="$SRCROOT/Info.plist"

for plist in "$target_plist" ; do
  if [ -f "$plist" ]; then
  /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $number_of_commits" "$plist"
  /usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString ${git_release_version#*v}" "$plist"
  fi
done
