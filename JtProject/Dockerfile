# ---------- Stage 1: Build ----------
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /build

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests


# ---------- Stage 2: Runtime ----------
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copy WAR file
COPY --from=build /build/target/*.war /app/app.war

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.war"]
