FROM openjdk:11-jre-slim
ADD jarstaging/com/valaxy/demo-workshop/2.1.4/demo-workshop-2.1.4.jar ttrend.jar
ENTRYPOINT ["java","-jar","ttrend.jar"]
