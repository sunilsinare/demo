FROM openjdk:23
EXPOSE 8081
ADD target/demojen.jar demojen.jar
ENTRYPOINT ["java", "-jar", "demojen.jar"]