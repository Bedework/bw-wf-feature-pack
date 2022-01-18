#!/usr/bin/env bash

echo "About to start OpenSearch docker image"

DIRNAME=`dirname "$0"`

. "$DIRNAME/bwcommon.sh"

oschconfig=$JBOSS_SERVER_DIR/configuration/bedework/opensearch/config
oschimage=opensearchproject/opensearch:${opensearch.version}
oschlog=$JBOSS_SERVER_DIR/log
oschdatadir=$JBOSS_DATA_DIR/bedework/opensearch/data

CIDFILE="$TMP_DIR/osch.cid"

if [ ! -d "$TMP_DIR" ]; then
  mkdir -p $TMP_DIR
fi

if [ -f "$CIDFILE" ]; then
  printf "Warning: cidfile $CIDFILE exists - trying to shut down running process"
  $DIRNAME/bwstoposch.sh
fi

rm $CIDFILE

docker run -d --cidfile=$CIDFILE -p 9200:9200 -p 9300:9300 --group-add=0 --volume=$oschconfig:/usr/share/opensearch/config --volume=$oschdatadir:/usr/share/opensearch/data  --volume=$oschlog:/usr/share/opensearch/logs $oschimage
