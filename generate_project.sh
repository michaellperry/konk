#!/bin/bash

# Check if a project name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <project-name>"
  exit 1
fi

PROJECT_NAME=$1

# Execute the Maven archetype generate command with the provided project name
mvn archetype:generate -DgroupId=com.qedcode -DartifactId=$PROJECT_NAME -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.5 -DinteractiveMode=false