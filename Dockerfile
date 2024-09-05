# 1. Choose a Base Image with JDK to compile and run Java
FROM openjdk:17-jdk-slim

# 2. Set the Working Directory
WORKDIR /app

# 3. Copy JAR Files to the Container
COPY out/libs/hotelBookingSystem-V1.jar /app/hotelBookingSystem-V1.jar
# 4. Copy Text Files to the Container
COPY availablerooms.txt /app/availablerooms.txt
COPY userinfo.txt /app/userinfo.txt
COPY getNameOfUserWithValid.txt /app/getNameOfUserWithValid.txt
COPY setRoomsWishToBookWithValid.txt /app/setRoomsWishToBookWithValid.txt
COPY waitinglist.txt /app/waitinglist.txt

# 5. Run the Compiled Java Program
CMD ["java", "-jar", "hotelBookingSystem-V1.jar"]
