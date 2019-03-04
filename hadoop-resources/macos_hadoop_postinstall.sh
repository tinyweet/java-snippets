#!/usr/bin/env bash

# run `brew install apache-spark` firstly.

set -x

: ${HADOOP_PWD:=/usr/local/Cellar/hadoop/3.1.1}

cat << EOF > ~/.ssh/config
Host *
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
EOF

cat ~/.ssh/id_rsa.pub >> ~/.ssh/known_hosts

cp -f core-site.xml ${HADOOP_PWD}/libexec/etc/hadoop/core-site.xml

mkdir ~/hadoop

cp -f hdfs-site.xml ${HADOOP_PWD}/libexec/etc/hadoop/hdfs-site.xml

hdfs namenode -format

echo 'export PATH="/usr/local/sbin:/usr/local/Cellar/hadoop/3.1.1/libexec/etc/hadoop/:$PATH"' >> ~/.bash_profile

cp -f mapred-site.xml ${HADOOP_PWD}/libexec/etc/hadoop/mapred-site.xml

cp ${HADOOP_PWD}/libexec/share/hadoop/tools/sls/sample-conf/yarn-site.xml ${HADOOP_PWD}/libexec/etc/hadoop/yarn-site.xml

chmod a+x ${HADOOP_PWD}/libexec/etc/hadoop/*.sh

export PATH="/usr/local/sbin:${HADOOP_PWD}/libexec/etc/hadoop/:${PATH}"

start-dfs.sh

hdfs dfsadmin -safemode leave

hdfs dfs -mkdir -p `echo ~`/input

stop-dfs.sh