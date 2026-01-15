# ---------- Stage 1: Build ----------
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /build

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests \
 && ls target \
 && cp target/*.jar /build/app.jar


# ---------- Stage 2: Runtime ----------
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

COPY --from=build /build/app.jar /app/app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
