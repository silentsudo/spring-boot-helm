FROM openjdk:19-ea-11-jdk
WORKDIR /app
COPY build/libs/*.jar web-app.jar
RUN ls -la
CMD ["java", "-jar", "/app/web-app.jar"]
