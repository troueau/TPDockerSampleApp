FROM ubuntu:16.04

COPY lib/* ./
COPY haarcascades/* ./
COPY pom.xml ./

WORKDIR TPDockerSampleApp

RUN apt-get update &&\
    apt-get install -y openjdk-8-jdk &&\
    apt-get install -y maven &&\
    apt-get install -f libpng16-16 &&\
    apt-get install -f libjasper1 &&\
#RUN apt-get install -f libdc1394-22
    apt-get install -y git &&\
    git clone https://github.com/barais/TPDockerSampleApp &&\
    cd TPDockerSampleApp &&\
    mvn install:install-file -Dfile=./lib/opencv-3410.jar \
     -DgroupId=org.opencv  -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar
RUN apt-get install -y libdc1394-22

WORKDIR /TPDockerSampleApp/TPDockerSampleApp
RUN mvn package

CMD java -Djava.library.path=lib/ubuntuupperthan18/ -jar target/fatjar-0.0.1-SNAPSHOT.jar

EXPOSE 8080