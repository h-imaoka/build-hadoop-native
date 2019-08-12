FROM debian:buster
MAINTAINER himaoka

USER root

# install dev tools
RUN apt update; \
    apt install -y curl tar; \
    apt install -y build-essential autoconf automake libtool zlib1g-dev libssl-dev git pkg-config java-common cmake maven

# java runtime (corretto)
RUN curl -LO 'https://d3pxv6yz143wms.cloudfront.net/8.222.10.1/java-1.8.0-amazon-corretto-jdk_8.222.10-1_amd64.deb'; \
    dpkg --install java-1.8.0-amazon-corretto-jdk_8.222.10-1_amd64.deb; \
    update-alternatives --config javac; \
    rm java-1.8.0-amazon-corretto-jdk_8.222.10-1_amd64.deb
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-amazon-corretto

# protobuf
RUN curl -LO https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz; \
    tar -xzf protobuf-2.5.0.tar.gz -C /tmp; \
    rm protobuf-2.5.0.tar.gz; \
    cd /tmp/protobuf-2.5.0; \
    ./configure --prefix=/usr; \
    make; \
    make install

ENV HADOOP_VER 3.1.2
# hadoop
RUN curl -LO https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VER/hadoop-$HADOOP_VER-src.tar.gz; \
    tar zxf hadoop-$HADOOP_VER-src.tar.gz -C /tmp; \
    rm hadoop-$HADOOP_VER-src.tar.gz; \
    cd /tmp/hadoop-$HADOOP_VER-src; \
    mvn package -Pdist,native -DskipTests -Dtar

RUN mv /tmp/hadoop-$HADOOP_VER-src/hadoop-dist/target/hadoop-$HADOOP_VER/lib/native /; \
    rm -rf /tmp/hadoop-$HADOOP_VER-src; \
    rm -rf /tmp/protobuf-2.5.0
