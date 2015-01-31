#!/bin/bash -e
########################################################################################################################
# CI Server Buildskript
#-----------------------------------------------------------------------------------------------------------------------
# \project    Mpjoe
# \file       snap-setup-android.sh
# \creation   2015-01-30, Joe Merten
#-----------------------------------------------------------------------------------------------------------------------
# Installation des Android Sdk, siehe auch:
# https://docs.snap-ci.com/the-ci-environment/languages/android/
########################################################################################################################

echo "=== reinstall android sdk ==="
# existance of this file indicates that all dependencies were previously installed, and any changes to this file will use a different filename.
INITIALIZATION_FILE="$ANDROID_HOME/.initialized-dependencies-$(git log -n 1 --format=%h -- $0)"

#if [ ! -e ${INITIALIZATION_FILE} ]; then
  # fetch and initialize $ANDROID_HOME
  download-android
  # Use the latest android sdk tools
  echo y | android update sdk --no-ui --filter platform-tools            >/dev/null
  echo y | android update sdk --no-ui --filter tools                     >/dev/null

  # The BuildTools version used by your project
  echo y | android update sdk --no-ui --filter build-tools-20.0.0 --all  >/dev/null

  # The SDK version used to compile your project
  echo y | android update sdk --no-ui --filter android-19 > /dev/null

  # uncomment to install the Extra/Android Support Library
  # echo y | android update sdk --no-ui --filter extra-android-support --all > /dev/null

  # uncomment these if you are using maven/gradle to build your android project
  # echo y | android update sdk --no-ui --filter extra-google-m2repository --all > /dev/null
  # echo y | android update sdk --no-ui --filter extra-android-m2repository --all > /dev/null

  # Specify at least one system image if you want to run emulator tests
  echo y | android update sdk --no-ui --filter sys-img-armeabi-v7a-android-19 --all > /dev/null

  touch ${INITIALIZATION_FILE}
#fi

echo "ANDROID_HOME = $ANDROID_HOME"
