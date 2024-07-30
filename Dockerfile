FROM maven:3-amazoncorretto-17-debian

ENV PATH=$PATH:/root/google-cloud-sdk/bin

RUN set -eux; \
        apt-get update -qq; \
        apt-get install -yq \
            apt-transport-https \
            curl \
            unzip \
            bc \
            python3 \
            scala \
            ruby-sass; \
        gem install foreman; \
        curl -sSL https://sdk.cloud.google.com | bash; \
        gcloud components install app-engine-java beta cloud-datastore-emulator; \
        apt-get clean; \
        rm -rf /var/cache/apt/archives/* \
               /var/lib/apt/lists/* \
               /tmp/*; \
        truncate -s 0 /var/log/*log;

