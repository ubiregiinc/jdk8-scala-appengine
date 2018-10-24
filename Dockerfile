FROM maven:3-jdk-8
ARG APPENGINE_SDK="appengine-java-sdk-1.9.67"
RUN curl -o /tmp/$APPENGINE_SDK.zip https://storage.googleapis.com/appengine-sdks/featured/$APPENGINE_SDK.zip
RUN apt update && apt install -y apt-transport-https unzip bc
RUN mkdir -p /usr/share/appengine-sdk
RUN unzip -q -d /usr/share/appengine-sdk/ /tmp/$APPENGINE_SDK.zip
ENV APPENGINE_SDK_HOME=/usr/share/appengine-sdk/$APPENGINE_SDK/
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt update && apt install -y scala sbt 
RUN apt update && apt install -y ruby-sass && gem install foreman
