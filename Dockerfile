FROM ubuntu:18.04
MAINTAINER Cheng (email@email.com)

#Update apt-get & install dependencies
RUN apt-get update &&\
    apt-get install -y sudo git wget make gcc-arm-none-eabi protobuf-compiler libprotobuf-dev python python-pip python3 python3-pip &&\
    pip install protobuf &&\
    pip3 install nanopb trezor mako munch
# Copy scripts into container, set working directory
COPY ./scripts/*.sh /root/

# Set environment parameters
USER root
ENV HOME /root
WORKDIR /root

# Make scripts executable
RUN chmod +x *.sh