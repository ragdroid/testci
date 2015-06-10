#Fix the circleCI path
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"

DEPS="$ANDROID_HOME/installed-dependencies"

if [ ! -e $DEPS ]; then
  cp -r /usr/local/android-sdk-linux $ANDROID_HOME &&
  echo y | android update sdk -u -a -t android-22 &&
  echo y | android update sdk -u -a -t platform-tools &&
  echo y | android update sdk -u -a -t build-tools-22.0.1 &&
  echo y | android update sdk -u -a -t sys-img-x86-android-18 &&
  echo y | android update sdk --filter extra-android-support --no-ui --force &&
  echo y | android update sdk --filter extra-android-m2repository --no-ui --force &&
touch $DEPS
fi
