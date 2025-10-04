# Simple runtime image using pre-built artifacts
FROM eclipse-temurin:8-jre-alpine

WORKDIR /app

# Copy the compiled classes (must be built locally first with: mvn clean compile)
COPY target/classes ./target/classes

# Set the entrypoint to run java directly
ENTRYPOINT ["java", "-cp", "/app/target/classes", "lox.Lox"]
