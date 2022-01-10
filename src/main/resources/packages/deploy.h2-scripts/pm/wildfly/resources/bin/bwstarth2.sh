#!/usr/bin/env bash

echo "About to start h2 process"

DIRNAME=`dirname "$0"`
GREP="grep"

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

if [ "x$JBOSS_MODULEPATH" = "x" ]; then
    JBOSS_MODULEPATH="$JBOSS_HOME/modules"
fi

# Setup the JVM
if [ "x$JAVA" = "x" ]; then
    if [ "x$JAVA_HOME" != "x" ]; then
        JAVA="$JAVA_HOME/bin/java"
    else
        JAVA="java"
    fi
fi

# Set default modular JVM options
setDefaultModularJvmOptions $JAVA_OPTS
JAVA_OPTS="$JAVA_OPTS $DEFAULT_MODULAR_JVM_OPTIONS"

# For Cygwin, switch paths to Windows format before running java
if $cygwin; then
    JBOSS_HOME=`cygpath --path --windows "$JBOSS_HOME"`
    JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`
    JBOSS_MODULEPATH=`cygpath --path --windows "$JBOSS_MODULEPATH"`
fi

# Override ibm JRE behavior
JAVA_OPTS="$JAVA_OPTS -Dcom.ibm.jsse2.overrideDefaultTLS=true"

JBOSS_CONFIG="standalone"
JBOSS_SERVER_DIR="$JBOSS_HOME/$JBOSS_CONFIG"
JBOSS_DATA_DIR="$JBOSS_SERVER_DIR/data"

TMP_DIR="$JBOSS_SERVER_DIR/tmp"
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
