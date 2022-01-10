#!/usr/bin/env bash

DIRNAME=`dirname "$0"`

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

JBOSS_CONFIG="standalone"
JBOSS_SERVER_DIR="$JBOSS_HOME/$JBOSS_CONFIG"

TMP_DIR="$JBOSS_SERVER_DIR/tmp"

export JBOSS_PIDFILE=$TMP_DIR/bedework.jboss.pid

echo "pidfile=$JBOSS_PIDFILE"

if [ -e $JBOSS_PIDFILE ]; then
  printf "Shutting down jboss:  "
  kill -15 `cat $JBOSS_PIDFILE`
  rm $JBOSS_PIDFILE
else
  echo "jboss doesn't appear to be running."
fi
