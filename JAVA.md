## Installing Java

On WSL 2

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install openjdk-21-jdk
sudo apt install maven
sudo apt install gradle
```

```bash
$ java --version
openjdk 21.0.5 2024-10-15
OpenJDK Runtime Environment (build 21.0.5+11-Ubuntu-1ubuntu120.04)
OpenJDK 64-Bit Server VM (build 21.0.5+11-Ubuntu-1ubuntu120.04, mixed mode, sharing)
```

## Build and Run Hello World

```bash
cd hello-world
javac HelloWorld.java
java HelloWorld
```

## Create a Maven Project

```bash
mvn archetype:generate -DgroupId=com.qedcode -DartifactId=first-producer -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.5 -DinteractiveMode=false
```