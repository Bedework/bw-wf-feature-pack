#!/usr/bin/env bash

DIRNAME=`dirname "$0"`

. "$DIRNAME/bwcommon.sh"

CIDFILE="$TMP_DIR/osch.cid"

if [ -f "$CIDFILE" ]; then
  printf "Shutting down OpenSearch:  "
  read -r CID<$CIDFILE
  echo "CID=$CID"
  docker stop $CID
  rm $CIDFILE
else
  echo "OpenSearch doesn't appear to be running."
fi
