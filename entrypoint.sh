
#!/bin/bash

SPARK_WORKLOAD=$1

echo "SPARK_WORKLOAD: $SPARK_WORKLOAD"

if [ "$SPARK_WORKLOAD" == "master" ];
then
  start-master.sh -p 7077
elif [ "$SPARK_WORKLOAD" == "worker" ];
then
  start-worker.sh spark://spark-master:7077
elif [ "$SPARK_WORKLOAD" == "history" ]
then
  start-history-server.sh
fi

# The shell script entrypoint.sh contains which shell script the container should run once it starts, 
# depending on the argument provided through the docker-compose file. The whole script is pretty simple, 
# get the workload that we want from the argument and depending on the value, execute the appropriate Spark script:
