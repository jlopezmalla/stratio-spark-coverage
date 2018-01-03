#!/bin/bash

#COMMON CONF VARS
SPARK_DISP_URL="https://<CLUSTER_ID>.labs.stratio.com/service/spark-fw/v1/submissions/create"
COOKIE="Cookie: SSOID=s1; dcos-acs-auth-cookie=******; dcos-acs-info-cookie=******"
SPARK_IMAGE="qa.stratio.com/stratio/stratio-spark:2.2.0.3"
EXEC_CALICO_NETWORK="<CALICO_NETWORK>" ## stratio
DRIVER_CALICO_NETWORK="<CALICO_NETWORK>" ## stratio
VAULT_ROLE="<VAULT_ROLE>" ## open
MESOS_ROLE="<MESOS_ROLE>" ## spark-fw
HOST_PORT="<HOST_IP>:8000"
KERBEROS_VAULT_PATH="/v1/userland/kerberos/crossdata-1"
HDFS_FILES_HOST_PORT="<HDFS_FILES_HOST_IP>:8000"
HDFS_STRATIO="hdfs://<HDFS_STRATIO_URL>:<HDFS_STRATIO_PORT>" ## hdfs://10.200.0.74:8020
TEST_ARTIFACTS_VERSION="0.1.0-SNAPSHOT"


#POSTGRES CONF VARS
PG_HOST="pg_0001-<POSTGRES_TLS_INSTANCE_NAME>.service.paas.labs.stratio.com"
PG_PORT="5432"
PG_JAR_URL="http://$HOST_PORT/postgres-$TEST_ARTIFACTS_VERSION.jar"

#ELASTICSEARCH CONF VARS
ES_HOST="coordinator-0-node.<ELASTICSEARCH_INSTANCE_NAME>.mesos"
ES_PORT="31504"
ES_JAR_URL="http://$HOST_PORT/elastic-$TEST_ARTIFACTS_VERSION.jar"

#KAFKA CONF VARS
KAFKA_BROKER_LIST="gosec1.node.paas.labs.stratio.com:9092"
TOPIC="audit"
KAFKA_JAR_URL="http://$HOST_PORT/kafka-$TEST_ARTIFACTS_VERSION.jar"

#HDFS CONF VARS
HDFS_PATH="/spark/test"
HDFS_CONF_URI="http://$HDFS_FILES_HOST_PORT"
HDFS_JAR_URL="http://$HOST_PORT/hdfs-$TEST_ARTIFACTS_VERSION.jar"

#STRUCTURED CONF VARS
STRUCTURED_TOPIC="test"
STRUCTURED_JAR_URL="http://$HOST_PORT/structured-streaming-$TEST_ARTIFACTS_VERSION.jar"

#STREAMING HDFS DYNAMIC ALLOCATION CONF VARS
HDFS_PATH_FILE="hdfs:///tmp/test_qa_1GB.csv"
HDFS_STREAMING_JAR_URL="http://$HOST_PORT/streaming-hdfs-dynamic-$TEST_ARTIFACTS_VERSION.jar"
