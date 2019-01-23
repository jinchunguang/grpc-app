#!/bin/bash

# go get -u -v google.golang.org/grpc
# Fetching https://google.golang.org/grpc?go-get=1
# https fetch failed: Get https://google.golang.org/grpc?go-get=1: dial tcp 216.239.37.1:443: i/o timeout
# package google.golang.org/grpc: unrecognized import path "google.golang.org/grpc" (https fetch: Get https://google.golang.org/grpc?go-get=1: dial tcp 216.239.37.1:443: i/o timeout)

# The Go language implementation of gRPC
mkdir -p $GOPATH/src/google.golang.org/ && cd $GOPATH/src/google.golang.org/
wget https://github.com/grpc/grpc-go/archive/master.tar.gz
tar zxvf master.tar.gz && mv grpc-go-master/ grpc

# Go generated proto packages
wget https://github.com/google/go-genproto/archive/master.tar.gz -O ${GOPATH}/src/google.golang.org/genproto.tar.gz
cd ${GOPATH}/src/google.golang.org && tar zxvf genproto.tar.gz && mv go-genproto-master genproto

# Go packages
mkdir -pv $GOPATH/src/golang.org/x
MODULES="crypto net oauth2 sys text tools"
for module in ${MODULES}
do
    wget https://github.com/golang/${module}/archive/master.tar.gz -O ${GOPATH}/src/golang.org/x/${module}.tar.gz
    cd ${GOPATH}/src/golang.org/x && tar zxvf ${module}.tar.gz && mv ${module}-master/ ${module}
done

# Go support for Protocol Buffers
go get -u github.com/golang/protobuf/protoc-gen-go

# install
cd $GOPATH/src && go install google.golang.org/grpc



# 自定义加载，自行选择
go get -u github.com/labstack/gommon/log




