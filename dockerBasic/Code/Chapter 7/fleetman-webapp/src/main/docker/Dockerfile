FROM openjdk:8u212-jdk-alpine

LABEL maintainer="Richard Chesterwood contact@virtualpairprogrammers.com"  

EXPOSE 8080

WORKDIR /usr/local/bin

COPY maven/fleetman-0.0.1-SNAPSHOT.jar webapp2.jar

CMD ["java","-Dspring.profiles.active=docker-demo","-jar","webapp2.jar"]