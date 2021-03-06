#!/bin/bash

source conf.sh

cat << EOF > kafka/body.json
{
    "action": "CreateSubmissionRequest",
    "appArgs": ["$KAFKA_BROKER_LIST", "$KAFKA_TOPIC"],
    "appResource": "$KAFKA_JAR_URL",
    "clientSparkVersion": "2.2.0",
    "environmentVariables": {
        "SPARK_SCALA_VERSION": "2.11"
    },
    "mainClass": "Main",
    "sparkProperties": {
        "spark.jars": "$KAFKA_JAR_URL",
        "spark.app.name": "AT-kafka",
        "spark.mesos.executor.docker.image": "$SPARK_IMAGE",
        "spark.mesos.executor.docker.volumes": "/etc/pki/ca-trust/extracted/java/cacerts/:/usr/lib/jvm/jre1.8.0_112/lib/security/cacerts:ro,/etc/resolv.conf:/etc/resolv.conf:ro",
        "spark.driver.supervise": "false",
        "spark.secret.vault.role": "$VAULT_ROLE",
        "spark.mesos.executor.docker.network.name": "$EXECUTOR_CALICO_NETWORK",
        "spark.mesos.driver.docker.network.name": "$DRIVER_CALICO_NETWORK",

        "spark.mesos.driverEnv.SPARK_SECURITY_DATASTORE_ENABLE": "true",
        "spark.mesos.driverEnv.SPARK_SECURITY_DATASTORE_VAULT_CERT_PATH": "/v1/userland/certificates/management",
        "spark.mesos.driverEnv.SPARK_SECURITY_DATASTORE_VAULT_CERT_PASS_PATH": "/v1/userland/passwords/job-gosec-audit/keystore",
        "spark.mesos.driverEnv.SPARK_SECURITY_DATASTORE_VAULT_KEY_PASS_PATH": "/v1/userland/passwords/job-gosec-audit/keystore",
        "spark.mesos.driverEnv.SPARK_SECURITY_DATASTORE_VAULT_TRUSTSTORE_PATH": "/v1/ca-trust/certificates/ca",
        "spark.mesos.driverEnv.SPARK_SECURITY_DATASTORE_VAULT_TRUSTSTORE_PASS_PATH": "/v1/gosec/passwords/sso/sslkey",
        "spark.executorEnv.SPARK_SECURITY_DATASTORE_ENABLE": "true",
        "spark.executorEnv.SPARK_SECURITY_DATASTORE_VAULT_CERT_PATH": "/v1/userland/certificates/management",
        "spark.executorEnv.SPARK_SECURITY_DATASTORE_VAULT_CERT_PASS_PATH": "/v1/userland/passwords/job-gosec-audit/keystore",
        "spark.executorEnv.SPARK_SECURITY_DATASTORE_VAULT_KEY_PASS_PATH": "/v1/userland/passwords/job-gosec-audit/keystore",
        "spark.executorEnv.SPARK_SECURITY_DATASTORE_VAULT_TRUSTSTORE_PATH": "/v1/ca-trust/certificates/ca",
        "spark.executorEnv.SPARK_SECURITY_DATASTORE_VAULT_TRUSTSTORE_PASS_PATH": "/v1/gosec/passwords/sso/sslkey",

        "spark.mesos.driverEnv.VAULT_PROTOCOL": "https",
        "spark.mesos.driverEnv.VAULT_HOSTS": "vault.service.paas.labs.stratio.com",
        "spark.mesos.driverEnv.VAULT_PORT": "8200",

        "spark.mesos.driverEnv.SPARK_SECURITY_MESOS_ENABLE" : "true",
        "spark.mesos.driverEnv.SPARK_SECURITY_MESOS_VAULT_PATH" : "$MESOS_VAULT_PATH",

        "spark.submit.deployMode": "cluster",
        "spark.mesos.role": "$MESOS_ROLE",
        "spark.mesos.executor.home": "/opt/spark/dist",
        "spark.executor.cores": "1",
        "spark.cores.max": "1"
    }
}
EOF
