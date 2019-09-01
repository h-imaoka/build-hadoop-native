FROM debian:buster
MAINTAINER himaoka

USER root

# install dev tools
RUN apt update; \
    apt install -y curl tar; \
    apt install -y build-essential autoconf automake libtool zlib1g-dev libssl-dev git pkg-config java-common cmake maven libsnappy-dev libzstd-dev libisal-dev libbz2-dev

# java runtime (corretto)
RUN curl -LO 'https://d3pxv6yz143wms.cloudfront.net/8.222.10.1/java-1.8.0-amazon-corretto-jdk_8.222.10-1_amd64.deb'; \
    dpkg --install java-1.8.0-amazon-corretto-jdk_8.222.10-1_amd64.deb; \
    update-alternatives --config javac; \
    rm java-1.8.0-amazon-corretto-jdk_8.222.10-1_amd64.deb
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-amazon-corretto

# protobuf
ADD protobuf.sh /
RUN /protobuf.sh

ENV HADOOP_VER 3.1.2
# hadoop
ADD hadoop-native.sh /
RUN /hadoop-native.sh
