FROM eclipse-temurin:17-jre-focal
WORKDIR /app
COPY target/devops-demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
LABEL maintainer="Your Name <your.email@example.com>"
LABEL version="1.0"
LABEL description="DevOps Demo Spring Boot Application"
