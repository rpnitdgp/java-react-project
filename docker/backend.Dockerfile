# Use an official OpenJDK runtime as a parent image
FROM openjdk:20-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the Maven wrapper files and pom.xml
COPY ../react-and-spring-data-rest/pom.xml ./
COPY ../react-and-spring-data-rest/.mvn/ ./.mvn/
COPY ../react-and-spring-data-rest/mvnw ./
COPY ../react-and-spring-data-rest/mvnw.cmd ./

# Install the dependencies
RUN ./mvnw dependency:go-offline -B

# Copy the rest of the backend application code (excluding frontend-specific files)
COPY ../react-and-spring-data-rest/src/main/java/ ./src/main/java/
COPY ../react-and-spring-data-rest/src/main/resources/application.properties ./src/main/resources/

# Package the Spring Boot app
RUN ./mvnw package -DskipTests

# Expose the port that Spring Boot is running on
EXPOSE 8080

# Run the Spring Boot app
CMD ["java", "-jar", "./target/react-and-spring-data-rest-0.0.1-SNAPSHOT.jar"]
