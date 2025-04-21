FROM --platform=linux/amd64 eclipse-temurin:21-jdk
COPY ./build/libs/l08_spring_jpa_rest-0.0.1-SNAPSHOT.jar /app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
#docker buildx build --platform linux/amd64 \
 #  -t artistckm/web-app:0.0.0 \
 #  --push .