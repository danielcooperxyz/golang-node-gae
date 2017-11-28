FROM golang:1.9

RUN apt-get update -y

RUN apt-get upgrade -y

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
&& apt-get install nodejs curl build-essential -y

ENV HOME /root

WORKDIR $HOME

RUN ["wget", "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-180.0.1-linux-x86_64.tar.gz"]
# RUN ls
RUN tar -xzf google-cloud-sdk-180.0.1-linux-x86_64.tar.gz

RUN ./google-cloud-sdk/install.sh

ENV PATH=$PATH:$HOME/google-cloud-sdk/bin

WORKDIR /go
