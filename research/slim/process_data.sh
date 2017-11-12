#!/bin/bash
set -e

echo "imagenet code: \"8bG]%4\"\`-k\""
export HOME=/scratch/engstrom/dummy_home
mkdir -p $HOME
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
DATA_DIR=/scratch/engstrom/imagenet-data

rm -rf $DATA_DIR
mkdir -p $DATA_DIR

bazel clean
cd ..
bazel build slim/download_and_convert_imagenet
# run it
cd ..
bazel-bin/research/slim/download_and_convert_imagenet "${DATA_DIR}"
