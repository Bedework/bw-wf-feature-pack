#!/usr/bin/env bash

DIRNAME=`dirname "$0"`

. "$DIRNAME/bwcommon.sh"

PIDFILE="$TMP_DIR/h2.pid"

if [ -e $PIDFILE ]; then
  printf "Shutting down h2:  "
  kill -15 `cat $PIDFILE`
  rm $PIDFILE
else
  echo "h2 doesn't appear to be running."
fi
