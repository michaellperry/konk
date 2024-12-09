#!/bin/bash

# Check if a project name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <project-name>"
  exit 1
fi

PROJECT_NAME=$1

# Execute the Maven archetype generate command with the provided project name
mvn archetype:generate -DgroupId=com.qedcode -DartifactId=$PROJECT_NAME -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.5 -DinteractiveMode=false

# Add Kafka, Logback, SLF4J dependencies, and maven-shade-plugin to the generated pom.xml
POM_FILE="$PROJECT_NAME/pom.xml"
sed -i '' '/<\/dependencies>/ i\
    <dependency>\
      <groupId>org.apache.kafka</groupId>\
      <artifactId>kafka-clients</artifactId>\
      <version>3.0.0</version>\
    </dependency>\
    <dependency>\
      <groupId>org.slf4j</groupId>\
      <artifactId>slf4j-api</artifactId>\
      <version>1.7.32</version>\
    </dependency>\
    <dependency>\
      <groupId>ch.qos.logback</groupId>\
      <artifactId>logback-classic</artifactId>\
      <version>1.2.6</version>\
    </dependency>' $POM_FILE

sed -i '' '/<\/build>/ i\
    <plugins>\
      <plugin>\
        <groupId>org.apache.maven.plugins</groupId>\
        <artifactId>maven-shade-plugin</artifactId>\
        <version>3.2.4</version>\
        <executions>\
          <execution>\
            <phase>package</phase>\
            <goals>\
              <goal>shade</goal>\
            </goals>\
          </execution>\
        </executions>\
      </plugin>\
    </plugins>' $POM_FILE

# Create resources directory and add kafka.properties and logback.xml files
mkdir -p "$PROJECT_NAME/src/main/resources"

# Add kafka.properties file
cat <<EOL > "$PROJECT_NAME/src/main/resources/kafka.properties"
bootstrap.servers=localhost:9092,localhost:9093,localhost:9094
key.serializer=org.apache.kafka.common.serialization.StringSerializer
value.serializer=org.apache.kafka.common.serialization.StringSerializer
acks=all
EOL

# Add logback.xml file
cat <<EOL > "$PROJECT_NAME/src/main/resources/logback.xml"
<configuration>
    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>%d{yyyy-MM-dd HH:mm:ss} %-5level %logger{36} - %msg%n</pattern>
        </encoder>
    </appender>

    <root level="INFO">
        <appender-ref ref="STDOUT" />
    </root>
</configuration>
EOL