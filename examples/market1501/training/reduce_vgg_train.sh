#!/usr/bin/env sh
# This script test four voc images using faster rcnn end-to-end trained model (ZF-Model)
set -e
if [ ! -n "$1" ] ;then
    echo "\$1 is empty, default is 0"
    gpu=0
else
    echo "use $1-th gpu"
    gpu=$1
fi

CAFFE=build/tools/caffe
MODEL=models/market1501/vgg_reduce

GLOG_log_dir=$MODEL/log $CAFFE train \
    --gpu $gpu \
    --solver models/market1501/vgg_reduce/solver.proto \
    --weights models/pretrain_model/VGG_ILSVRC_16_layers_fc_reduced.caffemodel
