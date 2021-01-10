FROM maven:3-jdk-8
RUN apt update && apt install -y apt-transport-https unzip bc
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt update && apt install -y scala
RUN apt update && apt install -y ruby-sass && gem install foreman
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH=$PATH:/root/google-cloud-sdk/bin
RUN gcloud components install app-engine-java beta cloud-datastore-emulator
