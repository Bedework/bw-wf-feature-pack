#!/usr/bin/env bash

oschimage=opensearchproject/opensearch:${opensearch.version}

echo "About to install docker container $oschimage"

docker pull $oschimage

DIRNAME=`dirname "$0"`

. "$DIRNAME/bwcommon.sh"

oschdatadir=$JBOSS_DATA_DIR/bedework/opensearch

chmod g+rwx $oschdatadir
chgrp 0 $oschdatadir

