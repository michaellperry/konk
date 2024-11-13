# Running Kafka on Docker

Start the Kafka cluster by running `start.sh`.
This script will use Docker Compose to start the Kafka cluster.

## Creating a topic

List the topics by running the following command:

```bash
docker exec -it konk-kafka3-1 kafka-topics --list --bootstrap-server localhost:9092
```

To create a topic, run the following command:

```bash
docker exec -it konk-kafka3-1 kafka-topics --create --topic poems --bootstrap-server localhost:9092 --replication-factor 3 --partitions 3
```

## Publishing messages

To publish messages to the `poems` topic, run the following command:

```bash
docker exec -it konk-kafka3-1 kafka-console-producer --topic poems --bootstrap-server localhost:9092
```

To exit, press `Ctrl+C`.

## Consuming messages

To consume messages from the `poems` topic, run the following command:

```bash
docker exec -it konk-kafka3-1 kafka-console-consumer --topic poems --bootstrap-server localhost:9092 --from-beginning
```

To exit, press `Ctrl+C`.

## Observing partitions

To observe the partitions of the `poems` topic, run the following command:

```bash
docker exec -it konk-kafka3-1 kafka-topics --describe --topic poems --bootstrap-server localhost:9092
```

It outputs something like this:

```
Topic: poems	TopicId: 2kUd5NMySD2g8uCxbpLVKA	PartitionCount: 3	ReplicationFactor: 3	Configs: min.insync.replicas=2
	Topic: poems	Partition: 0	Leader: 2	Replicas: 2,3,1	Isr: 2,3,1
	Topic: poems	Partition: 1	Leader: 3	Replicas: 3,1,2	Isr: 3,1,2
	Topic: poems	Partition: 2	Leader: 1	Replicas: 1,2,3	Isr: 1,2,3
```

## Examining Zookeeper

Look at how Zookeeper is configured by running this command from a terminal on the host:

```bash
echo srvr | nc localhost 2181
```

The result will be something like this:

```
Zookeeper version: 3.8.4-9316c2a7a97e1666d8f4593f34dd6fc36ecc436c, built on 2024-02-12 22:16 UTC
Latency min/avg/max: 0/0.8358/14
Received: 403
Sent: 406
Connections: 3
Outstanding: 0
Zxid: 0x1ab
Mode: standalone
Node count: 141
```