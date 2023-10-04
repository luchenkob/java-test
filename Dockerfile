FROM maven:3.6.3-jdk-8
RUN mkdir -p /usr/src/sample
COPY . /usr/src/sample
WORKDIR /usr/src/sample
RUN mvn package -DskipTests
EXPOSE 8080
CMD ["java", "-jar", "target/sample-0.0.1-SNAPSHOT.jar"]