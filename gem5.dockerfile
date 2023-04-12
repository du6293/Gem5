
FROM ubuntu:18.04

# Dockerfile for Gem5 build on Ubuntu 18.04
# (reference: the official Gem5 dockerfile found in gem5.org)

LABEL description="Gem5 on Ubuntu 18.04"

# --------------------------------------
# Installing all required apps
# --------------------------------------
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install build-essential git m4 scons zlib1g zlib1g-dev \
	libprotobuf-dev protobuf-compiler libprotoc-dev libgoogle-perftools-dev \
	python3-dev python-is-python3 libboost-all-dev pkg-config 

# --------------------------------------
# Change links for Python
# --------------------------------------
RUN pip3 install mypy
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10
RUN update-alternatives --install /usr/bin/python python /usr/bin/python2 1


# --------------------------------------
# Installing Gem5 in /root/workspace
# (Please comment out following lines if you DO NOT want to install Gem5 under the current docker image)
# --------------------------------------
#RUN mkdir -p /root/workspace
#WORKDIR /root/workspace
#RUN git clone https://github.com/gem5/gem5.git

## DONE
