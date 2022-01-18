#!/bin/sh

DIRNAME=`dirname "$0"`
GREP="grep"

. "$DIRNAME/bwcommon.sh"

# Set default modular JVM options
setDefaultModularJvmOptions $JAVA_OPTS
JAVA_OPTS="$JAVA_OPTS $DEFAULT_MODULAR_JVM_OPTIONS"

# Override ibm JRE behavior
JAVA_OPTS="$JAVA_OPTS -Dcom.ibm.jsse2.overrideDefaultTLS=true"

# Sample JPDA settings for remote socket debugging
#JAVA_OPTS="$JAVA_OPTS -agentlib:jdwp=transport=dt_socket,address=8787,server=y,suspend=n"

LOG_CONF=`echo $JAVA_OPTS | grep "logging.configuration"`
if [ "x$LOG_CONF" = "x" ]; then
    exec "$JAVA" $JAVA_OPTS -Dlogging.configuration=file:"$JBOSS_HOME"/bin/jboss-cli-logging.properties -jar "$JBOSS_HOME"/jboss-modules.jar -mp "${JBOSS_MODULEPATH}" org.bedework.cli.cli-app "$@"
else
    echo "logging.configuration already set in JAVA_OPTS"
    exec "$JAVA" $JAVA_OPTS -jar "$JBOSS_HOME"/jboss-modules.jar -mp "${JBOSS_MODULEPATH}" org.bedework.cli.cli-app "$@"
fi
