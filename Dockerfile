# Set the base image
FROM maven:3.6.3-openjdk-8

# Add Maintainer Info
LABEL maintainer="author@example.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Workspace setup
WORKDIR /app

# Copy pom.xml and source code to the container
COPY ./ ./

# Package the application
RUN mvn clean install

# Set the startup command to run your binary
CMD ["java", "-jar", "target/sample-0.0.1-SNAPSHOT.jar"]