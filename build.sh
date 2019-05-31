#! /usr/bin/env sh
set -eu

TEMP=$(mktemp -d)
git clone https://github.com/chainer/chainercv.git ${TEMP}/
git -C ${TEMP}/ checkout master -b latest

for CHAINERCV in latest v0.13.0
do
    git -C ${TEMP}/ checkout ${CHAINERCV}
    docker build ${TEMP}/.pfnci/docker/devel/ -t chainer/chainercv:${CHAINERCV}-devel
    docker build . --build-arg CHAINERCV=${CHAINERCV} -t chainer/chainercv:${CHAINERCV}
    docker push chainer/chainercv:${CHAINERCV}
done

rm -rf ${TEMP}
