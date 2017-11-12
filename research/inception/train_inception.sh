#!/bin/bash
echo "imagenet code: \"8bG]%4\"\`-k\""
export HOME=/scratch/engstrom/dummy_home
mkdir $HOME
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

# arg 1: int specifying preprocessing procedure

DATA_DIR=/scratch/engstrom/imagenet-data
TRAIN_DIR=/scratch/engstrom/imagenet_train_$1

mkdir $TRAIN_DIR
mkdir $DATA_DIR
export CUDA_VISIBLE_DEVICES="0,1,2,3,4,5,6,7"

bazel clean
bazel build //inception:imagenet_train
bazel-bin/inception/imagenet_train --num_gpus=8 --batch_size=256 --train_dir=$TRAIN_DIR --data_dir=$DATA_DIR --preproc_type $1 --max_steps 100000

