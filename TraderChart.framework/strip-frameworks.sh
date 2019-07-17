#!/bin/sh

#  strip-frameworks.sh
#  TraderChart
#
#  Created by altonotes on 2019/06/19.
#  Copyright © 2019 altonotes Inc. All rights reserved.

APP_PATH="${TARGET_BUILD_DIR}/${WRAPPER_NAME}"

# This script loops through the frameworks embedded in the application and
# removes unused architectures.
find "$APP_PATH" -name 'TraderChart.framework' -type d | while read -r FRAMEWORK
do
    FRAMEWORK_EXECUTABLE_NAME=$(defaults read "$FRAMEWORK/Info.plist" CFBundleExecutable)
    FRAMEWORK_EXECUTABLE_PATH="$FRAMEWORK/$FRAMEWORK_EXECUTABLE_NAME"
    echo "Executable is $FRAMEWORK_EXECUTABLE_PATH"
    EXTRACTED_ARCHS=()
    EXTRACTED_ARCHNAMES=()

    # Display the original architecture.
    lipo -info "$FRAMEWORK_EXECUTABLE_PATH"

    for ARCH in $VALID_ARCHS
    do
        echo "Extracting $ARCH from $FRAMEWORK_EXECUTABLE_NAME"

        # Extract a specific architecture from the framework.
        lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
        if [ -e "$FRAMEWORK_EXECUTABLE_PATH-$ARCH" ]; then
        EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
        EXTRACTED_ARCHNAMES+=("$ARCH")
        fi
    done

    echo "Merging extracted architectures: ${EXTRACTED_ARCHNAMES[@]}"
    lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"
    rm "${EXTRACTED_ARCHS[@]}"

    echo "Replacing original executable with thinned version"
    rm "$FRAMEWORK_EXECUTABLE_PATH"
    mv "$FRAMEWORK_EXECUTABLE_PATH-merged" "$FRAMEWORK_EXECUTABLE_PATH"

    # Display modified architecture.
    lipo -info "$FRAMEWORK_EXECUTABLE_PATH"

    # If SDK was found in the first loop (destination path), no need to proceed to next loop.
    break
done
