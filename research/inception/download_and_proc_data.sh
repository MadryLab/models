#!/bin/bash
echo "imagenet code: \"8bG]%4\"\`-k\""
export HOME=/scratch/engstrom/dummy_home
mkdir $HOME
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
DATA_DIR=/scratch/engstrom/imagenet-data
bazel build //inception:download_and_preprocess_imagenet
bazel-bin/inception/download_and_preprocess_imagenet "${DATA_DIR}"

