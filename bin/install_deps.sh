#!/usr/bin/env bash
# Download, unpack, make, copy .o into place

set -CEeuo pipefail
IFS=$'\n\t'
shopt -s extdebug

VERSION="0.7.0"
ARCHIVE="https://github.com/Cyan4973/xxHash/archive/v$VERSION.tar.gz"

set -x

START_DIR="$PWD"
WORKDIR="$(mktemp -d)"

# TODO: add trap for ensuring deletion

wget "$ARCHIVE" -O "$WORKDIR/xxhash.tar.gz"

OS="$(uname -a | awk '{print tolower($1)}')"

# On mac copy dylib into .so
# On linux copy so
(
  cd "$WORKDIR" || exit 1
  tar -xvf xxhash.tar.gz
  cd "xxHash-$VERSION" || exit 1
  make
  ls -lah .
  cp -f "libxx*" "$START_DIR/vendor/"
  case "$OS" in
    darwin)
      cp -f "libxxhash.$VERSION.dylib" "$START_DIR/vendor/libxxhash.$VERSION.so" ;;
    *)
      cp -f "libxxhash.$VERSION.so" "$START_DIR/vendor/" ;;
  esac
)

rm -rf "$WORKDIR"
