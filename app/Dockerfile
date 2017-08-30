# react front-end build
FROM node:latest AS frontend
WORKDIR /usr/src/atsea/app/react-app
COPY app/react-app/package.json .
RUN npm install
COPY . /usr/src/atsea
RUN npm run build

# java back-end build
FROM maven:latest AS backend
WORKDIR /usr/src/atsea
COPY pom.xml .
RUN mvn -B -f pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve
COPY . .
RUN mvn -B -s /usr/share/maven/ref/settings-docker.xml package -DskipTests

# final app image
FROM java:8-jdk-alpine

WORKDIR /static
COPY --from=frontend /usr/src/atsea/app/react-app/build/ .

WORKDIR /app
COPY --from=backend /usr/src/atsea/target/AtSea-0.0.1-SNAPSHOT.jar .

ENTRYPOINT ["java", "-jar", "/app/AtSea-0.0.1-SNAPSHOT.jar"]
CMD ["--spring.profiles.active=sqlserver", "--debug"]

RUN apk --no-cache add curl
HEALTHCHECK --interval=5s --timeout=3s CMD curl --fail http://localhost:8080/health/check || exit 1