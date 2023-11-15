FROM maven:3.6.3-jdk-8 as build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:8-jdk-alpine
VOLUME /tmp
COPY --from=build /app/target/sample-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
