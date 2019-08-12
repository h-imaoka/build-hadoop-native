#!/bin/sh

curl -L https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz | tar -xz -C /tmp
cd /tmp/protobuf-2.5.0
./configure --prefix=/usr
make
make install
cd /
rm -rf /tmp/protobuf-2.5.0
