#!/usr/bin/env sh

# Setup PROJECT_ID
DOWNLOAD_URL="https://raw.githubusercontent.com/gradle/gradle-wrapper-validation-action/main/release/gradle-wrapper.jar"
mkdir -p gradle/wrapper
if [ ! -f gradle/wrapper/gradle-wrapper.jar ]; then
    curl -sLo gradle/wrapper/gradle-wrapper.jar "$DOWNLOAD_URL"
fi

exec java -Xmx64m -cp gradle/wrapper/gradle-wrapper.jar org.gradle.wrapper.GradleWrapperMain "$@"
