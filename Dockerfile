FROM ubuntu:18.04

RUN apt update
RUN apt install -y build-essential cmake

RUN apt install -y libeigen3-dev libfmt-dev
# 1. manually install sophus from source
COPY ./3rdparty/Sophus /3rdparty/Sophus
RUN cd ./3rdparty/Sophus; mkdir build; cd build; cmake ..; make -j; make install

RUN apt install -y libgl1-mesa-dev libglew-dev
# 2. manually install pangolin from source
COPY ./3rdparty/Pangolin /3rdparty/Pangolin
RUN cd /3rdparty/Pangolin; mkdir build; cd build; cmake ..; make -j; make install

ENV DEBIAN_FRONTEND=noninteractive
RUN apt install -y libopencv-dev

# 3. manually install g2o from source
COPY ./3rdparty/g2o /3rdparty/g2o
RUN cd /3rdparty/g2o; mkdir build; cd build; cmake ..; make -j; make install

WORKDIR /workspace
