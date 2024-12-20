# Setup a Spark Cluster with docker

??? note "Work in Progress"

    Please note that the notebook you are referring to is currently a work in progress and may continue to be under development for an extended period. This ongoing process ensures that the content remains up-to-date and relevant, reflecting the latest information and research. As such, some sections may be incomplete or subject to change.

Spark working environment.
Setup a spark cluster for data processing and connect a jupyter lab instance, all using docker containers.
Can scale the cluster with how many nodes you want and can setup each worker as needed (number of cores and memory).
To add a worker or manager yours workers change file "docker-compose.yml"

## Build images

Build required images: spark-cluster and spark-jupyterlab

### Setup environment variables

Specify software stack versions

```bash
JAVA_VERSION="11"
SPARK_VERSION="3.2.1"
HADOOP_VERSION="3.2"
PYTHON_VERSION="3.9"
JUPYTERLAB_VERSION="3.2.9"
IMAGE_TAG="java${JAVA_VERSION}-spark${SPARK_VERSION}-hadoop${HADOOP_VERSION}"
```

### Spark image

#### Spark startup script

File `start-spark.sh` to startup diferent spark nodes

```bash
#!/bin/bash

if [ "$SPARK_WORKLOAD" == "master" ]; then

# When the spark work_load is master run spark-class org.apache.spark.deploy.master.Master
cd /opt/spark/bin && ./spark-class org.apache.spark.deploy.master.Master --ip $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT --webui-port $SPARK_MASTER_WEBUI_PORT >> $SPARK_MASTER_LOG

elif [ "$SPARK_WORKLOAD" == "worker" ]; then

# When the spark work_load is worker run spark-class org.apache.spark.deploy.master.Worker
cd /opt/spark/bin && ./spark-class org.apache.spark.deploy.worker.Worker spark://${SPARK_MASTER_HOST}:${SPARK_MASTER_PORT} --webui-port $SPARK_WORKER_WEBUI_PORT >> $SPARK_WORKER_LOG

else
    echo "Undefined Workload Type $SPARK_WORKLOAD, must specify: master, worker"
fi
```

#### Dockerfile

Create a `Dockerfile` with:

```dockerfile
ARG debian_buster_image_tag=11-jre-slim

# builder step used to download and configure environment
FROM openjdk:${debian_buster_image_tag} as builder

ARG spark_version=3.2.1
ARG hadoop_version=3.2
ARG python_version=3.9

# Add Dependencies for PySpark
RUN apt-get update -y && \
    apt-get install -y curl && \
    apt-get install -y python${python_version} && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

ENV SHARED_WORKSPACE=/opt/workspace \
    SPARK_HOME=/opt/spark \
    PYTHONHASHSEED=1

VOLUME /opt/workspace

# Download and uncompress spark from the apache archive
RUN mkdir -p /opt/spark && \
    curl "https://archive.apache.org/dist/spark/spark-${spark_version}/spark-${spark_version}-bin-hadoop${hadoop_version}.tgz" -o spark.tgz && \
    tar -xf spark.tgz -C /opt/spark --strip-components=1 && \
    rm spark.tgz

# Apache spark environment
FROM builder as spark-cluster

WORKDIR /opt/spark

ENV SPARK_MASTER_HOST=spark-master \
    SPARK_MASTER_PORT=7077 \
    SPARK_MASTER_WEBUI_PORT=8080 \
    SPARK_WORKER_WEBUI_PORT=8080 \
    SPARK_LOG_DIR=/opt/spark/logs \
    SPARK_MASTER_LOG=/opt/spark/logs/spark-master.out \
    SPARK_WORKER_LOG=/opt/spark/logs/spark-worker.out \
    SPARK_WORKLOAD="master" \
    PYSPARK_PYTHON=python3

EXPOSE 8080 7077

# Build log storage
RUN mkdir -p $SPARK_LOG_DIR && \
    touch $SPARK_MASTER_LOG && \
    touch $SPARK_WORKER_LOG && \
    ln -sf /dev/stdout $SPARK_MASTER_LOG && \
    ln -sf /dev/stdout $SPARK_WORKER_LOG

# File to startup diferent spark nodes
COPY /start-spark.sh /

CMD ["/bin/bash", "/start-spark.sh"]
```

#### Docker build

run command

```bash
$ docker build \
  --build-arg debian_buster_image_tag="${JAVA_VERSION}-jre-slim" \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  --build-arg python_version="${PYTHON_VERSION}" \
  -f spark-cluster.Dockerfile \
  -t spark-cluster:"${IMAGE_TAG}" .
```

### Jupyterlab image

#### Dockerfile

Create a `Dockerfile` with:

```dockerfile
ARG base_image

FROM spark-cluster:${base_image}

ARG jupyterlab_version=3.2.9
ARG spark_version=3.2.1

RUN apt-get update -y && apt-get clean
RUN apt-get install -y python3-pip
RUN /usr/bin/python3 -m pip install --upgrade pip
RUN pip3 install pip-tools jupyterlab==${jupyterlab_version} pyspark==${spark_version}

ENV PIP_DISABLE_PIP_VERSION_CHECK=1

EXPOSE 8888

WORKDIR ${SHARED_WORKSPACE}

CMD jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=
```

#### Docker build

run command

```bash
$ docker build \
  --build-arg base_image="${IMAGE_TAG}" \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" \
  -f jupyterlab.Dockerfile \
  -t spark-jupyterlab:"py${PYTHON_VERSION}-jupyterlab${JUPYTERLAB_VERSION}-spark${SPARK_VERSION}" .
```

## Use compose

Create a `compose.yaml` file

```yaml
name: spark-cluster
services:
  spark-master:
  image: spark-cluster:java11-spark3.2.1-hadoop3.2
    container_name: spark-master
    environment:
      - SPARK_WORKLOAD=master
      - SPARK_LOCAL_IP=spark-master
    ports:
      - 7080:8080
      - 7077:7077
    volumes:
      - ./:/opt/workspace

  spark-worker-1:
    image: spark-cluster:java11-spark3.2.1-hadoop3.2
    container_name: spark-worker-1
    environment:
      - SPARK_WORKLOAD=worker
      - SPARK_LOCAL_IP=spark-worker-1
      - SPARK_WORKER_CORES=2
      - SPARK_WORKER_MEMORY=2G
      - SPARK_DRIVER_MEMORY=2G
      - SPARK_EXECUTOR_MEMORY=2G
    ports:
      - 7081:8081
    volumes:
      - ./:/opt/workspace
    depends_on:
      - spark-master

  spark-worker-2:
    image: spark-cluster:java11-spark3.2.1-hadoop3.2
    container_name: spark-worker-2
    environment:
      - SPARK_WORKLOAD=worker
      - SPARK_LOCAL_IP=spark-worker-2
      - SPARK_WORKER_CORES=2
      - SPARK_WORKER_MEMORY=2G
      - SPARK_DRIVER_MEMORY=2G
      - SPARK_EXECUTOR_MEMORY=2G
    ports:
      - 7082:8081
    volumes:
      - ./:/opt/workspace
    depends_on:
      - spark-master

  jupyterlab:
    image: spark-jupyterlab:py3.9-jupyterlab3.2.9-spark3.2.1
    container_name: spark-jupyterlab
    ports:
      - 7888:8888
    volumes:
      - ./:/opt/workspace
```

run the stack

```bash
$ docker compose up -d
```

## Use spark cluster

Open `htttp://localhost:7888` on browser

```python
from pyspark.sql import SparkSession

spark = (
    SparkSession
    .builder
    .appName("pyspark-notebook")
    .master("spark://spark-master:7077")
    .config("spark.executor.memory", "1024m")
    .getOrCreate()
)
```
