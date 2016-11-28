# Lightweight Kafka Docker Image

### Summary


This is lightweight Kafka Docker image. Size of this image is  about 250MB (259.5 MB). If you compare with other images with Apache Kafka it is about 400MB less. Using this image you can configure cluster of Kafka brokers.
Image conatins Apache Kafka 0.10.1.0 version

### How to run

Kafka needs Zookeeper, so first you have to start zookeeper:

`docker run -d --name zookeeper -p 2181:2181 jplock/zookeeper:3.4.9`

To start Kafka broker use following command:

`docker run -d --name kafka1 -p 9092:9092 --env ZOOKEEPER_IP=192.168.1.13 --env KAFKA_BROKER_ID=0 --env KAFKA_PORT=9092 --env KAFKA_ADVERTISED_PORT=9092 --env KAFKA_ADVERTISED_HOST_NAME=192.168.1.13 --volume /Users/wardziniak/data/kafka1-log:/data wardziniak/kafka`

#### Parameter explanation:

- `-p 9092:9092`

    Mapping port from docker host to docker container. All request, that come to machine that is host of docker to port 9092 will be mapped to container port 9092. Number befor colon is host port, number after colon is container port 
- `KAFKA_BROKER_ID=0`

  Id of broker. Have to be unique within the Kafka cluster
- `KAFKA_PORT=9092`

  Same port as in -p option - inside container port - number after colon
- `KAFKA_ADVERTISED_PORT=9092`

  Same port as in -p option - docker host port - number befor colon
- `KAFKA_ADVERTISED_HOST_NAME=192.168.1.13`
  Should IP address of docker host machine
- `--volume /Users/wardziniak/data/kafka1-log:/data`
  If Kafka data need to be persist externally. Value before colon (/Users/wardziniak/data/kafka1-log) should be change to path at local machine, where logs will be kept. Can be ommited
- `--name kafka1`
  Container name
  
To Start Cluster of Apache Kafka use following commands
`docker run -d --name kafka1 -p 9092:9092 --env ZOOKEEPER_IP=192.168.1.13 --env KAFKA_BROKER_ID=0 --env KAFKA_PORT=9092 --env KAFKA_ADVERTISED_PORT=9092 --env KAFKA_ADVERTISED_HOST_NAME=192.168.1.13 --volume /Users/wardziniak/data/kafka1-log:/data wardziniak/kafka`

`docker run -d --name kafka2 -p 9093:9093 --env ZOOKEEPER_IP=192.168.1.13 --env KAFKA_BROKER_ID=1 --env KAFKA_PORT=9093 --env KAFKA_ADVERTISED_PORT=9093 --env KAFKA_ADVERTISED_HOST_NAME=192.168.1.13 --volume /Users/wardziniak/data/kafka2-log:/data wardziniak/kafka`

`docker run -d --name kafka3 -p 9094:9094 --env ZOOKEEPER_IP=192.168.1.13 --env KAFKA_BROKER_ID=2 --env KAFKA_PORT=9094 --env KAFKA_ADVERTISED_PORT=9094 --env KAFKA_ADVERTISED_HOST_NAME=192.168.1.13 --volume /Users/wardziniak/data/kafka3-log:/data wardziniak/kafka`

Notice
- For whole cluster values of KAFKA_BROKER_ID have to be unique
- If brokers are on the same machine: KAFKA_ADVERTISED_PORT and value for -p before colon have to be unique 

### How to build

To build container from scratch

- Download files from repository
- Run following command: 

```docker build -t wardziniak/kafka .```
