#!/bin/bash

set -o pipefail -e
export PRELAUNCH_OUT="/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001/prelaunch.out"
exec >"${PRELAUNCH_OUT}"
export PRELAUNCH_ERR="/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001/prelaunch.err"
exec 2>"${PRELAUNCH_ERR}"
echo "Setting up env variables"
export JAVA_HOME=${JAVA_HOME:-"/usr/lib/jvm/java-1.8.0-openjdk-amd64"}
export HADOOP_COMMON_HOME=${HADOOP_COMMON_HOME:-"/home/zakari/hadoop-3.2.0"}
export HADOOP_HDFS_HOME=${HADOOP_HDFS_HOME:-"/home/zakari/hadoop-3.2.0"}
export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-"/home/zakari/hadoop-3.2.0/etc/hadoop"}
export HADOOP_YARN_HOME=${HADOOP_YARN_HOME:-"/home/zakari/hadoop-3.2.0"}
export HADOOP_MAPRED_HOME=${HADOOP_MAPRED_HOME:-"/home/zakari/hadoop-3.2.0"}
export HADOOP_TOKEN_FILE_LOCATION="/tmp/hadoop-zakari/nm-local-dir/usercache/zakari/appcache/application_1568562303732_0005/container_1568562303732_0005_01_000001/container_tokens"
export CONTAINER_ID="container_1568562303732_0005_01_000001"
export NM_PORT="36607"
export NM_HOST="zakari-VirtualBox"
export NM_HTTP_PORT="8042"
export LOCAL_DIRS="/tmp/hadoop-zakari/nm-local-dir/usercache/zakari/appcache/application_1568562303732_0005"
export LOCAL_USER_DIRS="/tmp/hadoop-zakari/nm-local-dir/usercache/zakari/"
export LOG_DIRS="/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001"
export USER="zakari"
export LOGNAME="zakari"
export HOME="/home/"
export PWD="/tmp/hadoop-zakari/nm-local-dir/usercache/zakari/appcache/application_1568562303732_0005/container_1568562303732_0005_01_000001"
export JVM_PID="$$"
export MALLOC_ARENA_MAX="4"
export NM_AUX_SERVICE_mapreduce_shuffle="AAA0+gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="
export APPLICATION_WEB_PROXY_BASE="/proxy/application_1568562303732_0005"
export SHELL="/bin/bash"
export CLASSPATH="$PWD:$HADOOP_CONF_DIR:$HADOOP_COMMON_HOME/share/hadoop/common/*:$HADOOP_COMMON_HOME/share/hadoop/common/lib/*:$HADOOP_HDFS_HOME/share/hadoop/hdfs/*:$HADOOP_HDFS_HOME/share/hadoop/hdfs/lib/*:$HADOOP_YARN_HOME/share/hadoop/yarn/*:$HADOOP_YARN_HOME/share/hadoop/yarn/lib/*:$HADOOP_MAPRED_HOME/share/hadoop/mapreduce/*:$HADOOP_MAPRED_HOME/share/hadoop/mapreduce/lib/*:job.jar/*:job.jar/classes/:job.jar/lib/*:$PWD/*"
export APP_SUBMIT_TIME_ENV="1568568726563"
export LD_LIBRARY_PATH="$PWD:$HADOOP_COMMON_HOME/lib/native"
echo "Setting up job resources"
mkdir -p jobSubmitDir
ln -sf "/tmp/hadoop-zakari/nm-local-dir/usercache/zakari/appcache/application_1568562303732_0005/filecache/10/job.splitmetainfo" "jobSubmitDir/job.splitmetainfo"
ln -sf "/tmp/hadoop-zakari/nm-local-dir/usercache/zakari/appcache/application_1568562303732_0005/filecache/13/job.xml" "job.xml"
mkdir -p jobSubmitDir
ln -sf "/tmp/hadoop-zakari/nm-local-dir/usercache/zakari/appcache/application_1568562303732_0005/filecache/12/job.split" "jobSubmitDir/job.split"
ln -sf "/tmp/hadoop-zakari/nm-local-dir/usercache/zakari/appcache/application_1568562303732_0005/filecache/11/job.jar" "job.jar"
echo "Copying debugging information"
# Creating copy of launch script
cp "launch_container.sh" "/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001/launch_container.sh"
chmod 640 "/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001/launch_container.sh"
# Determining directory contents
echo "ls -l:" 1>"/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001/directory.info"
ls -l 1>>"/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001/directory.info"
echo "find -L . -maxdepth 5 -ls:" 1>>"/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001/directory.info"
find -L . -maxdepth 5 -ls 1>>"/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001/directory.info"
echo "broken symlinks(find -L . -maxdepth 5 -type l -ls):" 1>>"/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001/directory.info"
find -L . -maxdepth 5 -type l -ls 1>>"/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001/directory.info"
echo "Launching container"
exec /bin/bash -c "$JAVA_HOME/bin/java -Djava.io.tmpdir=$PWD/tmp -Dlog4j.configuration=container-log4j.properties -Dyarn.app.container.log.dir=/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001 -Dyarn.app.container.log.filesize=0 -Dhadoop.root.logger=INFO,CLA -Dhadoop.root.logfile=syslog  -Xmx1024m org.apache.hadoop.mapreduce.v2.app.MRAppMaster 1>/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001/stdout 2>/home/zakari/hadoop-3.2.0/logs/userlogs/application_1568562303732_0005/container_1568562303732_0005_01_000001/stderr "
