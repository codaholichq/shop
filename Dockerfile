# Build stage
FROM gradle:7.6-jdk17 AS build
MAINTAINER codaholic.com
EXPOSE 3000

WORKDIR /
COPY . /
RUN gradle clean bootjar

# Package stage
FROM amazoncorretto:17-alpine
COPY --from=build /target/libs/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]
