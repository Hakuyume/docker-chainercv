FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu18.04

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    openssh-client \
    python-dev \
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LO https://bootstrap.pypa.io/get-pip.py \
    && python2 get-pip.py --no-cache-dir \
    && python3 get-pip.py --no-cache-dir \
    && rm get-pip.py

RUN cd $(mktemp -d) \
    && curl -L https://www.open-mpi.org/software/ompi/v3.0/downloads/openmpi-3.0.1.tar.bz2 | tar jxf - \
    && cd openmpi-3.0.1 \
    && ./configure --with-cuda \
    && make -j $(nproc) \
    && make install \
    && rm -rf /tmp/*

COPY --from=hakuyume/python-opencv:ubuntu18.04 /usr/local/lib /usr/local/lib
RUN echo /usr/local/lib/ > /etc/ld.so.conf.d/local.conf \
    && ldconfig

RUN pip2 install --no-cache-dir \
    cython \
    matplotlib==2 \
    mock \
    mpi4py \
    'git+https://github.com/cocodataset/coco.git#egg=pycocotools&subdirectory=PythonAPI' \
    pytest \
    scipy
RUN pip3 install --no-cache-dir \
    cython \
    matplotlib \
    mock \
    mpi4py \
    'git+https://github.com/cocodataset/coco.git#egg=pycocotools&subdirectory=PythonAPI' \
    pytest \
    scipy

ARG CHAINER
RUN [ -z ${CHAINER} ] \
    || pip2 install --no-cache-dir \
    chainer==${CHAINER} \
    cupy-cuda92==${CHAINER}
RUN [ -z ${CHAINER} ] \
    || pip3 install --no-cache-dir \
    chainer==${CHAINER} \
    cupy-cuda92==${CHAINER}
