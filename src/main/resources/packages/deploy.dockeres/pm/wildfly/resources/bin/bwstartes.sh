#!/usr/bin/env bash

echo "About to start ES docker image"

DIRNAME=`dirname "$0"`
export GREP="grep"

. "$DIRNAME/common.sh"

# OS specific support (must be 'true' or 'false').
cygwin=false;
darwin=false;
case "`uname`" in
    CYGWIN*)
        cygwin=true
        ;;

    Darwin*)
        darwin=true
        ;;
esac

# For Cygwin, ensure paths are in UNIX format before anything is touched
if $cygwin ; then
    [ -n "$JBOSS_HOME" ] &&
        JBOSS_HOME=`cygpath --unix "$JBOSS_HOME"`
    [ -n "$JAVA_HOME" ] &&
        JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
    [ -n "$JAVAC_JAR" ] &&
        JAVAC_JAR=`cygpath --unix "$JAVAC_JAR"`
fi

# Setup JBOSS_HOME
RESOLVED_JBOSS_HOME=`cd "$DIRNAME/.."; pwd`
if [ "x$JBOSS_HOME" = "x" ]; then
    # get the full path (without any relative bits)
    JBOSS_HOME=$RESOLVED_JBOSS_HOME
else
 SANITIZED_JBOSS_HOME=`cd "$JBOSS_HOME"; pwd`
 if [ "$RESOLVED_JBOSS_HOME" != "$SANITIZED_JBOSS_HOME" ]; then
   echo "WARNING JBOSS_HOME may be pointing to a different installation - unpredictable results may occur."
   echo ""
 fi
fi
export JBOSS_HOME

# For Cygwin, switch paths to Windows format before running java
if $cygwin; then
    JBOSS_HOME=`cygpath --path --windows "$JBOSS_HOME"`
fi

JBOSS_CONFIG="standalone"
JBOSS_SERVER_DIR="$JBOSS_HOME/$JBOSS_CONFIG"
JBOSS_DATA_DIR="$JBOSS_SERVER_DIR/data"

esconfig=$JBOSS_SERVER_DIR/configuration/bedework/elasticsearch/config
esimage=docker.elastic.co/elasticsearch/elasticsearch:${elasticsearch.version}
eslog=$JBOSS_SERVER_DIR/log
esdatadir=$JBOSS_DATA_DIR/bedework/elasticsearch/data

TMP_DIR="$JBOSS_SERVER_DIR/tmp"
CIDFILE="$TMP_DIR/es.cid"

if [ ! -d "$TMP_DIR" ]; then
  mkdir -p $TMP_DIR
fi

if [ -f "$CIDFILE" ]; then
  printf "Warning: cidfile $CIDFILE exists - trying to shut down running process"
  $DIRNAME/bwstopes.sh
fi

rm $CIDFILE

docker run -d --cidfile=$CIDFILE -p 9200:9200 -p 9300:9300 --group-add=0 --volume=$esconfig:/usr/share/elasticsearch/config --volume=$esdatadir:/usr/share/elasticsearch/data  --volume=$eslog:/usr/share/elasticsearch/logs $esimage
