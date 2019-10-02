#!/bin/sh
set -eu
so_ext=so
case $(uname) in
Darwin) so_ext=dylib ;;
esac
cd "$(dirname "$0")/logging"
echo "Entering directory '$PWD'"
set -x
chibi-ffi syslog-chibi.stub
${CC:-clang} \
    -std=c99 -Wall -Wextra -Wno-unused-parameter \
    $(pkg-config --libs --cflags chibi-scheme) \
    -fPIC -shared -o syslog-chibi.${so_ext} syslog-chibi.c
