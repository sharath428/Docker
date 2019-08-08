#pull base image
#FROM openjdk:8-jdk-alpine

#maintainer 
#MAINTAINER sharath428@gmail.com

#expose port 8080
#EXPOSE 8080

#default command
#CMD java -jar /data/hello-world-0.1.0.jar

#copy hello world to docker image
#COPY ./data/hello-world-0.1.0.jar /data/hello-world-0.1.0.jar





FROM java:8
MAINTAINER Fabiano Góes

LABEL version="1.0"
LABEL description="This is a base image to java application"
LABEL maintainer="fabianogoes@gmail.com"
LABEL date-version="09/01/2018"

ARG JAR_FILE_NAME
VOLUME /tmp
ADD /maven/${JAR_FILE_NAME}.jar app.jar
RUN bash -c 'touch /app.jar'
EXPOSE 8080

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=container","-jar","/app.jar"]
