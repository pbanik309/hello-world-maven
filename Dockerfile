FROM openjdk:11-jre-slim

WORKDIR /app

COPY target/hello-world-1.0-SNAPSHOT.jar /app/hello-world.jar

ENTRYPOINT ["java", "-jar", "/app/hello-world.jar"]
