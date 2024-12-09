## Producer

Build and run the first producer.

```bash
cd first-producer
mvn package
java -cp target/first-producer-1.0-SNAPSHOT.jar com.qedcode.App
```

## Customer Producer

Build and run the customer producer.

```bash
cd customer-producer
mvn package
java -cp target/customer-producer-1.0-SNAPSHOT.jar com.qedcode.App
```