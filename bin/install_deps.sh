#!/usr/bin/env bash
# Install xxhash locally into vendor folder

set -CEeuo pipefail
IFS=$'\n\t'
shopt -s extdebug

VERSION="0.7.0"
ARCHIVE="https://github.com/Cyan4973/xxHash/archive/v$VERSION.tar.gz"

STARTDIR="$PWD"
WORKDIR="$(mktemp -d)"
VENDORDIR="$STARTDIR/vendor"

on_exit(){
  rm -rf "$WORKDIR"
}

trap on_exit EXIT SIGINT

# TODO: add trap for ensuring deletion

wget "$ARCHIVE" -O "$WORKDIR/xxhash.tar.gz"

OS="$(uname -a | awk '{print tolower($1)}')"

(
  cd "$WORKDIR" || exit 1
  tar -xvf xxhash.tar.gz
  cd "xxHash-$VERSION" || exit 1
  make
  cp -f libxx* "$VENDORDIR/"
  case "$OS" in
    darwin)
      # Hack to avoid having to macro this in place when on osx vs linux
      ln -s "$VENDORDIR/libxxhash.$VERSION.dylib" "$VENDORDIR/libxxhash.$VERSION.so" ;;
  esac
)

echo "-> xxhash dependency compiled successfully"
