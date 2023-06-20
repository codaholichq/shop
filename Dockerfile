# Build stage
FROM gradle:7.6-jdk17 AS build
MAINTAINER codaholic.com
WORKDIR /
COPY . /
RUN gradle clean bootJar

# Package stage
FROM amazoncorretto:17-alpine
COPY --from=build /target/libs/*.jar app.jar
EXPOSE 80
ENTRYPOINT ["java","-jar","app.jar"]
