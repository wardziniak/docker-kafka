FROM alpine:3.4

MAINTAINER Bartosz Wardzinski <bwardziniak@yahoo.pl>

RUN apk --update add openjdk8-jre
RUN apk --update add bash
ADD http://www-eu.apache.org/dist/kafka/0.10.1.0/kafka_2.11-0.10.1.0.tgz /tmp
RUN tar -xzf /tmp/kafka_2.11-0.10.1.0.tgz -C /tmp
RUN mv /tmp/kafka_2.11-0.10.1.0 /tmp/kafka
RUN mv /tmp/kafka /kafka
COPY server.properties.template /kafka/config/
COPY start.sh /start.sh
RUN mkdir /data

ENV PATH /kafka/bin:$PATH
WORKDIR /kafka

EXPOSE 9092 ${JMX_PORT}
VOLUME [ "/data" ]

CMD ["/start.sh"]

