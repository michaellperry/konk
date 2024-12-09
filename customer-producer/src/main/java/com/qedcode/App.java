package com.qedcode;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Hello world!
 */
public class App {
    private static final Logger logger = LoggerFactory.getLogger(App.class);

    public static void main(String[] args) {
        Properties kafkaProps = new Properties();
        try (FileInputStream fis = new FileInputStream("src/main/resources/kafka.properties")) {
            kafkaProps.load(fis);
        } catch (IOException e) {
            logger.error("Error loading Kafka properties", e);
            return;
        }

        Producer<String, Customer> producer = new KafkaProducer<>(kafkaProps);
        logger.info("Kafka producer initialized");
        ProducerRecord<String, Customer> record = new ProducerRecord<>("BinaryCustomer", "Precision Products",
                new Customer(123, "John Doe"));
        try {
            producer.send(record);
            logger.info("Message sent successfully");
        } catch (Exception e) {
            logger.error("Error sending message", e);
        } finally {
            producer.close();
        }
    }
}
