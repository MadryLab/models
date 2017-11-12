#!/bin/bash
set -e

echo "imagenet code: \"8bG]%4\"\`-k\""
export HOME=/scratch/engstrom/dummy_home
mkdir $HOME
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
DATA_DIR=/scratch/engstrom/imagenet-data

rm -rf $DATA_DIR
mkdir $DATA_DIR

cd ../
bazel build slim/download_and_convert_imagenet

# run it
bazel-bin/slim/download_and_convert_imagenet "${DATA_DIR}"
