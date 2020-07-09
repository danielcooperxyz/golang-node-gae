FROM golang:1.14

RUN apt-get update -y && \
    apt-get upgrade -y && \ 
    apt-get install build-essential -y

ENV NODE_VERSION v12.18.2
ENV NODE_ARCH linux-x64
ENV GCP_SDK_VERSION google-cloud-sdk-299.0.0-linux-x86_64.tar.gz

RUN wget "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-${NODE_ARCH}.tar.gz" && \
 mkdir -p /usr/local/lib/nodejs && \
 tar -xzf  node-${NODE_VERSION}-${NODE_ARCH}.tar.gz -C /usr/local/lib/nodejs

ENV HOME /root

WORKDIR $HOME

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${GCP_SDK_VERSION}

# RUN ls
RUN tar -xzf ${GCP_SDK_VERSION}

RUN ./google-cloud-sdk/install.sh

ENV PATH=$PATH:$HOME/google-cloud-sdk/bin

WORKDIR /go
