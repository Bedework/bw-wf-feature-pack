#!/usr/bin/env bash

echo "About to start h2 process"

DIRNAME=`dirname "$0"`

. "$DIRNAME/bwcommon.sh"

# Set default modular JVM options
setDefaultModularJvmOptions $JAVA_OPTS
JAVA_OPTS="$JAVA_OPTS $DEFAULT_MODULAR_JVM_OPTIONS"

# Override ibm JRE behavior
JAVA_OPTS="$JAVA_OPTS -Dcom.ibm.jsse2.overrideDefaultTLS=true"

PIDFILE="$TMP_DIR/h2.pid"

if [ ! -d "$TMP_DIR" ]; then
  mkdir -p $TMP_DIR
fi

if [ -f "$PIDFILE" ]; then
  printf "Warning: pidfile $PIDFILE exists - trying to shut down running process"
  $DIRNAME/bwstoph2
fi

rm $PIDFILE

BW_DATA_DIR=$JBOSS_DATA_DIR/bedework

exec "$JAVA" $JAVA_OPTS -jar "$JBOSS_HOME"/jboss-modules.jar -mp "${JBOSS_MODULEPATH}" com.h2database.h2/org.h2.tools.Server -tcp -web -baseDir $BW_DATA_DIR/h2 & echo $! >>$PIDFILE "$@"
