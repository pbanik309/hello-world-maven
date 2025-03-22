# Use the official OpenJDK image as a base
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the compiled JAR file into the container
COPY target/hello-world-1.0-SNAPSHOT.jar /app/hello-world.jar

# Run the JAR file
ENTRYPOINT ["java", "-jar", "/app/hello-world.jar"]
