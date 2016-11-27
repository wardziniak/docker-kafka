# Lightweight Kafka Docker Image

### Summary


This is lightweight Kafka Docker image. Size of this image is less about 250MB (259.5 MB). If you compare with other images with Apache Kafka it is about 400MB less. Using this image you can configure cluster of Kafka brokers.

### How to run

To start Kafka broker use following command. Bellow is description of the command

```{r, engine='bash', code_block_name}
docker run -d --name kafka1 -p 9092:9092 --env ZOOKEEPER_IP=192.168.1.13 --env KAFKA_BROKER_ID=0 --env KAFKA_PORT=9092 --env KAFKA_ADVERTISED_PORT=9092 --env KAFKA_ADVERTISED_HOST_NAME=192.168.1.13 --volume /Users/wardziniak/data/kafka1-log:/data wardziniak/kafka
```

#### Parameter explanation:


### How to build
