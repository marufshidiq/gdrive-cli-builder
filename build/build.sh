#!/bin/bash

APP_NAME="gdrive"

BIN_PATH="_release/bin"

PLATFORM=$1

GOOS=${PLATFORM%/*}
GOARCH=${PLATFORM#*/}
BIN_NAME="${APP_NAME}-${GOOS/darwin/osx}-${GOARCH/amd64/x64}"

if [ $GOOS == "windows" ]; then
    BIN_NAME="${BIN_NAME}.exe"
fi

# Raspberrypi seems to need arm5 binaries
if [ $GOARCH == "rpi" ]; then
    export GOARM=5
    GOARCH="arm"
else
    unset GOARM
fi

if [ $GOARCH == "mips" ] || [ $GOARCH == "mipsle" ]; then
    export GOMIPS=softfloat
else
    unset GOMIPS
fi

export GOOS=$GOOS
export GOARCH=$GOARCH

echo "Building $BIN_NAME"
go build -ldflags '-w -s' -o ${BIN_PATH}/${BIN_NAME}
