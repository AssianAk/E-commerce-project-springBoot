# ---------- Stage 1: Build ----------
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /build

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# ---------- Stage 2: Runtime ----------
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# Copy ALL jars to /app
COPY --from=build /build/target/*.jar /app/

# Run the Spring Boot jar (ignore .original)
ENTRYPOINT ["sh","-c","java -jar $(ls /app/*.jar | grep -v original)"]

EXPOSE 8080
