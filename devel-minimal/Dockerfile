FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu18.04

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    python-dev \
    python-pip \
    python-setuptools \
    python3-dev \
    python3-pip \
    python3-setuptools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip2 install --no-cache-dir \
    cython \
    mock \
    pytest
RUN pip3 install --no-cache-dir \
    cython \
    mock \
    pytest

ARG CHAINER
RUN pip2 install --no-cache-dir \
    chainer==${CHAINER} \
    cupy-cuda92==${CHAINER}
RUN pip3 install --no-cache-dir \
    chainer==${CHAINER} \
    cupy-cuda92==${CHAINER}
