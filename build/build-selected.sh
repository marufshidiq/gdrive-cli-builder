#!/bin/bash
PLATFORMS=(darwin/386 darwin/amd64 darwin/arm darwin/arm64 dragonfly/amd64 freebsd/386 freebsd/amd64 freebsd/arm linux/386 linux/amd64 linux/arm linux/arm64 linux/ppc64 linux/ppc64le linux/mips linux/mipsle linux/mips64 linux/mips64le linux/rpi netbsd/386 netbsd/amd64 netbsd/arm openbsd/386 openbsd/amd64 openbsd/arm plan9/386 plan9/amd64 solaris/amd64 windows/386 windows/amd64)
LIST="list.txt"
BIN_PATH="_release/bin"
mkdir $BIN_PATH

build=0
if [ -f $LIST ]
then
  echo "File list.txt found"
  while IFS= read -r platform
  do
    for i in "${PLATFORMS[@]}"
    do
      if [ "$i" == "$platform" ] ; then
        ./build.sh $platform
        ((build=build+1))
      fi
    done
  done < "$LIST"
fi

if [ $build -eq 0 ]
then
  echo "No platform detected"
  exit 1
fi