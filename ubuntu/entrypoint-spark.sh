#!/bin/bash

# run master
if [ ${SPARK_MODE} == "master" ]; then
    bash /home/spark/sbin/start-master.sh
fi

sleep 5

# run slave
if [ ${SPARK_MODE} == "slave" ]; then
    bash /home/spark/sbin/start-slave.sh spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} -c ${SPARK_WORKER_CORES} -m ${SPARK_WORKER_MEMORY}
fi