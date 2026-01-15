# ---------- Stage 1 : Build ----------
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /build

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests \
 && ls -lh target

# ---------- Stage 2 : Runtime ----------
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copy ANY jar but ensure only one exists
COPY --from=build /build/target/*.jar /app/app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
