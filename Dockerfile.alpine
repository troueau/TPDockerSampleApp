FROM alpine:3.17


RUN apk update && \
    apk add openjdk8 && \
    apk add maven && \
    apk add libpng-dev && \
    apk add gcompat && \
    apk add git && \
    apk add dpkg && \
    apk add curl &&  \
    apk add cmake

RUN git clone https://github.com/barais/TPDockerSampleApp

WORKDIR /TPDockerSampleApp


RUN mvn install:install-file -Dfile=./lib/opencv-3410.jar \
     -DgroupId=org.opencv  -DartifactId=opencv -Dversion=3.4.10 -Dpackaging=jar


RUN  mvn package
     

CMD [ "java", "-Djava.library.path=lib/ubuntuupperthan18/", "-jar", \
    "target/fatjar-0.0.1-SNAPSHOT.jar" ]

EXPOSE 8080