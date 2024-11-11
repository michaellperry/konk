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
