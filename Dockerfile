ARG CHAINERCV
FROM chainer/chainercv:${CHAINERCV}-devel

RUN pip2 install --no-cache-dir \
    chainer \
    cupy-cuda92 \
    && pip3 install --no-cache-dir \
    chainer \
    cupy-cuda92

ARG CHAINERCV
RUN git clone https://github.com/chainer/chainercv.git /opt/chainercv \
    $([ ${CHAINERCV} = latest ] || echo --branch=${CHAINERCV})
RUN pip2 install --editable /opt/chainercv/ \
    && pip3 install --editable /opt/chainercv/
