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

python train_image_classifier.py \
    --train_dir=${TRAIN_DIR} \
    --dataset_name=imagenet \
    --dataset_split_name=train \
    --dataset_dir=${DATASET_DIR} \
    --model_name=inception_v3 \
    --num_clones=8 \
    --batch_size=32 \
    --preproc_type=$1 \
    --learning_rate_decay_factor=0.16 \
    --num_epochs_per_delay=30 \
    --max_number_of_steps=100000
